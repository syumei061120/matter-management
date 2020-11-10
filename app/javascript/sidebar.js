if (document.URL.match(/users\/(\d+)$/)){
  document.addEventListener('DOMContentLoaded', function () {
    const userInformationLink = document.getElementById("user-information-link")
    userInformationLink.setAttribute("style", "color:#7FFF00;")
  });
}

if (document.URL.match(/matters\/(\d+)$/)) {
  document.addEventListener('DOMContentLoaded', function () {
    const matterInformation = document.getElementById("matter-information-link");
    matterInformation.setAttribute("style", "color:#00ffff;");
  });
}

if (document.URL.match(/clients$/)) {
  document.addEventListener('DOMContentLoaded', function () {
    const matterInformation = document.getElementById("matter-information-link");
    const clientListLink = document.getElementById("client-list-link");
    matterInformation.setAttribute("style", "#fff;");
    clientListLink.setAttribute("style", "color:#00ffff;");
  });
}

if (document.URL.match(/business_talk_records$/)) {
  document.addEventListener('DOMContentLoaded', function () {
    const matterInformation = document.getElementById("matter-information-link");
    const businessTalkRecordListLink = document.getElementById("business_talk_record-list-link");
    matterInformation.setAttribute("style", "#fff;");
    businessTalkRecordListLink.setAttribute("style", "color:#00ffff;");
  });
}