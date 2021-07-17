//
//  State.swift
//  india_states
//
//  Created by Nate Brown on 7/14/21.
//

import Foundation

struct InState: Equatable, Hashable {
  static func == (lhs: InState, rhs: InState) -> Bool {
    lhs.img_id == rhs.img_id
  }
  func hash(into hasher: inout Hasher) {
      hasher.combine(img_id)
  }
  
  let name: String
  let img_id: String
  
  let officialLangs: [IndiaLanguage]
  var secondLangs: [IndiaLanguage]?
  
  let image: InImage
}

struct StateData: Codable {
  var img_id: String
  var correct: Int
  var incorrect: Int
}

struct InImage {
  var license_type: License? = .CC_BY_SA_4
  var source: String
  var attr: String?
}

// https://www.jagranjosh.com/general-knowledge/list-of-official-languages-of-indian-states-and-union-territories-1624022980-1
enum IndiaLanguage: String {
  case ENGLISH = "English"
  case TELUGU = "Telugu"
  case ASSAMESE = "Asssamese"
  case HINDI = "Hindi"
  case BENGALI = "Bengali"
  case BODO = "Bodo"
  case URDU = "Urdu"
  case CHHATTISGARHI = "Chhattisgarhi"
  case KONKANI = "Konkani"
  case MARATHI = "Marathi"
  case GUJARATI = "Gujarati"
  case PUNJABI = "Punjabi"
  case SANSKRIT = "Sanskrit"
  case ANGIKA = "Angika"
  case BHOJPURI = "Bhojpuri"
  case HO = "Ho"
  case KHARIA = "Kharia"
  case KHORTHA = "Khortha"
  case KURMALI = "Kurmali"
  case KURUKH = "Kurukh"
  case MAGAHI = "Magahi"
  case MAITHILI = "Maithili"
  case MUNDARI = "Mundari"
  case NAGPURI = "Nagpuri"
  case ODIA = "Odia"
  case SANTALI = "Santali"
  case KANNADA = "Kannada"
  case MALAYALAM = "Malayalam"
  case MANIPURI = "Mainpuri"
  case KHASI = "Khasi"
  case GARO = "Garo"
  case MIZO = "Mizo"
  case NEPALI = "Nepali"
  case SIKKIMESE = "Sikkimese"
  case LEPCHA = "Lepcha"
  case GURUNG = "Gurung"
  case LIMBU = "Limbu"
  case MAGAR = "Magar"
  case MUKHIA = "Mukhia"
  case NEWARI = "Newari"
  case RAI = "Rai"
  case SHERPA = "Sherpa"
  case TAMANG = "Tamang"
  case TAMIL = "Tamil"
  case KOKBOROK = "Kokborok"
  case KAMTAPURI = "Kamptapuri"
  case RAJBANSHI = "Rajbanshi"
  case KASHMIRI = "Kashmiri"
  case DOGRI = "Dogri"
  case FRENCH = "French"
}

enum License: String {
  case CC_BY_SA_4 = "https://creativecommons.org/licenses/by-sa/4.0/"
  case CC_BY_SA_3 = "https://creativecommons.org/licenses/by-sa/3.0"
  case CC_BY_SA_2 = "https://creativecommons.org/licenses/by/2.0/"
  case GDFL102 = "http://www.gnu.org/licenses/old-licenses/fdl-1.2.html"
}

