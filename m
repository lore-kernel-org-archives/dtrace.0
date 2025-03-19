Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9975AD2C
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365960; cv=fail; b=iwT32jl/6uq0aa7bIHR5F3/xGhL+s/J9Qdi0DFGpw2r1axqg6whwB2kT8fFVlJMcolQWW/hyYb43dQyyV4yS2ClbMSwffTRtaLnX9mPLPEYF8c2Y2W4WFmcx1y//KhYI8SCKCSm/C0tcm1vDDY8LimIuZDMi392tp7Y9c7xKUZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365960; c=relaxed/simple;
	bh=/pZMQGyyvMFpzbVw0an6v8yXAJLaEMsPrwWJs2GNABE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=A4F61OpLAI3Z6SDxVfJuRt7tmsQeTtdLCVy1amIxXzdvuxLflkQnAfDPRjCUACku4B4kSa8WFPOMlWee/493vVpzRiuY1WP9RmRUJYeD6NWFxyaLtnm4qOFsLXQJB2HRCBmWJnEVCeSb5CpxLdPCuc2LC4xhPFNAJMD10BN9bpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ccx1x126; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IOu5k3jS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ccx1x126";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IOu5k3jS"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6Gpar019470
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=usbAEk8pGE7QHQqZapiHqm88lJqwdpnsTc0g4vmUYmc=; b=
	Ccx1x126jGlTrs+AquVUPPJfVy85fZ2lqgPQOm97SAzR+7Q70tuUNk5PxQDU4nqg
	2hEeegadJWV341bG3j4eD6tE270yEL6UE2mWI+TSSqY5JEqxwqdcPNTfMU/iLzW2
	My3PW/buGNYJeE5krObOfIAPX1kw9OgXbOVXsLhrutzeO5FYfEe4NuRYCijMuJOP
	NGTH+3TJwT46/AfV7lpuVFDT3Ei6oC0QN+yHr9NdhXprAcT2CiLo01+i8P5X+TM0
	bckmymGp7Pc+IFBiuwm/Bwv1G3c8NNNblBUs+7JNJEAPL5TwCbs/izSmj3qi5vLA
	b1lmSMbHFphl9irw6sx6RA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kba7yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52J5nk6i022323
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc6nye0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWti5W0M2aUTdSRSTjwDAoqjfyxJZ+i4k1N5iEOhDkMNRicplF7wiHpuAuUaSGFMBWKEQvnU/ONRAwBS7AKiw+FNQkMw4H1OnQZh7DiY4Cxe1J/JxoyEfipZ7ws6EQp5ETw/epqaXlxrRCFjDV1CJdvjt8tnPaapuL7WfmQjMLVtbwr4i9dPR2JqDurt9PKwyCS79wHJgWLYLJjrLyxGBN91f+hBBhfhFaM2osQ4NMlNelWTYrhzETrs0ZjkkM5kIO9ZS6046kx8GSNP0hYdqb9u+evbwXYSpWTPQ7OiX6HDcGvz1/BCOwzLKV+3QQNW6YiEbEDBjyTARb9BuhRhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usbAEk8pGE7QHQqZapiHqm88lJqwdpnsTc0g4vmUYmc=;
 b=np4IdDTDYGRzRkIvL4/uamVsdjPfBhn6bz4F8QqCJEvEkMt22sfXdXIC3B31kn8SzTeuQ2nzZLZW2sPF0X1lXZRKCx8w9TmRAj2OAUzLvZJ5U0knYnXNYTSWNXiu5PY50p8RtP2d6/Y72HUHCKJ/ZmiMA94ROY1Af+1fP7Hj4DtgiOF1gvtg/u6++6iC2tZF48A+NYQKS3OQsOlzFIMEifSWnkOhLURTFVpzLZc7wqDES2mqnY/Je0XmVu7jW22cVm6H60to+dtN94Rcv+lv3N0mcC27QQT/E3wyYpRgMj1DCmfSn4TVhBfTZ/iBVy3vsbXqrXU6gWS0fgrXpozrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usbAEk8pGE7QHQqZapiHqm88lJqwdpnsTc0g4vmUYmc=;
 b=IOu5k3jScVOiD9X7pz2mcjfwSoxBJpH1kgiKX+hXQXG07UrhJrp8Xdm01ImLklInfKTo6Q/ZRjFJEvj3pWgsIl4VSNvaNDb7bHQdqjRHOP6OYW1IPHdre5yWyxSmvaM03J4qyClPWI8VoVoUWb1PAb2jp6NEkdly9ATGmo9vWi0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:32:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 06:32:33 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Account for pid:::entry ucaller being correct
