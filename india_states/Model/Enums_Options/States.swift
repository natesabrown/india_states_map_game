//
//  States.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import Foundation

let ANDHRA_PRADESH = InState(
  name: "Andhra Pradesh",
  img_id: "Andhra_Pradesh_2_",
  officialLangs: [.TELUGU],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ap", attr: "Adityamadhav83"),
  capitals: ("Visakhapatnam", "Amaravati", "Kurnool")
)
let ARUNACHAL_PRADESH = InState(
  name: "Arunachal Pradesh",
  img_id: "arunachal_pradesh_1_",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ap2", attr: "Jim Ankan Deka"),
  capitals: ("Itanagar", "Itanagar", "Guwahati")
) 
let ASSAM = InState(
  name: "Assam",
  img_id: "assam_1_",
  officialLangs: [.ASSAMESE],
  secondLangs: [.BENGALI, .BODO],
  image: InImage(license_type: .CC_BY_SA_4, source: "as", attr: "Nejib Ahmed"),
  capitals: ("Dispur", "Dispur", "Guwahati")
)
let BIHAR = InState(
  name: "Bihar",
  img_id: "bihar_1_",
  officialLangs: [.HINDI],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_2, source: "bi", attr: "Chandan Singh"),
  capitals: ("Patna", "Patna", "Patna")
)
let CHHATTISGARH = InState(
  name: "Chhattisgarh",
  img_id: "chhattisgarh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.CHHATTISGARHI],
  image: InImage(license_type: .CC_BY_SA_3, source: "ch", attr: "Mohnish1208"),
  capitals: ("Naya Raipur", "Raipur", "Bilaspur")
)
let GOA = InState(
  name: "Goa",
  img_id: "Goa_1_",
  officialLangs: [.KONKANI, .ENGLISH],
  secondLangs: [.MARATHI],
  image: InImage(license_type: .CC_BY_SA_2, source: "go", attr: "Mikhail Esteves"),
  capitals: ("Panaji", "Porvorim", "Mumbai")
)
let GUJARAT = InState(
  name: "Gujarat",
  img_id: "gujarat_1_",
  officialLangs: [.GUJARATI],
  secondLangs: [.HINDI],
  image: InImage(license_type: .CC_BY_SA_4, source: "gu", attr: "Kshitij Charania"),
  capitals: ("Gandhinagar", "Gandhinagar", "Amedabad")
)
let HARYANA = InState(
  name: "Haryana",
  img_id: "haryana_1_",
  officialLangs: [.HINDI],
  secondLangs: [.ENGLISH, .PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "ha", attr: "Tarun4u"),
  capitals: ("Chandigarh", "Chandigarh", "Chandigarh")
)
let HIMACHAL_PRADESH = InState(
  name: "Himachal Pradesh",
  img_id: "himachal_pradesh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.SANSKRIT],
  image: InImage(license_type: .CC_BY_SA_4, source: "hp", attr: "Jane DSouza"),
  capitals: ("Shimla", "Shimla/Dharamsala", "Shimla")
)
let JHARKHAND = InState(
  name: "Jharkhand",
  img_id: "jharkhand_1_",
  officialLangs: [.HINDI],
  secondLangs: [.ANGIKA, .BENGALI, .BHOJPURI, .HO, .KHARIA, .KHORTHA, .KURMALI, .KURUKH, .MAGAHI, .MAITHILI, .MUNDARI, .NAGPURI, .ODIA, .SANTALI, .URDU],
  image: InImage(license_type: .CC_BY_SA_4, source: "jh", attr: "Vikashkumarnag399"),
  capitals: ("Ranchi", "Ranchi", "Ranchi")
)
let KARNATAKA = InState(
  name: "Karnataka",
  img_id: "Karnataka_1_",
  officialLangs: [.KANNADA],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .GDFL102, source: "ka", attr: "Muhammad Mahdi Karim"),
  capitals: ("Bengaluru", "Bengaluru", "Bengaluru")
)
let KERALA = InState(
  name: "Kerala",
  img_id: "Kerala_1_",
  officialLangs: [.MALAYALAM],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ke", attr: "Jan Joseph George"),
  capitals: ("Thiruvanathapuram", "Thiruvanathapuram", "Kochi")
)
let MADHYA_PRADESH = InState(
  name: "Madhya Pradesh",
  img_id: "madhya_pradesh_1_",
  officialLangs: [.HINDI],
  image: InImage(license_type: .CC_BY_SA_3, source: "mp", attr: "Adarshj4"),
  capitals: ("Bhopal", "Bhopal", "Jabalpur")
)
let MAHARASHTRA = InState(
  name: "Maharashtra",
  img_id: "maharashtra_1_",
  officialLangs: [.MARATHI],
  image: InImage(license_type: .CC_BY_SA_2, source: "ma", attr: "nikkul"),
  capitals: ("Mumbai", "Mumbai/Nagpur", "Mumbai")
)
let MANIPUR = InState(
  name: "Manipur",
  img_id: "manipur_1_",
  officialLangs: [.MANIPURI],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ma2", attr: "Anilkumar Yumnam"),
  capitals: ("Imphal", "Imphal", "Imphal")
)
let MEGHALAYA = InState(
  name: "Meghalaya",
  img_id: "meghalaya_1_",
  officialLangs: [.ENGLISH],
  secondLangs: [.KHASI, .GARO],
  image: InImage(license_type: .CC_BY_SA_4, source: "me", attr: "Chirnzb"),
  capitals: ("Shillong", "Shillong", "Shillong")
)
let MIZORAM = InState(
  name: "Mizoram",
  img_id: "mizoram_1_",
  officialLangs: [.MIZO],
  secondLangs: [.ENGLISH, .HINDI],
  image: InImage(license_type: .CC_BY_SA_3, source: "mi", attr: "Bogman"),
  capitals: ("Aizawl", "Aizawl", "Guwahati")
)
let NAGALAND = InState(
  name: "Nagaland",
  img_id: "nagaland_1_",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "na", attr: "Suduvelu Rhakho"),
  capitals: ("Kohima", "Kohima", "Guwahati")
)
let ODISHA = InState(
  name: "Odisha",
  img_id: "orissa_1_",
  officialLangs: [.ODIA],
  image: InImage(license_type: .CC_BY_SA_4, source: "od", attr: "Supgiri"),
  capitals: ("Bhubaneswar", "Bhubaneswar", "Cuttack")
)
let PUNJAB = InState(
  name: "Punjab",
  img_id: "punjab_1_",
  officialLangs: [.PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "pu", attr: "Utpal Nag"),
  capitals: ("Chandigarh", "Chandigarh", "Chandigarh")
)
let RAJASTHAN = InState(
  name: "Rajasthan",
  img_id: "rajasthan_1_",
  officialLangs: [.HINDI],
  image: InImage(license_type: nil, source: "ra", attr: nil),
  capitals: ("Jaipur", "Jaipur", "Jaipur")
)
let SIKKIM = InState(
  name: "Sikkim",
  img_id: "sikkim_1_",
  officialLangs: [.ENGLISH, .NEPALI, .SIKKIMESE, .LEPCHA],
  secondLangs: [.GURUNG, .LIMBU, .MAGAR, .MUKHIA, .NEWARI, .RAI, .SHERPA, .TAMANG],
  image: InImage(license_type: .CC_BY_SA_4, source: "si", attr: "Bernard Gagnon"),
  capitals: ("Gangtok", "Gangtok", "Gangtok")
)
let TAMIL_NADU = InState(
  name: "Tamil Nadu",
  img_id: "Tamil_Nadu_1_",
  officialLangs: [.TAMIL],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_2, source: "ta", attr: "Jean-Pierre Dalbéra"),
  capitals: ("Chennai", "Chennai", "Chennai")
)
let TELANGANA = InState(
  name: "Telangana",
  img_id: "path3007", // lol
  officialLangs: [.TELUGU],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_2, source: "te", attr: "peculiar235"),
  capitals: ("Hyderabad", "Hyderabad", "Hyderabad")
)
let TRIPURA = InState(
  name: "Tripura",
  img_id: "tripura_1_",
  officialLangs: [.BENGALI, .ENGLISH, .KOKBOROK],
  image: InImage(license_type: .CC_BY_SA_4, source: "tr", attr: "Babulmiah12"),
  capitals: ("Agartala", "Agartala", "Agartala")
)
let UTTAR_PRADESH = InState(
  name: "Uttar Pradesh",
  img_id: "uttar_pradesh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_3, source: "up", attr: "Mohandoss Sampath"),
  capitals: ("Lucknow", "Lucknow", "Prayagraj")
)
let UTTARAKHAND = InState(
  name: "Uttarakhand",
  img_id: "uttaranchal_1_",
  officialLangs: [.HINDI],
  secondLangs: [.SANSKRIT],
  image: InImage(license_type: .CC_BY_SA_3, source: "ut", attr: "Folwer&fowler"),
  capitals: ("Gairsain/Dehradun", "Gairsain/Dehradun", "Nainital")
)
let WEST_BENGAL = InState(
  name: "West Bengal",
  img_id: "west_bengal_1_",
  officialLangs: [.BENGALI, .ENGLISH],
  secondLangs: [.NEPALI, .URDU, .HINDI, .ODIA, .SANTALI, .PUNJABI, .KAMTAPURI, .RAJBANSHI, .KURMALI, .KURUKH, .TELUGU],
  image: InImage(license_type: .CC_BY_SA_3, source: "wb", attr: "Shubhankar.sengupta19"),
  capitals: ("Kolkata", "Kolkata", "Kolkata")
)