let ANDHRA_PRADESH = InState(
  name: "Andhra Pradesh",
  img_id: "Andhra_Pradesh_2_",
  officialLangs: [.TELUGU],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ap", attr: "Adityamadhav83")
)
let ARUNACHAL_PRADESH = InState(
  name: "Arunachal Pradesh",
  img_id: "arunachal_pradesh_1_",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ap2", attr: "Jim Ankan Deka")
)
let ASSAM = InState(
  name: "Assam",
  img_id: "assam_1_",
  officialLangs: [.ASSAMESE],
  secondLangs: [.BENGALI, .BODO],
  image: InImage(license_type: .CC_BY_SA_4, source: "as", attr: "Nejib Ahmed")
)
let BIHAR = InState(
  name: "Bihar",
  img_id: "bihar_1_",
  officialLangs: [.HINDI],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_2, source: "bi", attr: "Chandan Singh")
)
let CHHATTISGARH = InState(
  name: "Chhattisgarh",
  img_id: "chhattisgarh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.CHHATTISGARHI],
  image: InImage(license_type: .CC_BY_SA_3, source: "ch", attr: "Mohnish1208")
)
let GOA = InState(
  name: "Goa",
  img_id: "Goa_1_",
  officialLangs: [.KONKANI, .ENGLISH],
  secondLangs: [.MARATHI],
  image: InImage(license_type: .CC_BY_SA_2, source: "go", attr: "Mikhail Esteves")
)
let GUJARAT = InState(
  name: "Gujarat",
  img_id: "gujarat_1_",
  officialLangs: [.GUJARATI],
  secondLangs: [.HINDI],
  image: InImage(license_type: .CC_BY_SA_4, source: "gu", attr: "Kshitij Charania")
)
let HARYANA = InState(
  name: "Haryana",
  img_id: "haryana_1_",
  officialLangs: [.HINDI],
  secondLangs: [.ENGLISH, .PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "ha", attr: "Tarun4u")
)
let HIMACHAL_PRADESH = InState(
  name: "Himachal Pradesh",
  img_id: "himachal_pradesh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.SANSKRIT],
  image: InImage(license_type: .CC_BY_SA_4, source: "hp", attr: "Jane DSouza")
)
let JHARKHAND = InState(
  name: "Jharkhand",
  img_id: "jharkhand_1_",
  officialLangs: [.HINDI],
  secondLangs: [.ANGIKA, .BENGALI, .BHOJPURI, .HO, .KHARIA, .KHORTHA, .KURMALI, .KURUKH, .MAGAHI, .MAITHILI, .MUNDARI, .NAGPURI, .ODIA, .SANTALI, .URDU],
  image: InImage(license_type: .CC_BY_SA_4, source: "jh", attr: "Vikashkumarnag399")
)
let KARNATAKA = InState(
  name: "Karnataka",
  img_id: "Karnataka_1_",
  officialLangs: [.KANNADA],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .GDFL102, source: "ka", attr: "Muhammad Mahdi Karim")
)
let KERALA = InState(
  name: "Kerala",
  img_id: "Kerala_1_",
  officialLangs: [.MALAYALAM],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ke", attr: "Jan Joseph George")
)
let MADHYA_PRADESH = InState(
  name: "Madhya Pradesh",
  img_id: "madhya_pradesh_1_",
  officialLangs: [.HINDI],
  image: InImage(license_type: .CC_BY_SA_3, source: "mp", attr: "Adarshj4")
)
let MAHARASHTRA = InState(
  name: "Maharashtra",
  img_id: "maharashtra_1_",
  officialLangs: [.MARATHI],
  image: InImage(license_type: .CC_BY_SA_2, source: "ma", attr: "nikkul")
)
let MANIPUR = InState(
  name: "Manipur",
  img_id: "manipur_1_",
  officialLangs: [.MANIPURI],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ma2", attr: "Anilkumar Yumnam")
)
let MEGHALAYA = InState(
  name: "Meghalaya",
  img_id: "meghalaya_1_",
  officialLangs: [.ENGLISH],
  secondLangs: [.KHASI, .GARO],
  image: InImage(license_type: .CC_BY_SA_4, source: "me", attr: "Chirnzb")
)
let MIZORAM = InState(
  name: "Mizoram",
  img_id: "mizoram_1_",
  officialLangs: [.MIZO],
  secondLangs: [.ENGLISH, .HINDI],
  image: InImage(license_type: .CC_BY_SA_3, source: "mi", attr: "Bogman")
)
let NAGALAND = InState(
  name: "Nagaland",
  img_id: "nagaland_1_",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "na", attr: "Suduvelu Rhakho")
)
let ODISHA = InState(
  name: "Odisha",
  img_id: "orissa_1_",
  officialLangs: [.ODIA],
  image: InImage(license_type: .CC_BY_SA_4, source: "od", attr: "Supgiri")
)
let PUNJAB = InState(
  name: "Punjab",
  img_id: "punjab_1_",
  officialLangs: [.PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "pu", attr: "Utpal Nag")
)
let RAJASTHAN = InState(
  name: "Rajasthan",
  img_id: "rajasthan_1_",
  officialLangs: [.HINDI],
  image: InImage(license_type: nil, source: "ra", attr: nil)
)
let SIKKIM = InState(
  name: "Sikkim",
  img_id: "sikkim_1_",
  officialLangs: [.ENGLISH, .NEPALI, .SIKKIMESE, .LEPCHA],
  secondLangs: [.GURUNG, .LIMBU, .MAGAR, .MUKHIA, .NEWARI, .RAI, .SHERPA, .TAMANG],
  image: InImage(license_type: .CC_BY_SA_4, source: "si", attr: "Bernard Gagnon")
)
let TAMIL_NADU = InState(
  name: "Tamil Nadu",
  img_id: "Tamil_Nadu_1_",
  officialLangs: [.TAMIL],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_2, source: "ta", attr: "Jean-Pierre Dalbéra")
)
let TELANGANA = InState(
  name: "Telangana",
  img_id: "path3007", // lol
  officialLangs: [.TELUGU],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_2, source: "te", attr: "peculiar235")
)
let TRIPURA = InState(
  name: "Tripura",
  img_id: "tripura_1_",
  officialLangs: [.BENGALI, .ENGLISH, .KOKBOROK],
  image: InImage(license_type: .CC_BY_SA_4, source: "tr", attr: "Babulmiah12")
)
let UTTAR_PRADESH = InState(
  name: "Uttar Pradesh",
  img_id: "uttar_pradesh_1_",
  officialLangs: [.HINDI],
  secondLangs: [.URDU],
  image: InImage(license_type: .CC_BY_SA_3, source: "up", attr: "Mohandoss Sampath")
)
let UTTARAKHAND = InState(
  name: "Uttarakhand",
  img_id: "uttaranchal_1_",
  officialLangs: [.HINDI],
  secondLangs: [.SANSKRIT],
  image: InImage(license_type: .CC_BY_SA_3, source: "ut", attr: "Folwer&fowler")
)
let WEST_BENGAL = InState(
  name: "West Bengal",
  img_id: "west_bengal_1_",
  officialLangs: [.BENGALI, .ENGLISH],
  secondLangs: [.NEPALI, .URDU, .HINDI, .ODIA, .SANTALI, .PUNJABI, .KAMTAPURI, .RAJBANSHI, .KURMALI, .KURUKH, .TELUGU],
  image: InImage(license_type: .CC_BY_SA_3, source: "wb", attr: "Shubhankar.sengupta19")
)
let STATES = [ANDHRA_PRADESH, ARUNACHAL_PRADESH, ASSAM, BIHAR, CHHATTISGARH, GOA, GUJARAT, HARYANA, HIMACHAL_PRADESH, JHARKHAND, KARNATAKA, KERALA, MADHYA_PRADESH, MAHARASHTRA, MANIPUR, MEGHALAYA, MIZORAM, NAGALAND, ODISHA, PUNJAB, RAJASTHAN, SIKKIM, TAMIL_NADU, TELANGANA, TRIPURA, UTTAR_PRADESH, UTTARAKHAND, WEST_BENGAL]

