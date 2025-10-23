Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)
SensorSchedule = SensorSchedule(enabled = False)

with DAG(Schedule = Schedule, SensorSchedule = SensorSchedule):
    m1_0 = Task(task_id = "m1_0", component = "Model", modelName = "m1")
    seed2 = Task(
        task_id = "seed2", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "seed2", "sourceType" : "Seed", "alias" : ""}
    )
    pi123__fuzzy_match_accounts = Task(
        task_id = "pi123__fuzzy_match_accounts", 
        component = "Model", 
        modelName = "pi123__fuzzy_match_accounts"
    )
    seed2.out >> pi123__fuzzy_match_accounts.in_0