let STATES = [ANDHRA_PRADESH, ARUNACHAL_PRADESH, ASSAM, BIHAR, CHHATTISGARH, GOA, GUJARAT, HARYANA, HIMACHAL_PRADESH, JHARKHAND, KARNATAKA, KERALA, MADHYA_PRADESH, MAHARASHTRA, MANIPUR, MEGHALAYA, MIZORAM, NAGALAND, ODISHA, PUNJAB, RAJASTHAN, SIKKIM, TAMIL_NADU, TELANGANA, TRIPURA, UTTAR_PRADESH, UTTARAKHAND, WEST_BENGAL]

let ANDAMAN_AND_NICOBAR_ISLANDS = InState(
  name: "Andaman and Nicobar Islands",
  img_id: "andaman_x5F_new",
  officialLangs: [.HINDI, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ani", attr: "Shefali mithra"),
  capitals: ("Port Blair", nil, "Kolkata"),
  bordered: true
)
let CHANDIGARH = InState(
  name: "Chandigarh",
  img_id: "chandigarh_x5F_new",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_2, source: "ch2", attr: "duncid"),
  capitals: ("Chandigarh", nil, "Chandigarh"),
  bordered: true
)
let DADRA_AND_NAGAR_HAVELI_AND_DAMAN_AND_DIU = InState(
  name: "Dadra and Nagar Haveli and Daman and Diu",
  img_id: "dadra_x5F_new_x5F_group",
  officialLangs: [.GUJARATI, .KONKANI, .MARATHI, .HINDI],
  image: InImage(license_type: .CC_BY_SA_2, source: "dnhdd", attr: "Sharada Prasad CS"),
  capitals: ("Daman", nil, "Mumbai"),
  bordered: true
)
let DELHI = InState(
  name: "Delhi",
  img_id: "delhi_ncr_1_",
  officialLangs: [.HINDI, .ENGLISH],
  secondLangs: [.URDU, .PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "de", attr: "Hemant banswal"),
  capitals: ("New Delhi", "New Delhi", "New Delhi")
)
let JAMMU_AND_KASHMIR = InState(
  name: "Jammu and Kashmir",
  img_id: "path4731",
  officialLangs: [.KASHMIRI, .DOGRI, .HINDI, .URDU, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "jk", attr: "Illyas Ahmed"),
  capitals: ("Srinagar/Jammu", "Srinagar/Jammu", "Srinagar/Jammu")
)
let LADAKH = InState(
  name: "Ladakh",
  img_id: "path3787",
  officialLangs: [.HINDI, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_3, source: "la", attr: "Narender9"),
  capitals: ("Leh/Kargil", nil, "Srinagar/Jammu")
)
let LAKSHADWEEP = InState(
  name: "Lakshadweep",
  img_id: "lakshadweep_x5F_new",
  officialLangs: [.MALAYALAM],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "la2", attr: "Asssagar"),
  capitals: ("Kavaratti", nil, "Kochi"),
  bordered: true
)
let PUDUCHERRY = InState(
  name: "Puducherry",
  img_id: "puducherry_x5F_new_x5F_group",
  officialLangs: [.TAMIL, .FRENCH, .ENGLISH],
  secondLangs: [.TELUGU, .MALAYALAM],
  image: InImage(license_type: .CC_BY_SA_3, source: "pu2", attr: "Karthik Easvur"),
  capitals: ("Pondicherry", "Pondicherry", "Pondicherry"),
  bordered: true
)

let UNION_TERRITORIES = [ANDAMAN_AND_NICOBAR_ISLANDS, CHANDIGARH, DADRA_AND_NAGAR_HAVELI_AND_DAMAN_AND_DIU, DELHI, JAMMU_AND_KASHMIR, LADAKH, LAKSHADWEEP, PUDUCHERRY]

let STATES_UT = STATES + UNION_TERRITORIES
