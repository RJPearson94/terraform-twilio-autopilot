package test

import (
	"fmt"

	"github.com/google/uuid"
	"github.com/gruntwork-io/terratest/modules/terraform"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Given the autopilot module", func() {
	assistantName := fmt.Sprintf("single-task-example-%s", uuid.New().String())

	singleTaskTfOptions := &terraform.Options{
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"assistant_name": assistantName,
		},
		VarFiles: []string{
			"./test/testdata/single_task.tfvars",
		},
	}

	defer terraform.Destroy(GinkgoT(), singleTaskTfOptions)
	terraform.InitAndApply(GinkgoT(), singleTaskTfOptions)

	Describe("When an assistant with 1 task and 1 sample has been created", func() {
		outputs := terraform.OutputAll(GinkgoT(), singleTaskTfOptions)

		It("Then the assistant output should be present", func() {
			Expect(outputs).Should(HaveKey("assistant"))
		})

		It("Then the webhooks output should be present", func() {
			Expect(outputs).Should(HaveKey("webhooks"))
		})

		It("Then the tasks output should be present", func() {
			Expect(outputs).Should(HaveKey("tasks"))
		})

		It("Then the model_build output should be present", func() {
			Expect(outputs).Should(HaveKey("model_build"))
		})
	})

	Describe("When another sample is added", func() {
		multipleTasksTfOptions := &terraform.Options{
			TerraformDir: "..",
			Vars: map[string]interface{}{
				"assistant_name": assistantName,
			},
			VarFiles: []string{
				"./test/testdata/multiple_samples_task.tfvars",
			},
		}

		terraform.Apply(GinkgoT(), multipleTasksTfOptions)
		output := terraform.Output(GinkgoT(), singleTaskTfOptions, "tasks")

		It("Then the tasks output should be present", func() {
			Expect(output).ToNot(BeNil())
		})
	})

	Describe("When the additional sample is removed", func() {
		multipleTasksTfOptions := &terraform.Options{
			TerraformDir: "..",
			Vars: map[string]interface{}{
				"assistant_name": assistantName,
			},
			VarFiles: []string{
				"./test/testdata/single_task.tfvars",
			},
		}

		terraform.Apply(GinkgoT(), multipleTasksTfOptions)
		output := terraform.Output(GinkgoT(), singleTaskTfOptions, "tasks")

		It("Then the tasks output should be present", func() {
			Expect(output).ToNot(BeNil())
		})
	})

	Describe("When another task is added", func() {
		multipleTasksTfOptions := &terraform.Options{
			TerraformDir: "..",
			Vars: map[string]interface{}{
				"assistant_name": assistantName,
			},
			VarFiles: []string{
				"./test/testdata/multiple_tasks.tfvars",
			},
		}

		terraform.Apply(GinkgoT(), multipleTasksTfOptions)
		output := terraform.Output(GinkgoT(), singleTaskTfOptions, "tasks")

		It("Then the tasks output should be present", func() {
			Expect(output).ToNot(BeNil())
		})
	})

	Describe("When the additional task is removed", func() {
		terraform.Apply(GinkgoT(), singleTaskTfOptions)
		output := terraform.Output(GinkgoT(), singleTaskTfOptions, "tasks")

		It("Then the tasks output should be present", func() {
			Expect(output).ToNot(BeNil())
		})
	})
})
