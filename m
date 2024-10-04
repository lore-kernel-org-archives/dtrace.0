Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063E3A1C4
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017050; cv=fail; b=IYzgol0q5Bp/SO6aVf2QDx0H1h2CuozMOcZs3tScvcM1cOxM/J/ldkfB2FEC7K7LBn/Y2s0ElcUhrzhMmbCQfjDhoTGkrHrDrmxT9tZhP9PYQZfPyRhxjpeCz9DwDVz91M4FpklbzMYj99tQHioNbzQ8CJS6RbGIuG68zj44s2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017050; c=relaxed/simple;
	bh=VMkkGmDIpDlVi0vYCm63JHqrELZxCnUZMf/hO8lkm+4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ahj5k8L0jbOSuAgDMi6lE7/WOIhdeEPSGpqHqxntOrwVaMmj5dSgt6fA9NAGTJCoTUneSM/Y3eObOn0t5szGQHX7qZLOvM3fUSFWHRe8ZeKmW5esxCgLmm9+UUKXsqxu8VQZHTA0ECK8mwz4J2is8z4xMxPzlL97UpfMf1SM9gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=om7tgW2q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nNe1TuDt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="om7tgW2q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nNe1TuDt"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tbgO021893
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=rcEtB/opE51xXh
	IAxGV/ApDOtW8EFx8vSLGivz3IMrE=; b=om7tgW2qI8832MBvcIJwHW+hb5MeDw
	IZurudCTJyfga51Pp/rvVMh7ioKBAmS2ehoE/Exiz6+u1UlThpEC19JwErOUUUi+
	zReqxCxVHn0NJJ/DgX7cp4cVia1Dqv+GAK52ItD2NV9rSAeQkdtODhlGkaIuOydg
	FPbGGz24pRD5PMyizNwYyIh/NoMnY8Uar2ewmhXOd9BORhYkZpSwLW1GnIiX53OZ
	iwSluJuAgzNAEwdz+RBhM+VuvgrUP1k6mYmIa1GRJJ0SHE2O3NQFNNm5jjL/Z3lV
	rxdG/0JOSURLuZi2vwu1zFogkmsOpq7GrnYmf6hZcT47tbTAMPUvNoLw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204b0tn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49440sXr005831
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42205617m4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blC2TI67+2oSNPhEJqK2ulzMGzhT1QLM/wkD0eeaiL0lQyGQqWsRCD1/oKzYdYtzAZ4AuyyY7V8LT5L4v4MboYj1KPN6fRvH8KytnSBHtXs8SjkWGWljn2iJkjk8IOHoeiz3C/a4oVenNNZhW6bXRkDe6mJZvR99cG5RBNI8Q3wDhAmnKjOMl5evE7DViZkDJ8MUfIGOyc3k6+Qgzrz+9tMMf08uPNLpO4NIexSVkr9V+jFDlL7qbZcvYpHeo8ElhCmAePYmbhOJSrPlb+Uj0Rz+H2fmw3APJfsnaUGpHPAn0aZzwo/u6uZizEtWpebAYykwnVvsp6/AOw4IsC83zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcEtB/opE51xXhIAxGV/ApDOtW8EFx8vSLGivz3IMrE=;
 b=jQ5rgjkcdnpU9+UzePmO/mdDrq5l0NJguMneDbCVuEXWctcJjaA9KkV51JJG3MWE/N9lErPLdETUILcdQctyqBA//4lS0II4BkVC1XEvdBbBjG2Vn/yxgmuP24S9MGgg3JKBRmMpx3RrzAeYZy9F7ssVa2YT+XnxcP7o/TLyqRKTc+ctQZbrr5y5PmYlvY6VU1bSVOSphIJEyMuY4eZPRVOR7AJ25oMnlEG95v2N3HA7zMNO2owPxR8RbNGeibMTT8jV1r+SkdXcm4+FNWbFWIpQE+Q/kMOPOIrOGWQ0QaC7m2gjZFy2SnKwsYjaR6zFYcsYu2f3GNO0+5z2pgyguA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcEtB/opE51xXhIAxGV/ApDOtW8EFx8vSLGivz3IMrE=;
 b=nNe1TuDtqp4VIoG6Pu2wgd3zWu0Vv4VUVXlcIlif+YB1KK10IQ47U2SP6vPMdaOsMlLcbjrwpdzmKANWTL239024uwEtdBSXn4XmrFpsc5IlDNReQtyTgk4nLSodfjEJzmBMwWrbFl16rj3nI5giW1Y1sO7xxFcV1kor1nlQ5bg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN0PR10MB5909.namprd10.prod.outlook.com (2603:10b6:208:3cf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:44:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:44:03 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] test: Do not return 1 for err.*.x checks
