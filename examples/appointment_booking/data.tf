data "javascript" "task_mapper" {
  source = file("${path.module}/helper/taskMapper.js")

  vars = {
    input = [for filePath in fileset(path.module, "tasks/*.json") : file(filePath)]
  }
}