Date: Wed, 19 Mar 2025 02:32:26 -0400
Message-Id: <20250319063230.28171-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:52f::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a52dbf-ff7d-4496-df83-08dd66afd500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAAqE/avKXrwwfOOtxPLmJojL6scH2Vw3oF8WGlBDbOapCneLZCvD6ke+VMA?=
 =?us-ascii?Q?kkrnOSO3zx2YOpbRYZhHNtLPlQRFWwczCJCSR9lqceWX6jRbcpjc40N7Kj/b?=
 =?us-ascii?Q?W4X4/KHy/NCo7Epv6dPPwiaw/bonqD1N1yEp1Bvx2KrtNhrm1lb2If5SXdX5?=
 =?us-ascii?Q?Qfz9fwwX5CO/04hWjTQcJ/GoKo0KoHkN7sS9y/SR8UV1HPciBomaQdt2Kdem?=
 =?us-ascii?Q?wfvY1Cqr3462jegSzDS/k6r30UDW567DQwYub+oGF/O4mst6BVO2w4LoioMO?=
 =?us-ascii?Q?4JaL6BM/PfHsfFrRjE+svc2v8zWyTxNQckgbZKwIwlBrmyWjXbzoxrWTZ0o/?=
 =?us-ascii?Q?97bD7M9RJDEslmf6oYooS7jsDbfn8x5Mo74e9SMgFzdkC1dbK6ZMBGbyRkEl?=
 =?us-ascii?Q?JHRAUT6OzlBALb0j7c/W3/7i4HqbTJttcYaNdy2qHwW7py4OsKkoVotetaXB?=
 =?us-ascii?Q?0QWOPVlh9A2cc+RNAcNhFAxZ79CQmS3unDymak1sBiSAbi89YhXrsfEPc1mH?=
 =?us-ascii?Q?dyf+rtBBe1HWs8eZxfvUQbCDN6wSyx5q228I93CKicQ3c1RpOVVTUhhgvbvt?=
 =?us-ascii?Q?+EQInZRgFl51hyr91Ggn0uwwiB2TI9WmUiNUHNNPZ7EbKfFJyRaIzpWHLniF?=
 =?us-ascii?Q?PMFL7Zix8YFtwWMymxp3NfkL5IsHtZmCbTYccbeANnEqmq+DY4Wl4Y/R/tJH?=
 =?us-ascii?Q?q3QHMMFFlJg+ry6S9luPEH9/HbYDrLzm5hDcoWRD1I0KgKG5GdwYPe+tYJgu?=
 =?us-ascii?Q?rQB688dHiCyXMvLRDoqlxpaytCs+zkTLF93ywjQuq/b5dx7yZSKUzEBa+/+i?=
 =?us-ascii?Q?i7lqo5Uc5OHujgGkKJxXK02wRpbkbH29qkhOw3J2swuRGA3V0pYOdNqk3jwX?=
 =?us-ascii?Q?Dw1A2BNt11iJRlxiNcFnfQlog9J3KptfCQ/OPS4UcDC1k9W/n0rJImDXB7xf?=
 =?us-ascii?Q?L7xBvTsNd+WUQEs278rD2KC15O6V05TvQV1OCwvBmskfK4lxcOPXXc0URqX0?=
 =?us-ascii?Q?hvaOZvgAuVx45wq0jVcftLS377Zzxh1VFuCDAsRk7WUB3Mpixf1UJl3dUcHX?=
 =?us-ascii?Q?JXJ430gjYUy1xYaZbSNa/qgHya2kTz8bmkbCio132S4Cv48kYQ1oUwEeIJUh?=
 =?us-ascii?Q?8h5GDB2BnZHpHpUfY+Xo9ihlQ3bSOE7Z9VD5/f9wk/IABXCBVs3SLA7Kzwn0?=
 =?us-ascii?Q?lDyrMDeNdMn+wRCMd0uqdZmeGVk7pT6Q9lf38g1j68HMJjTxaeH5JAnbsa7F?=
 =?us-ascii?Q?MyrxsOOYIiE/vPHnDuu9Lg/kqLHJ2Cd30gypfRF1uYRwjHn9XusuxWbBdtNC?=
 =?us-ascii?Q?JNkPr/tc05Pz8U8kntf2m549r5vwEF7IYv/+ql9aJr5gu9UF9tmq0AudH+IX?=
 =?us-ascii?Q?f24JYyvR6mdbZjS6FjMWh8lHO+lC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0J6fEflkaTEf94F8jEkeOs4wHuCUpDMqA6yjygpQFtkARFP/1BtYiNErooWx?=
 =?us-ascii?Q?xH2asipjcpq188cnhtjZP6GTJMEFsyk5JMQ99K4WzBT96V0XBKFdvtqb1U1k?=
 =?us-ascii?Q?fyFIJeVHzuY6FTX5CpSp5CMrOBpkJ09jAwHolcarMMyqmrSOVR7l7BizapFz?=
 =?us-ascii?Q?0Y4tJoA/8LS9UWuCOzbI0KeRfz16VRweMAISpWYV6OW40dAxy5zfwV5SiNiD?=
 =?us-ascii?Q?7339NGnKal5mRPG65K5s+/Q5P+aklyG0OaX7Ph/LPfykyIpSyW/V6mbnpIVs?=
 =?us-ascii?Q?2qN73I83i+sxgTcM7Lg0qjG39hDYiV7cOWI6JCkuLOsDrwLDAAypGZcTF0Os?=
 =?us-ascii?Q?YCXY/oqFjByqVoTvW6tDvs5nzOW1pDwc+psfl9LmFDqEqUFjX1BgANxCsmuf?=
 =?us-ascii?Q?cHlZKt+USsvGU6rbKmb1eCvhC2HPperHOJIQFo6vlf/a64lnzwEbbP5yM6Xc?=
 =?us-ascii?Q?rs3UwSDI+0UU2EPtgJTTb2/EDve+Yz+vqNGTOwu+qrvfyWLgD0iX2Bi+2ogg?=
 =?us-ascii?Q?2ef6O90xTko9eyI78gz8q0HDub1gOTZZO29PD+NxEGkXTewhQ/K/RMfamLo2?=
 =?us-ascii?Q?MEZgn+MAeqr5MIzzO6MDmvArjppSBfe3EzTHDZ2toNqnPP/Yno7qBWHsvbXT?=
 =?us-ascii?Q?L+SL8/+BBpUPcy17m8lpUOlK9N+dFyPyC2yAGikjLdXpotAmfqhZjLgk7hTE?=
 =?us-ascii?Q?RGLz7OQ49qqwGTv05hcD5BHUuRXC6p9W5yW5TJR9K2MEk4pPZCt02AoepYCm?=
 =?us-ascii?Q?s025AVsEz2h2QF3F5V1/S0keoyVvEp5pWt2GdvdLwMbjTvlMjVzo5BflFd1u?=
 =?us-ascii?Q?+mjqCqga8fO2CrPapzsU0ZtkwD70Os78ruOUUHW43OurPe+07/6y9Uq3mVXZ?=
 =?us-ascii?Q?myBpDoWFqHEpXbczw6iG2c+i4JjGq+YjdHxTZ75cBBeiUOLpExgzAbs44Jjc?=
 =?us-ascii?Q?eoWhxPYLju+kJU1HSknPWqbXkdw1NeyIXODPCR7ZHm1+wWsQB1wXi5dEx8uz?=
 =?us-ascii?Q?bCJru87VyLvzQMeOOJAapwjhCOpuR97Oj/hoGN3ZrYFW0C73fmro4YFPiP0n?=
 =?us-ascii?Q?JpiHqkIUR6xmYcnLgUbBhVEDbMMchUieOerik+/tHn8F9CzKffEsh4HdgJqc?=
 =?us-ascii?Q?nXy88cQ8EF4A1Huqkm52MFzS9jMHyBRByVd6cD+8E2FdFxGtaZQeW1I2AAtG?=
 =?us-ascii?Q?q3IPDL9RzeTz9dTf2YkDedCp9LXvLWJCHZcDHoKwK4lKrwtmkmc62u+aZ+p7?=
 =?us-ascii?Q?sWbMbac9Wx9WrqXQ0bj0WpRQ49WH1vw7LXuFFBTVIjwFNlrXIIw0yJxT4ff/?=
 =?us-ascii?Q?rLtdRtttOCxjCrJHjuXIPniSVFe31CHSALwiGWP4lez2l3ewfPvmSlIOS64i?=
 =?us-ascii?Q?/qkgcvk02ru0bBD7Jo8a75N7QwGKdPFASmH3nWriz6nmABihwiF3vvXEteXh?=
 =?us-ascii?Q?roKWJxPag6pcHX2XJdUnL0J1SfRwBoD89VlkgOGUANdsCduTxulcEZrC9bun?=
 =?us-ascii?Q?2Jg4o2cTNn6PofNkhay33v51XmV+tif0jkAzs3khtDdDWnWkxUwG1bs8QwXp?=
 =?us-ascii?Q?iCgsN6wXE1NC4Wo3uNoINraOyw25hw3+98QfZ8oF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QwsOsx2F7T9z3NMy/IwyG0co+xm1pmXYrL8y0SfmwgZJwTqGm8DnbLKlrlYCUbyAwwc8QwZD0YAUtOrxqSldDnxqNI4Xj9kuz8Che47/+A2NURmiHTMYp9zZHXub2jKRHSw/kTa2ixi2l/LQ0/k1k9hkVuDjLoyZxA6daBrlb6NBERq07O721ml6p2hkkXDhgAMeHFooNQjxHIBuXup1OBrTfMjny0RdiStHJyz5jK6sZ8HpxFFLF2ny3V0L1HagoS8YNiGcde0O3C/waVHlhVwN/vB1yd5OZGPLO41mSZUUBldjaxJbDmDWxfHo+atrzU6IOQ71fKYXptX0G1fDhiLlV7qr8PfvufEfSeUrky1sAEPOjn6L0zpJg5XAssG0hZ76Zmqkg6eHToyTFRxJeFcsWf1Qmn1h5mAkWQN+JiS4SGbpTqeH+TG9bkuQ9b6l0PbxTD//eXiMx5Y0E7uqFYtW8HCYXUdO58E+b+FTKg78yrTSKPspg4KRDHwAY2aqhcpG35CMTA1nXZfa100ubTRuBPcRmHMxLB1mUj0EvFmLQ6tVSQAV7puk2a//cEOmdVLh5mj9hvNX4D7+yyK4jFov1zseDeBY4yHmw0HRjBQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a52dbf-ff7d-4496-df83-08dd66afd500
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:32:33.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEwKrVJLypDw44l6uoqst7eQgT3zbF1frz20irsbhujq7I7kiWpTWIqE5VYTi2q4zLzhXggFW9uTmOfJFQ48jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190043
X-Proofpoint-GUID: 8NnZvGOAh6xdcwlNmLkVZj4as16uzmff
X-Proofpoint-ORIG-GUID: 8NnZvGOAh6xdcwlNmLkVZj4as16uzmff

