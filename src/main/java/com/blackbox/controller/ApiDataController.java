package com.blackbox.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackbox.service.ApiService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ApiDataController {
	@Autowired
	private ApiService apiService;

	ObjectMapper objectMapper = new ObjectMapper();

	@ResponseBody
	@PostMapping("/getChartData")
	public String getChartData() throws JsonMappingException, JsonProcessingException {
		String chartData = apiService.getChartData();
		return chartData;
	}

	@ResponseBody
	@PostMapping("/getCampaignById")
	public String getCampaignById(@RequestBody String selectedId) throws JsonMappingException, JsonProcessingException {
		int Id = Integer.parseInt(selectedId);
		String campaignString = apiService.getCampaignDataById(Id);
		return campaignString;
	}

	@ResponseBody
	@PostMapping("/getAffProReport")
	public String getAffProReport(@RequestBody Map<String, String> requestDates)
			throws JsonMappingException, JsonProcessingException {
		String reportData = apiService.getAffProReportData(requestDates.get("from"), requestDates.get("to"));
		return reportData;
	}

	@ResponseBody
	@PostMapping("/getOperatorByTerritoryId")
	public String getOperatorByTerritoryId(@RequestBody String selectedTerritoryId) throws JsonProcessingException {
		int Id = Integer.parseInt(selectedTerritoryId);
		String operatorString = apiService.getOprByTerrId(Id);
		return operatorString;
	}

	@ResponseBody
	@PostMapping("/updateOffer")
	public Boolean updateOffer(@RequestBody String jsonOfferString)
			throws JsonMappingException, JsonProcessingException {
		Boolean response = apiService.updateOfferData(jsonOfferString);
		return response;
	}

	@ResponseBody
	@PostMapping("/getCampaignByOperatorId")
	public String getCampaignByOperatorId(@RequestBody String selectedOperatorId)
			throws JsonMappingException, JsonProcessingException {
		List<Map<String, Object>> filteredCampaigns = new ArrayList<>();
		String campaignString = apiService.getAllCampaignData();

		List<Map<String, Object>> campaignList = objectMapper.readValue(campaignString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		// Filter the campaigns based on the operator ID
		for (Map<String, Object> campaign : campaignList) {
			if (campaign.get("operatorid").toString().equals(selectedOperatorId)) {
				filteredCampaigns.add(campaign);
			}
		}

		return objectMapper.writeValueAsString(filteredCampaigns);
	}

	@ResponseBody
	@PostMapping("/getOffrByOprAgnId")
	public String getOffrByOprAgnId(@RequestBody Map<String, String> requestData)
			throws JsonMappingException, JsonProcessingException {
		String offerString = apiService.getAllOfferData();
		List<Map<String, Object>> offerList = objectMapper.readValue(offerString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		// Filter offers based on operator and agency IDs
		List<Map<String, Object>> filteredOffers = offerList.stream()
				.filter(offer -> offer.get("operatorid") != null && offer.get("agencyData") != null)
				.filter(offer -> offer.get("operatorid").toString().equals(requestData.get("selectedOperatorId"))
						&& offer.get("agencyData").toString().equals(requestData.get("selectedAgencyId")))
				.collect(Collectors.toList());

		return objectMapper.writeValueAsString(filteredOffers);
	}

	@ResponseBody
	@PostMapping("/getOfferById")
	public String getOfferById(@RequestBody String offerid) throws JsonMappingException, JsonProcessingException {
		String offerData = apiService.getOfferById(Integer.parseInt(offerid));
		return offerData;
	}

	@ResponseBody
	@PostMapping("/getOfferByOperatorId")
	public String getOfferByOperatorId(@RequestBody String selectedOperatorId)
			throws JsonMappingException, JsonProcessingException {
		List<Map<String, Object>> filteredOffers = new ArrayList<>();
		String offerString = apiService.getAllOfferData();

		List<Map<String, Object>> offerList = objectMapper.readValue(offerString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		// Filter offers based on operator ID
		for (Map<String, Object> offer : offerList) {
			if (offer.get("operatorid") != null && offer.get("operatorid").toString().equals(selectedOperatorId)) {
				filteredOffers.add(offer);
			}
		}

		return objectMapper.writeValueAsString(filteredOffers);
	}

	@GetMapping("/offerDetails")
	public void downloadOfferDetails(HttpServletRequest request, HttpServletResponse response)
			throws IOException, JsonMappingException, JsonProcessingException, UnsupportedEncodingException {

		int offerId = Integer.parseInt(request.getParameter("offerDetails"));

		String offerDataString = apiService.getOfferById(offerId);
		Map<String, Object> offerData = objectMapper.readValue(offerDataString,
				new TypeReference<Map<String, Object>>() {
				});

		String campaignDataString = apiService
				.getCampaignDataById(Integer.parseInt(offerData.get("defaultCampaignId").toString()));
		Map<String, Object> campaignData = objectMapper.readValue(campaignDataString,
				new TypeReference<Map<String, Object>>() {
				});
		String allAgencyDataString = apiService.getAllAgencyData();
		List<Map<String, Object>> allAgencyDataList = objectMapper.readValue(allAgencyDataString,
				new TypeReference<List<Map<String, Object>>>() {
				});

		for (Map<String, Object> agencyData : allAgencyDataList) {
			if (offerData.get("agencyData").equals(agencyData.get("id").toString())) {
				offerData.put("agencyData", agencyData.get("agencyName").toString());
			}
		}

		// Create a Word document using Apache POI
		XWPFDocument document = new XWPFDocument();

		// Title
		XWPFParagraph title = document.createParagraph();
		title.setAlignment(ParagraphAlignment.CENTER);
		XWPFRun titleRun = title.createRun();
		titleRun.setText("View Offer Details");
		titleRun.setBold(true);
		titleRun.setFontSize(18);

		// Offer Details
		XWPFParagraph details = document.createParagraph();
		XWPFRun run = details.createRun();
		run.setText("Offer ID: " + offerData.get("id"));
		run.addBreak();
		run.setText("Offer Name: " + offerData.get("offerName"));
		run.addBreak();
		run.setText("Agency Data: " + offerData.get("agencyData"));
		run.addBreak();
		run.setText("Operator Name: " + offerData.get("operatorName"));
		run.addBreak();
		run.setText("Territory Name: " + offerData.get("territoryName"));
		run.addBreak();
		run.setText("Pin Length: " + campaignData.get("pinLength"));
		run.addBreak();
		run.setText("SUB KW: Not Available");
		run.addBreak();
		run.setText("UNSUB KW: " + campaignData.get("unsubKeyword"));
		run.addBreak();
		run.setText("Short Code: " + campaignData.get("unsubSC"));
		run.addBreak();
		run.setText("Sender ID: " + campaignData.get("unsubSC"));
		run.addBreak();
		run.setText("Price: " + campaignData.get("price"));
		run.addBreak();

		// API Information
		run.addBreak();
		run.setText("SEND OTP API:");
		run.addBreak();
		run.setText("API: otp gen api here ?msisdn=mobile+no&promoId=@promoId");
		run.addBreak();
		run.setText("Response: ");
		run.addBreak();
		run.setText("Success: {\"response\":\"SUCCESS\",\"errorMessage\":\"Pin Generation Successfully\"}");
		run.addBreak();
		run.setText("Failed: {\"response\":\"FAILED\",\"errorMessage\":\"Pin Generation Failed\"}");
		run.addBreak();

		run.addBreak();
		run.setText("VERIFY OTP API:");
		run.addBreak();
		run.setText("API: verify otp api here ?msisdn=mobile+no&promoId=@promoId&pin=@pin");
		run.addBreak();
		run.setText("Response: ");
		run.addBreak();
		run.setText("Success: {\"response\":\"SUCCESS\",\"errorMessage\":\"Pin Verify Successfully\"}");
		run.addBreak();
		run.setText("Failed: {\"response\":\"FAILED\",\"errorMessage\":\"Pin Verify Failed\"}");
		run.addBreak();

		run.addBreak();
		run.setText("PORTAL REDIRECT API:");
		run.addBreak();
		run.setText("API: porta redirect api here ?msisdn=mobile+no&promoId=@promoId");
		run.addBreak();

		run.addBreak();
		run.setText("CHECK STATUS API:");
		run.addBreak();
		run.setText("API: check status api here ?msisdn=mobile+no&promoId=@promoId");
		run.addBreak();
		run.setText("Response: ");
		run.addBreak();
		run.setText("Success: Active");
		run.addBreak();
		run.setText("Failed: Inactive");
		run.addBreak();
		// Antifraud API Documentation (Conditional)
		if (offerData.get("antifaurdEnable").equals("Y")) {
			run.addBreak();
			run.setText("ANTIFAURD API DOCUMENT:");
			run.addBreak();
			run.setText(
					"API: get antifaurd api here ?promoId={enter+promoId}&msisdn=mobile+no");
			run.addBreak();
			run.setText("Response: ");
			run.addBreak();
			run.setText(
					"Success: {\"script\":\"function(script)\",\"ti\":\"231232132\",\"buttonId\":\"subscribe\",\"error\":\"Script generate\"}");
			run.addBreak();
			run.setText(
					"Failed: {\"script\":\"2312321\",\"ti\":\"231232132\",\"buttonId\":\"subscribe\",\"error\":\"Script generate Failed due to {reason}\"}");
			run.addBreak();
		}

		// Set up the response for file download
		response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		response.setHeader("Content-Disposition", "attachment; filename=offer-details-" + offerId + ".docx");

		// Write the document to the response output stream
		document.write(response.getOutputStream());
		document.close();
	}

	@ResponseBody
	@PostMapping("/getServiceInfoByOprId")
	public String getServiceInfoByOprId(@RequestBody String selectedOprId)
			throws JsonMappingException, JsonProcessingException {
		int Id = Integer.parseInt(selectedOprId);
		String serviceString = apiService.getServInfoByOprId(Id);
		return serviceString;
	}

	@ResponseBody
	@PostMapping("/getBillingReport")
	public String getBillingReport(@RequestBody Map<String, String> requestDates, @RequestBody String serviceid)
			throws JsonMappingException, JsonProcessingException {
		String reportData = apiService.getBillingReportData(requestDates.get("from"), requestDates.get("to"),
				serviceid);
		return reportData;
	}
}