Date: Fri,  4 Oct 2024 00:43:54 -0400
Message-Id: <20241004044355.25870-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241004044355.25870-1-eugene.loh@oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN0PR10MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 563f96c4-3db5-4a29-3611-08dce42f2c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VAUc8j6IrY8UCp3/V/yoJdu+48KIG68RszXKQyUV539VOKQU1fmGlkjo39aD?=
 =?us-ascii?Q?9BxilzCL25OjyuPDSswW71gNtraIvd+UmsRoL0P65VdSbLZJcwy1b4WXY+8T?=
 =?us-ascii?Q?qdTlarTTTpcxqa6DwOvuOT1BianXdW4qXkBTlEwaYstzR7zK1Yvo+WEBt2Fl?=
 =?us-ascii?Q?IPQrLdDze7eoseJX0N6u9ZjBlNY7Y0HHD+vRL6AnBNeFBXUOTvvlspnSLEpy?=
 =?us-ascii?Q?Rahq+UA+6yN5TTgI2R6hT1oRvpm1dPQaCH9Au2RWVlxCPbIEj/rb7Rt/d+yg?=
 =?us-ascii?Q?7o6VNlyXfhmKXw+nYOIji2mFIE+ajzFDZ3d31xBCs0WEgDsKgIioPDDH6dpd?=
 =?us-ascii?Q?SOoKsB2tbcagrBut1FO3tmL817X4E1yWg0ahk+SMoXAHpi3nkKFk0q/qstY2?=
 =?us-ascii?Q?H8n8u8Ee0KLCYkb0SI9pHb++zBv5C8jD+8gcxQu80NWwLs/QSevxGWJqdxOd?=
 =?us-ascii?Q?2W7a73Hr6/Ws+stZx1oBlJXMqBSy2ZVJ2+TXtvBo4EvhnubVjbCzi1qlQ5TL?=
 =?us-ascii?Q?aPDUXUY7JpmB9YjKVrhPFtAGSaLUdzJiii86dNde6WDkb9+dbpViUXHrQt2X?=
 =?us-ascii?Q?383tpSHrlfPjF/sDx6iY2lXd8I0z2VAn4yyRP2cNEa/VRbP5mCpODv5Dib9F?=
 =?us-ascii?Q?uv5z6pZU1zuQVgckIlWRfmLkJXCvqzPaDNuIEATMV2XG6w1ObQ39clms0bFr?=
 =?us-ascii?Q?9oWZwBobKQgHA3J1Vo1TTR+OV9o/IOKb0nc6KEFKKa4Bbq90yTnQHF6LF16k?=
 =?us-ascii?Q?OBOFYXHXpb/UlXjAyT/heJMKDNhusUorIcM7kp70Elpmwz7JVigRh1ehQ5eq?=
 =?us-ascii?Q?bmQSz/7omw/91zHKWCTOn6oSfB5EAfhTTxErRT8iQAIciJ8XkUGaOenM0QFv?=
 =?us-ascii?Q?4aUPCU2Sbye3FrJO1gVwNLy0yZyWX0RJo0hhyfTzaSFpfN+5fcbAsKHr+vG0?=
 =?us-ascii?Q?lK8YmI6vKmW8E4N7aORAr/OxQJzJ8P89vuwEtB3ociGPb1B00h9YnLrutBzW?=
 =?us-ascii?Q?81MyAZ0Db+Ozx4O/ihKQ2gWiNJ5iRbgAP+xGtBAtuA5STv27TN9cCUpztCQA?=
 =?us-ascii?Q?Sy4Xpd13BHaERZRBOcDEjWau+b8AiKF62PXH9cI1HS/HOY92WwZ+9qLkhQRy?=
 =?us-ascii?Q?Wx7nFnHMq6qYYmYslfwN1XpEijs53GHUDz4SJymmi3pE0wQ3zbkqrsMuTGY3?=
 =?us-ascii?Q?4gh4RsYWAS+tHqLIAqjpSemkr93pzvnuG6YUaXN8p7olzX1v8B4Pk4axfThh?=
 =?us-ascii?Q?8/GtPzqU8U+AXkNYIDeTTIKqx3+BfAXjVfpSiHbu8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s0K/Dcscw1Ko9uozsLXpj+YqcAMEh3UsBk8YcEWk+nfRiD2y1HBsUtjKHXxB?=
 =?us-ascii?Q?y0P6pIjx+S4H/e2G9PVjLXchqUjwuxKqSWYGtpse2FidO4lB3+c7CxdtQzBQ?=
 =?us-ascii?Q?J/SS+EId8UAVP7FHfldz4zj+8ENeOBUQlLr5uCLL4aotAtW7LDTSTQb1bMGF?=
 =?us-ascii?Q?xTQciaa5pkPIyr3YDrFJRLOqztcB/9OWMfBsfWdKBIOmsQZNgbXptChe4egW?=
 =?us-ascii?Q?egiQoOXAj8DoheYJJ5MANJfhyZZr6+eiiKjuGyi7V6Qkoco8cqqJ9S2fYd/U?=
 =?us-ascii?Q?0DKWxG1mqU7rq5R1aHnZuRqm7PYUMvpSfK81rdBYc9/vn8IMAZcZsUyRvtE7?=
 =?us-ascii?Q?HtD6K6Qqlwj6wQbZNaDEPn1H4IyOON6q2gksIL2dz+vGDmQyG6q28cYqlc9Y?=
 =?us-ascii?Q?aUDnqzqs6WUI9KOVR/82kfN4rFbYbyBWe6DuQfH16trT+2mIfW/NL4ykLBWg?=
 =?us-ascii?Q?hk+oEP7FYzb8jpBOlN3BepVEv8N17bG50ule7ZVPeY0Mw579aoxZmOSe0bQ+?=
 =?us-ascii?Q?EOoeaRwgB+JDihSZ7qQn/1LkSzQSSL8lOtvq4RZZvSReRtRD08qomrpnv10Q?=
 =?us-ascii?Q?cGBZnELCFu9IHEXpktPU1OglxzNE5FMH/lIq3kAVOIyG1Of+09rmXagw8BpF?=
 =?us-ascii?Q?XJ4oTf3bZdlfPo4l//qR5srVwH9raYUL3lNXbPwDlIAGxQRxzuaYBHJyZSlI?=
 =?us-ascii?Q?DHrr55lEnvigBMP2A2XlHXfnRE2SNRKVt4pBfOM76iyiO2embsuF/NTkSK2j?=
 =?us-ascii?Q?afHHhTVR9SLfBsF2FNLGaZg8XxXr4r2bUcbHNixgMvJsF+upmrSCvYlNWUsi?=
 =?us-ascii?Q?0tUmtn6/rm9JHrQi1vxewretbwpgwRg8grbMYGWMW15tjhwTG/Y7D58mZdZ0?=
 =?us-ascii?Q?ryfLkvNakwMuENfE6cq9kaMBei09JJjNl6RERWXdqH15gHQBWf2qcHbbcpDZ?=
 =?us-ascii?Q?BC1aAycFsEMsLciyAudIaxz+d9COhtf5AcA+sFi8zvnns3h7GjTPtQuKzpz/?=
 =?us-ascii?Q?X2OSnZvz5vaKQxtclYHhc3DwlVBoBGTEq7zDi5ao06+ndcHq0K12v4ir/pQ+?=
 =?us-ascii?Q?/MaNSn2eaKq+kLBB2pxn7umxXUrDDqmvPgwgNMsvgNlxiNjrbdmUhkRAGsWd?=
 =?us-ascii?Q?eKG91hvNoVbtMBofg8VKOD3+YigdOixdWX1lH1UBcDI27QNCs1ZH2X1DAhhz?=
 =?us-ascii?Q?ybGxX2Qz3oPwu3CdPA2N0aysWecAaDFqiq5lgrG9er88wJKCx2wgrxD5tFMO?=
 =?us-ascii?Q?nT3TCmi4aBcPZtFenryKUwi6J6GBrDRUgkMCFHaj3BWH2MYkbIyUUxtGLGVU?=
 =?us-ascii?Q?0h17SOpz0lDZm7fItS3kr6/glB40jfxKKvFszP8/+iNOAMd7B66UJwjlkd8R?=
 =?us-ascii?Q?nD7nA02s7jbxeW7w5TLQgTFx6h3RL9V0NK2Js1xTkCpVk+0J87HTgnUzd2Zh?=
 =?us-ascii?Q?2dBcMieKcyFJwdgseWROuUJZjhef+SQlmDwB1pm4saTjQPAoS+YCpUBZoMRV?=
 =?us-ascii?Q?yFm6TjCleodxmgrterxCYJf9Du2pxl8YTzfYjd7VkOCxvaeiDxbIfi9pbEpR?=
 =?us-ascii?Q?yQAFgV9n4UeXHje9WLgDO7JYPlqlqIozZrk5Uw6U?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B4hksEJJJMKOnNy5Vaj8LJii+wWbh3IjDVL4+Q8Ds9/VeWX8N57ufn3oc51ulRkUsqkL7ZoVOpt2jYuMPTnUET0DChOhXhgXX6m5gfc+W0NFJJM6CngEHVvusoksAN9luxCbroN7TWuyr8hHEmAG1ZU0fxVQSeH0FMq4J01I5aAcvBXTqAPF7nMLcqlvz5T3A2dOoHgNx1a6meYpMT2x7Jonl8sxW9uPpubpCqps72nPz+hPMvpimjEGclWdjMoqKlhy1/xvKi31H1/PMfU+de6Xuah3s+Vu7VLw6Zgn5NTtqX4yUah/Ep4ZDJduHK/4uivcD74uW2Jqhm6JZr668Qr9o8hBpngpQddawVlH1ol+CyH4oYlQLpVEfMTnwPDMWSVVi978Da2FVLMkxsK7e5hgMf+2qe5kDReGSOx4uP4UbWVyfMzNzzdQx4o3J02EgEZP7GBGNYpD5GN8yi7VPr4JtV83BGOlC+ZiYiGiDqwwDZS4oxcrCvS6LemhNfKwuszur9RoPZBfIQCyiO3od2RpCyvmhY9OHqM610konToRbm6oGfPiyT57lyA3opiAQnX/qApWTZhOZTgfRLoOD2hcNlzfReXcyx2motGlIic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563f96c4-3db5-4a29-3611-08dce42f2c4a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:44:03.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyzThQM5jsFnqLnq8B1UX09pzeg6lhMas6taDEVrZhGOcTfFO3kAlY5VC53wD/0O+isInnfLnuVqyUtQwE0uPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040031
