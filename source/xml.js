class XML {
  constructor(datas) {
    this.datas = datas.map((item) => ({
      id: item.id.toString(),
      externalId: item.externalId.toString(),
      courseNumber: item.courseNumber.toString(),
      courseTitle: item.courseTitle.toString(),
      courseAbbr: item.courseAbbr.toString(),
    }))
  }

  makeOffering = ({ externalId, id, courseNumber, courseTitle, courseAbbr }) => {
    return `
<offering id="${externalId}" offered="true" action="insert">
  <course id="${id}" subject="${courseAbbr}" courseNbr="${courseNumber}" controlling="true" title="${courseTitle}">
    <courseCredit creditType="collegiate" creditUnitType="semesterHours" creditFormat="fixedUnit" fixedCredit="3.0"/>
  </course>
  <config name="1" limit="10" durationType="MIN_PER_WEEK">
    <subpart type="Lec" suffix="" minPerWeek="50"/>
    <class id="${courseAbbr} ${courseNumber} Lec 1" type="Lec" suffix="1" limit="10" studentScheduling="true" displayInScheduleBook="true" cancelled="false"/>
  </config>
</offering>`
  }

  make = () => {
    let children = this.datas.map((item) => this.makeOffering(item))
    return `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE offerings PUBLIC "-//UniTime//DTD University Course Timetabling/EN" "http://www.unitime.org/interface/CourseOfferingExport.dtd">

<offerings term="222" year="2022" campus="hcmut">
${children.join("")}
</offerings>`
  }
}

module.exports = {
  XML: XML,
}
