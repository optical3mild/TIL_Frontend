//title에 이용할 시간정보 조합함수
  //timeArray: 조작할 시간정보 배열
  //index: 시간정보 배열에서 읽어올 시작 index
  //sepChar: 삽입할 구분자
  //strLength: 인자를 변환할 길이
function modifyTimeArray(timeArray, index, sepChar, strLength) {
  var emptyBox = [];
  var result;
  for(var i=index; i<timeArray.length; i++) {
    //문자열로 변환.
    var temp = ""+timeArray[i];
    if(temp == "") {
      emptyBox[i-index] = "00";
    } else if ((temp != "") && (temp.length < 2)) {
        emptyBox[i-index] = "0" + temp;
    } else if ((temp != "") && (temp.length > 2)) {
        var cutPoint = temp.length - strLength;
        emptyBox[i-index] = temp.slice(cutPoint);
    } else {
        emptyBox[i-index] = temp;
    }
  }
  if(sepChar != null){
    result = emptyBox.join(sepChar);
  } else {
    result = emptyBox.join('');
  }
  return result;
};

// 입력된 시간정보 값의 범위를 확인.
function checkRange(eleName,value) {
  if ((eleName.indexOf("Time") != -1) && (value >= 0) && (value <= 23)) {
    return "time";
  } else if ((eleName.indexOf("Min") != -1) && (value >= 0) && (value <= 59)) {
    return "min";
  } else {
    return "outOfRange";
  }
};

// 저장되어 있는 객체들의 id 조회, index추출하여 전역변수에 저장.
function searchEventId(objId) {
  var selectedItem = $("#calendar").data(id, objId);
  console.log("hover로 선택된 item: ");
  console.log(selectedItem);
};

//시간정보 분배함수
function createObj (startDay,endDay,startTime,endTime) {
  //일 수 계산 --> 객체생성 갯수.
  var countDay = endDay[2] - startDay[2];
  //시간정보 생성
  var newObjArray = new Array();
  var dayPoint = startDay[2];
  console.log("dayPoint: "+dayPoint);
  for(var i=0; i<countDay;i++) {
    var dayInfo = [];
    dayInfo = startDay;
    // console.log(i + "1.dayInfo 초기값:");
    // console.log(dayInfo);
    dayInfo[2] = dayPoint+i;
    // console.log(i + "2.dayInfo 증가이후:");
    // console.log(startDay[2]);
    // console.log(dayInfo);
    // --> 순차적으로 날짜정보 생성.

    //id, title 생성.
    var id =  userId+"_"+ modifyTimeArray(dayInfo,0,"",2) + modifyTimeArray(startTime,3,"") + modifyTimeArray(endTime,3,"");
    var title = modifyTimeArray(startTime,3,":") + " ~ " + modifyTimeArray(endTime,3,":");

    // obj순차적으로 생성.
    newObjArray[i] = {
      id : id,
      title : title,
      dayInfo : dayInfo,
      start : startTime,
      end : endTime,
      backgroundColor : '#00a65a',
      borderColor     : '#00a65a',
      userId : userId,
      // status : status,
      // groupName : groupName
    }
    console.log("함수안에서 생성되는 객체:");
    console.log(newObjArray[i]);
  }
  return newObjArray;
};

// //관리객체 생성함수 : userId, start와 end의 시간정보를 array로 수신하여 parsing, 관리객체 생성.
// function createObj (userId,start,end) {
//   var id, title, newEventObj;
//
//   //객체의 id, title 조합생성.
//   //id 생성 수정필요 --> index 정보 추가.
//   //id 생성시, 저장되어 있는 id를 검색하여 index정보 읽어오는 기능 추가 필요.
//   id = userId+"_"+modifyTimeArray(start,0,"",2) + modifyTimeArray(end,0,"",2);
//   title = modifyTimeArray(start,3,":") + " ~ " + modifyTimeArray(end,3,":");
//
//   newObj = {
//     id : id,
//     title : title,
//     start : startConvert,
//     end : endConvert,
//     backgroundColor : '#00a65a',
//     borderColor     : '#00a65a',
//     userId : userId,
//     status : status,
//     groupName : groupName
//   }
//   return newObj;
// };