let ANDAMAN_AND_NICOBAR_ISLANDS = InState(
  name: "Andaman and Nicobar Islands",
  img_id: "andaman_and_nicobar_1_",
  officialLangs: [.HINDI, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "ani", attr: "Shefali mithra")
)
let CHANDIGARH = InState(
  name: "Chandigarh",
  img_id: "chandigarh_1_",
  officialLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_2, source: "ch2", attr: "duncid")
)
let DADRA_AND_NAGAR_HAVELI_AND_DAMAN_AND_DIU = InState(
  name: "Dadra and Nagar Haveli and Daman and Diu",
  img_id: "dadra_and_nagar_haveli_1_",
  officialLangs: [.GUJARATI, .KONKANI, .MARATHI, .HINDI],
  image: InImage(license_type: .CC_BY_SA_2, source: "dnhdd", attr: "Sharada Prasad CS")
)
let DELHI = InState(
  name: "Delhi",
  img_id: "delhi_ncr_1_",
  officialLangs: [.HINDI, .ENGLISH],
  secondLangs: [.URDU, .PUNJABI],
  image: InImage(license_type: .CC_BY_SA_4, source: "de", attr: "Hemant banswal")
)
let JAMMU_AND_KASHMIR = InState(
  name: "Jammu and Kashmir",
  img_id: "jammu_and_kashmir_1_",
  officialLangs: [.KASHMIRI, .DOGRI, .HINDI, .URDU, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "jk", attr: "Illyas Ahmed")
)
let LADAKH = InState(
  name: "Ladakh",
  img_id: "path3799",
  officialLangs: [.HINDI, .ENGLISH],
  image: InImage(license_type: .CC_BY_SA_3, source: "la", attr: "Narender9")
)
let LAKSHADWEEP = InState(
  name: "Lakshadweep",
  img_id: "path3781",
  officialLangs: [.MALAYALAM],
  secondLangs: [.ENGLISH],
  image: InImage(license_type: .CC_BY_SA_4, source: "la2", attr: "Asssagar")
)
let PUDUCHERRY = InState(
  name: "Puducherry",
  img_id: "yanam_pondicherry_1_ | pudducherry_pondicherry_1_ | karikal_pondicherry_1_ | mahe_pondicherry_1_",
  officialLangs: [.TAMIL, .FRENCH, .ENGLISH],
  secondLangs: [.TELUGU, .MALAYALAM],
  image: InImage(license_type: .CC_BY_SA_3, source: "pu2", attr: "Karthik Easvur")
)
let UNION_TERRITORIES = [ANDAMAN_AND_NICOBAR_ISLANDS, CHANDIGARH, DADRA_AND_NAGAR_HAVELI_AND_DAMAN_AND_DIU, DELHI, JAMMU_AND_KASHMIR, LADAKH, LAKSHADWEEP, PUDUCHERRY]

let STATES_UT = STATES + UNION_TERRITORIES
