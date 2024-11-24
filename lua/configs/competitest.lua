require("competitest").setup {
  received_contests_directory = "$(HOME)/Coding/competitive/$(JUDGE)/$(CONTEST)",
  received_problems_path = "$(HOME)/Coding/competitive/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
  template_file = "~/Coding/competitive/template.$(FEXT)",
}