From: Eugene Loh <eugene.loh@oracle.com>

In commit f38bdf9ea ("test: Account for pid:::entry ustack() being correct")
we accounted for x86-specific heuristics introduced in Linux 6.11 that
dealt with pid:::entry uprobes firing so early in the function preamble
that the frame pointer is not yet set and the caller is not (yet)
correctly identified.

Update a related test to account for the same effect with ucaller.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/vars/tst.ucaller.r.p | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100755 test/unittest/vars/tst.ucaller.r.p

diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
new file mode 100755
index 000000000..8e03f110d
--- /dev/null
+++ b/test/unittest/vars/tst.ucaller.r.p
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+# A pid entry probe places a uprobe on the first instruction of a function.
+# Unfortunately, this is so early in the function preamble that the function
+# frame pointer has not yet been established and the actual caller of the
+# traced function is missed.
+#
+# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
+# See commit cfa7f3d
+# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
+# for both a description of the problem and an explanation of the heuristics.
+#
+# Add post processing to these test results to allow for both cases:
+# caller frame is missing or not missing.
+
+if [ $(uname -m) == "x86_64" ]; then
+        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+        if [ $MAJOR -ge 6 ]; then
+                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
+                        awk '{ sub("myfunc_w", "myfunc_v"); print; }'
+                        exit 0
+                fi
+        fi
+fi
+
+# Otherwise, just pass the output through.
+cat
-- 
2.43.5