X-Proofpoint-ORIG-GUID: Y07CdEUwQx8xaqhJ0KUD5CiQ0vdWMQum
X-Proofpoint-GUID: Y07CdEUwQx8xaqhJ0KUD5CiQ0vdWMQum

From: Eugene Loh <eugene.loh@oracle.com>

We can mark tests as expected to fail.  In fact, with .x files,
we can mark XFAIL based on a runtime check.

For err.* tests, however, we are expected to fail anyhow.  So,
having an err.*.x return 1 is at least confusing... certainly
for the runtest.sh script.

In practice, err.*.x files usually return only 0 or 2 -- that is,
we might elect to skip the test.

The sole exception is err.unloaded_var.x, which checks for
/lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko*.  If this module
is missing, the test is supposed to fail, but as it is err.* it is
expected to fail anyhow.  So the counterintuitive result is that
if the module is missing, the test produces XPASS.

Change this err.*.x file to skip the test if the module is missing.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/types/err.unloaded_var.x | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/types/err.unloaded_var.x b/test/unittest/types/err.unloaded_var.x
index 54c61d57d..cc63265a4 100755
--- a/test/unittest/types/err.unloaded_var.x
+++ b/test/unittest/types/err.unloaded_var.x
@@ -2,7 +2,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# XFAIL if gfs2.ko not found (exit 1)
+# SKIP if gfs2.ko not found (exit 2)
 [[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko ]] &&
-[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 1;
+[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 2;
 exit 0
-- 
2.43.5

