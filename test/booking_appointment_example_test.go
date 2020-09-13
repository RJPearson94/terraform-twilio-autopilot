package test

import (
	"log"
	"os"

	"github.com/RJPearson94/twilio-sdk-go"
	"github.com/RJPearson94/twilio-sdk-go/service/autopilot/v1/assistant/queries"
	"github.com/RJPearson94/twilio-sdk-go/session/credentials"
	"github.com/gruntwork-io/terratest/modules/terraform"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Given the appointment booking example", func() {

	tfOptions := &terraform.Options{
		TerraformDir: "../examples/appointment_booking",
	}

	defer terraform.Destroy(GinkgoT(), tfOptions)
	terraform.InitAndApply(GinkgoT(), tfOptions)

	creds, err := credentials.New(credentials.Account{
		Sid:       os.Getenv("TWILIO_ACCOUNT_SID"),
		AuthToken: os.Getenv("TWILIO_AUTH_TOKEN"),
	})
	if err != nil {
		log.Panicf("%s", err.Error())
	}

	assistantSid := terraform.Output(GinkgoT(), tfOptions, "assistant_sid")
	queriesClient := twilio.NewWithCredentials(creds).Autopilot.V1.Assistant(assistantSid).Queries

	Describe("When I query the the greeting task", func() {
		bookAppointmentResp, bookAppointmentErr := queriesClient.Create(&queries.CreateQueryInput{
			Language: "en-US",
			Query:    "hello",
		})

		It("Then no error should be returned", func() {
			Expect(bookAppointmentErr).To(BeNil())
		})

		It("Then result task should be book_appointments", func() {
			Expect(bookAppointmentResp).ToNot(BeNil())
			Expect(bookAppointmentResp.Results.Task).To(Equal("greeting"))
		})
	})

	Describe("When I query the book appointment task", func() {
		bookAppointmentResp, bookAppointmentErr := queriesClient.Create(&queries.CreateQueryInput{
			Language: "en-US",
			Query:    "book appointment",
		})

		It("Then no error should be returned", func() {
			Expect(bookAppointmentErr).To(BeNil())
		})

		It("Then result task should be book_appointments", func() {
			Expect(bookAppointmentResp).ToNot(BeNil())
			Expect(bookAppointmentResp.Results.Task).To(Equal("book_appointments"))
		})
	})
})
