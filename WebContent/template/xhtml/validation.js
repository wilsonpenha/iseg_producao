/*
 * $Id: validation.js,v 1.6 2008/07/29 17:05:48 atlas\gustavo Exp $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

function clearErrorMessages(form) {
	clearErrorMessagesiseg(form);
}

function clearErrorMessagesiseg(form) {

	// get field table
	var divMessages = document.getElementById("divMessages");
	divMessages.innerHTML = "";

}

function clearErrorMessagesXHTML(form) {

	// get field table
	var table;
	for (var i = 0; i < form.childNodes.length; i++) {
		if (form.childNodes[i].tagName != null && form.childNodes[i].tagName.toLowerCase() == 'table') {
			table = form.childNodes[i];
			break;
		}
	}

	if (table == null) {
		return;
	}

	// clear out any rows with an "errorFor" attribute
	var rows = table.rows;
	var rowsToDelete = new Array();
	if (rows == null){
		return;
	}

	for(var i = 0; i < rows.length; i++) {
		var r = rows[i];
		if (r.getAttribute("errorFor")) {
			rowsToDelete.push(r);
		}
	}

	// now delete the rows
	for (var i = 0; i < rowsToDelete.length; i++) {
		var r = rowsToDelete[i];
		table.deleteRow(r.rowIndex);
		//table.removeChild(rowsToDelete[i]); 
	}
}

function clearErrorLabels(form) {
	clearErrorLabelsiseg(form);
}

function clearErrorLabelsiseg(form) {
	// set all labels back to the normal class
	var labels = form.getElementsByTagName("label");
	for (var i = 0; i < labels.length; i++) {
		if (labels[i].getAttribute("class") == "errorLabel" || labels[i].getAttribute("className") == "errorLabel") {
			labels[i].setAttribute("class", labels[i].getAttribute("oldClass") ? labels[i].getAttribute("oldClass") : "label");
			labels[i].setAttribute("className", labels[i].getAttribute("oldClassName") ? labels[i].getAttribute("oldClassName") : "label"); //ie hack cause ie does not support setAttribute
		}
	}

}

function clearErrorLabelsXHTML(form) {
	// set all labels back to the normal class
	var elements = form.elements;
	for (var i = 0; i < elements.length; i++) {
		var e = elements[i];
		//parent could be a row, or a cell
		var parent = e.parentNode.parentNode;
		 //if labelposition is 'top' the label is on the row above
		if(parent.cells) {
		  var labelRow = parent.cells.length > 1 ? parent : StrutsUtils.previousElement(parent, "tr");
		  var cells = labelRow.cells;
		  if (cells && cells.length >= 1) {
			  var label = cells[0].getElementsByTagName("label")[0];
			  if (label) {
				  label.setAttribute("class", "label");
				  label.setAttribute("className", "label"); //ie hack cause ie does not support setAttribute
			  }
		  }
		}
	}

}

function addError(e, errorText) {
	addErroriseg(e, errorText);
}

function addErroriseg(e, errorText) {
	try {

		var divMessages = document.getElementById("divMessages");
		// clear out any rows with an "errorFor" of e.id
		var row;
		if(e){
			row = e.parentNode.parentNode;
		}
		var error = document.createTextNode(errorText);
		var br = document.createElement("br");
		var span = document.createElement("span");
		span.setAttribute("class", "errorMessage");
		span.setAttribute("className", "errorMessage"); //ie hack cause ie does not support setAttribute
		span.appendChild(error);
		span.appendChild(br);
		divMessages.appendChild(span);
		// updat the label too
		if(row){
			var labels = row.getElementsByTagName("label");
			for(var i=0 ; i<labels.length ; i++){
				if(labels[i].htmlFor == e.id){
					labels[i].setAttribute("oldClass", labels[i].getAttribute("class"));
					labels[i].setAttribute("oldClassName", labels[i].getAttribute("className")); //ie hack cause ie does not support setAttribute
					labels[i].setAttribute("class", "errorLabel");
					labels[i].setAttribute("className", "errorLabel"); //ie hack cause ie does not support setAttribute
				}
			}
		}
	} catch (e) {
		alert(e);
	}
}

function addErrorXHTML(e, errorText) {
	try {
		// clear out any rows with an "errorFor" of e.id
		var row = e.parentNode.parentNode;
		var table = row.parentNode;
		var error = document.createTextNode(errorText);
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		var span = document.createElement("span");
		td.align = "center";
		td.valign = "top";
		td.colSpan = 2;
		span.setAttribute("class", "errorMessage");
		span.setAttribute("className", "errorMessage"); //ie hack cause ie does not support setAttribute
		span.appendChild(error);
		td.appendChild(span);
		tr.appendChild(td);
		tr.setAttribute("errorFor", e.id);
		table.insertBefore(tr, row);

		// update the label too
		//if labelposition is 'top' the label is on the row above
		var labelRow = row.cells.length > 1 ? row : StrutsUtils.previousElement(tr, "tr");
		var label = labelRow.cells[0].getElementsByTagName("label")[0];
		label.setAttribute("class", "errorLabel");
		label.setAttribute("className", "errorLabel"); //ie hack cause ie does not support setAttribute
	} catch (e) {
		alert(e);
	}
}
