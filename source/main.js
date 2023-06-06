const fs = require("fs")
const { XML } = require("./XML.js")
// console.log(require("./program-urls.json").filter(i => i.LINK != ""))

getCourses = () => {
  let courses = require("./courses.json")
  return courses.map((item) => {
    return {
      course_id: item.msmh,
      title: item.monhoc,
      title_en: item.course,
      requisite_str: item.dieukiendangky,
      credits: item.tinchi,
      dept_id: item.khoa,
    }
  })
}

getCourseById = (course_id) => {
  let results = getCourses().filter((c) => c.course_id === course_id)
  if (results.length > 0) return results[0]
  else {
    console.warn("Course not found: " + course_id)
    return null
  }
}

getAcademicPlan = (academicProgram) => {
  // TODO: load academic program correctly
  return require("./plan-cs.json").map((item) => {
    return {
      semester: item.semester,
      courses: item.courses,
      freeElective: item.freeElective || [],
    }
  })
}

getPlannedCourses = (semester, academicProgram) => {
  let plan = getAcademicPlan(academicProgram).filter((c) => c.semester === semester)[0]
  // TODO: handle free elective as well
  let { courses, freeElective } = plan
  return courses.map((c) => getCourseById(c))
}

// console.log(getCourses())
// console.log(getCourseById("CO1007"))
// console.log(getAcademicPlan("CS"))
// console.log(getPlannedCourses(6, "CS"))

function run() {
  const OFFSET_COURSE_INDEX = 165523

  // prepare courses
  let requisite = new Set()
  let all_courses = new Set()
  for (let term of getAcademicPlan("CS")) {
    for (let c of term.courses) {
      all_courses.add(c)
      // let courseInfo = getCourseById(c)
      // console.log(courseInfo)
      // if (courseInfo?.requisite_str) requisite.add(courseInfo.requisite_str)
    }
  }

  let result = Array.from(all_courses)
  result.sort()
  result = result.map(getCourseById).filter((i) => i != null)

  // print xml
  let datas = result.map((value, index) => convert(index + OFFSET_COURSE_INDEX, value))
  let xml = new XML(datas).make()
  console.log("writing..")
  fs.writeFileSync("../xml/blank2_courseOfferingImport.xml", xml)
  console.log("done")

  // console.log(Array.from(requisite))
}

function convert(index, c) {
  // course => datas item
  // c = {
  //   course_id: 'CH1003',
  //   title: 'Hóa đại cương',
  //   title_en: 'General Chemistry',
  //   requisite_str: '',
  //   credits: 3,
  //   dept_id: 'HC'
  // }
  return {
    id: index,
    externalId: c.course_id,
    courseAbbr: c.course_id.slice(0, 2),
    courseNumber: c.course_id.slice(2),
    courseTitle: c.title_en,
  }
}
run()
