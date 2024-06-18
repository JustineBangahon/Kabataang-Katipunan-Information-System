
ActiveRecord::Schema[7.0].define(version: 2024_05_27_023429) do
  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educationbgs", force: :cascade do |t|
    t.string "hea"
    t.string "elementary"
    t.string "highschool"
    t.string "college"
    t.string "course"
    t.string "educationstatus"
    t.text "ifoutofschool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kkmember_id"
    t.index ["kkmember_id"], name: "index_educationbgs_on_kkmember_id"
  end

  create_table "familybgs", force: :cascade do |t|
    t.string "father"
    t.string "fatherwork"
    t.string "solofather"
    t.string "mother"
    t.string "motherwork"
    t.string "solomother"
    t.integer "familymemberno"
    t.integer "bother"
    t.integer "sister"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "healthinfos", force: :cascade do |t|
    t.string "disabilities"
    t.string "medicalcondition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kkmembers", force: :cascade do |t|
    t.integer "personalinfo_id", null: false
    t.integer "educationbg_id"
    t.integer "familybg_id", null: false
    t.integer "healthinfo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workbg_id", null: false
    t.integer "purok_id"
    t.index ["educationbg_id"], name: "index_kkmembers_on_educationbg_id"
    t.index ["familybg_id"], name: "index_kkmembers_on_familybg_id"
    t.index ["healthinfo_id"], name: "index_kkmembers_on_healthinfo_id"
    t.index ["personalinfo_id"], name: "index_kkmembers_on_personalinfo_id"
    t.index ["purok_id"], name: "index_kkmembers_on_purok_id"
    t.index ["workbg_id"], name: "index_kkmembers_on_workbg_id"
  end

  create_table "personalinfos", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "middlename"
    t.integer "age"
    t.string "sex"
    t.date "birthdate"
    t.string "civilstatus"
    t.integer "contactno"
    t.string "emailaddress"
    t.string "purok"
    t.string "address"
    t.string "nationality"
    t.string "registeredvoter"
    t.string "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puroks", force: :cascade do |t|
    t.string "purokname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workbgs", force: :cascade do |t|
    t.string "work"
    t.string "agency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "educationbgs", "kkmembers"
  add_foreign_key "kkmembers", "educationbgs"
  add_foreign_key "kkmembers", "familybgs"
  add_foreign_key "kkmembers", "healthinfos"
  add_foreign_key "kkmembers", "personalinfos"
  add_foreign_key "kkmembers", "puroks"
  add_foreign_key "kkmembers", "workbgs"
end
