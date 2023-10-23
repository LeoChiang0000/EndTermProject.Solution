//$(document).ready(function () {
//    $("#cityDropdown").change(function () {
//        var selectedCityId = $(this).val();
//        if (selectedCityId !== "") {
//            $.ajax({
//                url: "/Cart/GetDistricts",
//                type: "GET",
//                data: { cityId: selectedCityId },
//                dataType: "json",
//                success: function (data) {
//                    $("#districtDropdown").empty();
//                    $("#districtDropdown").append($('<option>', {
//                        value: "",
//                        text: "請選擇"
//                    }));
//                    $.each(data, function (key, item) {
//                        $("#districtDropdown").append($('<option>', {
//                            value: item.Id, 
//                            text: item.District
//                        }));
//                    });
//                }

//            });
//        } else {
//            $("#districtDropdown").empty();
//            $("#districtDropdown").append($('<option>', {
//                value: "",
//                text: "請選擇"
//            }));
//        }
//    });
//});

 
        document.addEventListener("DOMContentLoaded", function () {
            initCitySelect();
        });

        let cityArr = null;

        function initCitySelect() {
            let citySelector = document.getElementById("cityId");
            citySelector.addEventListener("change", initDistrictSelect);
            let districtSelector = document.getElementById("districtId");

            citySelector.innerHTML = "";
            districtSelector.innerHTML = "";

            let url = "/api/CitiesApi";
            fetch(url, {
                method: "GET",
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(function (response) {
                return response.json();
            }).then(function (citiesObj) {
                cityArr = citiesObj;

                let cities = [{ id: 0, name: "請選擇城市" }, ...citiesObj];

                cities.map(function (city) {
                    let option = document.createElement("option");
                    option.value = city.id;
                    option.textContent = city.name;
                    return option;
                }).forEach(function (option) {
                    citySelector.appendChild(option);
                });
            });
        }

        function initDistrictSelect() {
            let districtSelect = document.getElementById("districtId");
            districtSelect.innerHTML = "";

            /*console.log('document.getElementById("cityId").value: ', document.getElementById("cityId").value)*/
            let cityId = document.getElementById("cityId").value;
            if (cityId <= 0) {
                return;
            }

            /*console.log('cityArr: ', cityArr)*/


            let city = cityArr.find(function (city) {
                return city.id == cityId;
            });

            console.log('city: ', city)
            let districtArr = city.districts;

            console.log('districArr: ', districtArr)
            // disrictArr == null

            let dataSource = [{ id: 0, name: "請選擇鄉鎮" }, ...districtArr];

            dataSource.map(function (district) {
                let option = document.createElement("option");
                option.value = district.id;
                option.textContent = district.name;
                return option;
            }).forEach(function (option) {
                districtSelect.appendChild(option);
            });
        }