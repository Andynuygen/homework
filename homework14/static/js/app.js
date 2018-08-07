// from data.js
var tableData = data;

var tbody = d3.select("tbody");

function buildTable(data) {
    tbody.html("");
    data.forEach((dataRow) => {
        var row = tbody.append("tr");
        Object.values(dataRow).forEach((val) => {
            var cell = row.append("td");
              cell.text(val);
            }
          );
        });
      }
function handleClick() {
    d3.event.preventDefault();
    var date = d3.select("#datetime").property("value");
  let filteredData = tableData;
  if (date) {
    filteredData = filteredData.filter(row => row.datetime === date);
}
buildTable(filteredData);
}
d3.selectAll("#filter-btn").on("click", handleClick);
buildTable(tableData);



// Select the submit button
var submit = d3.select("#filter-btn");

// Complete the click handler for the form
submit.on("click", function() {
    // Prevent the page from refreshing
    d3.event.preventDefault();
    // Select the input element and get the raw HTML node
    let inputElement = d3.select("#datetime");
    // Get the value property of the input element
    let inputValue = inputElement.property('value');
    // Use the form input to filter the data by datetime
    let filteredData = tableData.filter(tableData => tableData.datetime === inputValue);
    // Have columns [Date, City, State, Country, Shape, Duration, Comments]
    var tbody = d3.select("tbody");
    tbody.html("");
    filteredData.forEach((UFOsighting) => {
        var row = tbody.append("tr");
        Object.entries(UFOsighting).forEach(([key, value]) => {
            var cell = tbody.append("td");
            cell.text(value);
        });
    });
});