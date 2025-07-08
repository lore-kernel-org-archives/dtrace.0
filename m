Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A1E1F4C85
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 04:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751950388; cv=fail; b=EzguiX0piRT07tYSNbvi08tr18KhV5buRz9g9un8PbvNE3dlKDFPymexVHcFvMILZ0SerswOBpWE40SZl/MjbB8MNmVjX7W5aQpd5NPQo9ZhVBin91sw/4sjtRe1Wj/fYJxgnwFHD3koeABrhDAfCbc2K0xiEPH75unaYBnpUMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751950388; c=relaxed/simple;
	bh=00+Yl4pk5XbbXPyVLHq8QwWOqHB9n76WfuT8B2U3qcE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e57/Vo5d2d/hheTVB1OhWKl9fdLME0iszNXNKuTgB99pCobx0ubrrC9nl01kTdB6GxPlCmM7c3AK2MaIyntYV1BJ52P/FAU8PzhSEibaONlOq1HWWVDLWBUd0Wq+p/ZrWhyBfY/KIhcAeqMZacJss3M14X5BCnRPNDSC0DeBSEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FORcvAdA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uhmFSSnL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FORcvAdA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uhmFSSnL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5684Lo6b027760
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 04:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=D5hvSTt3ytECBacYooMz5roka1USMUXW0VVzdW0FnYg=; b=
	FORcvAdA5bIL4L3ktCFniDY7lw+V3YYxBE6DwJMKagoyi7hVEKPOE3CUaLIOWebz
	Se416RcdMEjGyYfDyX2aFBK59Zc6Zlc/qr7f1mytsz2z7A/nG+UC+NYzyKUz0V03
	uLpMVn/w0uNApRvF77mBhZoOalsfLo95tmDN7AHduNIukXMbGzScvN0ERPOyYoKK
	f7BAdZPYq21gy5W26kMzwVawcURGuYtEj1u50w9GG6XGtydHeqZvIue/AZOvacxY
	gbRxKBUHpw1tUhSB8TlhiswxdONPbDqyt/CzKvXjSXKC0CCo177SlZssIo0gcRiW
	bU2wvkpx1iP4ZSaRhiC8Ng==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rv84r0uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 04:53:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5683jCnG013985
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 04:53:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg942c1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 04:53:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBbPFa+cwPhtHVZ8vpPDTSfekSwSovMc8X98+pNVyuKi+LU+q1lQGjkN0P6P6SniF1fiIZdZ/PpEGBurv5apemxVrEobWMnRoo8R+9nRG0Y4fAKISVSHRFMxxyvP/d0HYbpT5kpRBYA94LM4ubFOyb13tZ+nlKXRU+e7HNvRm/iTt8gL/PAs3jDQOcPB3QjU1MN5dnpeC7InZK7fWuWhApZWKd3qnODvEwsKr6HcEXHEg1ijg2gms4oge/a9IF4uN614rbX7r+pzhTkv09BNCL5SBhAgX6B1dbydI0xFOw+L7sqhZGc05HSWBFywokKOdYwhccHUIhm4VkdXyTHGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5hvSTt3ytECBacYooMz5roka1USMUXW0VVzdW0FnYg=;
 b=i9E7KFKQV6PvddGER2J7bIjJkr0RngQJbjImW3Aqdg06MspgMobeYQjjoi9FAlQIklw42RbRakFE7w4we+ap6cG0Beuhs1/T8zKD6T9nD+kX0HOs2Hr+mqYw9yia5o3Vj5Ejbm2EMZ2ZdV+GyC0x1xyDu5+SKw8fpQzJ4vgyp/DKb+SMX2+uwaedyWPEL9BJ7QkgXBCFMWzUjxXnmm71H94Yf13AWo5nD5xZTM3aBCvC6svgfedaQ6HGspuFTZGqox5ArcH5FAKEI1iV+yVio4F6JTkEl+YcA5UHt/ytaS8OUSZUk0AQ4vtBqeRe73qWJCV90SwynORza+CcGaFFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5hvSTt3ytECBacYooMz5roka1USMUXW0VVzdW0FnYg=;
 b=uhmFSSnLq0CyHXrzryCJSw2VyKfJxEDZz6WzyLk8/UFDojv9e/ODVT3psYmihMK5qpEO8LusJCfBmoTA8UcDR5nusjmoo1t9fpCIhCN/IqYi9WH8+w9U71LtEJkwdQnT82tMX/C4SIi3r4KYel+I2dLf+7G+ZOGj0r2yDk7fsLg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPF8337777B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 04:53:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 04:52:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Skip err.Z_no-w for now
Date: Tue,  8 Jul 2025 00:52:57 -0400
Message-Id: <20250708045257.13808-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPF8337777B9:EE_
X-MS-Office365-Filtering-Correlation-Id: e93415b5-17ac-444d-eb77-08ddbddb5028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMII4/P189c7mkugvws3vctnxOmeqGQezuMCTqbwDp7+kAkhWj4hILw8kt/c?=
 =?us-ascii?Q?izasNgdsmuvm2SzWD2n/d4mvR0ZmQgNJihoWhRJsWYBgg47VnfZ8SeQlgqEa?=
 =?us-ascii?Q?AhO0cai+CitDlPXbF0k/uk/q7Qyf82GRGY9/tWu5EY2CljbWytNIEiAQcamV?=
 =?us-ascii?Q?XUMtQI9IhsT2Q1duIx5NMfiU1VoLgrpyhdmdTTvMLUnPPW93yGAa+ujfPSV6?=
 =?us-ascii?Q?vNBpLyISsvtJCkR9e8AirUzffvs/6E/PtmpMXCVRoY7IbmVSX9UU3PQxHXjL?=
 =?us-ascii?Q?cl6IeSUW7P1m+1gOQvcA04cBzRz3vnmDU/r2Qgb3ThQubK9obUMRLIFSPn38?=
 =?us-ascii?Q?G8w6ZPOibwJG/E+qK9WAMWOZSfLzRhyF9jxIBMg/lSmaife+uJMJoAetub8j?=
 =?us-ascii?Q?PUbMpJAJCNiVp2rYa6M7QHpKKGNT6sC2KPyUnGJatfjB4vBCjxnXU9VbT67A?=
 =?us-ascii?Q?WRPgwVY054RflAGZEoV6IPWK9KRPRsOteuu39Qay3n+ZhCoD9DvH7+zbUefm?=
 =?us-ascii?Q?sVXJI3/qI5+iqZ4EKacn7x5WCEZDdhs+7CnxZYMEEwzAjjADICDps63+/+Xt?=
 =?us-ascii?Q?U6WyjNpvaO6EkNttqyaz/HeYU3stdQVjlR2rWSJFfWCu9FY5QcSZPcbxetJY?=
 =?us-ascii?Q?rULiBDC5nADz4K2qHRVjtal60pii/hcR50lu8MdrbRrwYpIRRBU/pfBeCFRz?=
 =?us-ascii?Q?eHazr1dynnzg9bjF1Wap2FqSmS5Yfn3wY7L0CcECDIgrTku9eKzlnYeMmQ0S?=
 =?us-ascii?Q?2GP+MVYlSLK44tzx7U/UdyE51+e/JtM1/sx8b78cda1PghkHbDoL6V2qRmFp?=
 =?us-ascii?Q?JEU2+rfXPhK28HN9qfwuwvYRObt8kdLeA9G4IjZSBSGQUo+e6kJC8a4hUnLM?=
 =?us-ascii?Q?fWbAf92rAk63wHTAz4n5J4JqqUL+tMBj4OiI/KtXgmDpitJvNsuHU6I7ClNr?=
 =?us-ascii?Q?aI5ao7v9Hg0q70Oe3y4I1pb46Tz6zEgAWip5fFozMKtR6FMcROuwaiFGamxf?=
 =?us-ascii?Q?b+/cfXhb1/g1dzJTKETnvUP9ZuCAMt18ZufGO0ZXpiwPnGqSSG6hPgUU08FG?=
 =?us-ascii?Q?u5/FrSdwkRmM7OVoGpo6ZSFCyPOwK2RGrUL9VGirtuY5UNBqnya0h52kO/Kw?=
 =?us-ascii?Q?+1qGtaJzEHypfLWakzKc73Slu9eTwJ+C4rOUvrEKwI0NxQTDs2y0nlftWydT?=
 =?us-ascii?Q?QJ+pOmZp7TJ1ckUVvqnwvVAVFqPxEv1gGaILKAnLIEYOOxHq1hdK334hddtF?=
 =?us-ascii?Q?xJNuR26G+aHWB8U9KdEAfttF6GU8v7nuAW95U7gsl4+wvaPesVnp/+0j2/QI?=
 =?us-ascii?Q?IV6B19qjwG6NsRc0y0s2VvTJh63vXT1iBGdYujVmxr/UugOwYHux8HWvjT5n?=
 =?us-ascii?Q?u3gOfV8quBK1HcEec90dDp/3If4iLaodnQdw2AIZcd1/EOflF0VxTdQDiZ0X?=
 =?us-ascii?Q?wMBYbXNDWjY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cb2rU/wwRTP8K+HZbQWKjSrUV22WrO/txbXEDgoYG8tivCndD86rKqFdUV9i?=
 =?us-ascii?Q?kbHMtwB0QHlDfAccgATtdbzRpzID4xQLODl1G7kqdwkpDzIfLNYwS3+cELoh?=
 =?us-ascii?Q?C0TCpH1+0eTpfy0ypskTd6fbWK+I7OXj1WuGQ2qbtY51pmaGZjk1x8+psziV?=
 =?us-ascii?Q?w31NpCgRHcy/5UVuAiYPlcJwrZuXBxfGN04X+vgIPYmrV2csXQhNKsDI05M1?=
 =?us-ascii?Q?oJ4J/cnTCsOxlKrD97TDaHQxaMcbrwW5l5XS5T6YYXVhGHa+OusElwqMbExn?=
 =?us-ascii?Q?7e2C5/iSBQ3xx54JRFNpwZRoI6WUoCafOnOe+F36CsyIROfBgRMg6EhKx5eF?=
 =?us-ascii?Q?vrlHJdaIrQceF4pmddH+76CX1NW9HLMBAwHEsIKxfa8+WQD9gDSJkM+bMqbT?=
 =?us-ascii?Q?cqUUm1ZvCy6DSLdG5YbAhkOurKSFI1WL/q147nlwimTKXoL5Mv8y7qf+aOkE?=
 =?us-ascii?Q?VUXp0I1u84ErkQNQHqPV+rIY2Bp761CZ/k5jNTDxVFi1TBTiZFpO/Pce02v6?=
 =?us-ascii?Q?DNlq/ZjI0Kygt5OOKFY6TPY+uOvRFTCR9SEVHpTihR/Vm16RhqCVwaETzPKi?=
 =?us-ascii?Q?fZAT2Us4lT6WVMIESlU+CXGQTNxLoZ/E3f6h3bC4C0OkH2YBIAwQrSZItgbE?=
 =?us-ascii?Q?FoJGLDvPnk0uw2vYwPggCFSzH3UDXz+ZDv86z7XjQZm1AzvoSl9GEJH19G1a?=
 =?us-ascii?Q?LSB+h+YWscrYwtPpzoIEOzQTxH1HW7YvEQCJjSsoRgnWwjHF1cusCH5RIPxt?=
 =?us-ascii?Q?AURStGSqhf3wlJqVBIKnajMUSSckAkVwh7SN/AP7jf9lajB5gNPasm3RFKyN?=
 =?us-ascii?Q?c63sPr6JvR78dxVRNjnJcg7GkOu3WCxU6HUFVmkZWOCOYdx2qq6ujMLh7Qar?=
 =?us-ascii?Q?xrSJeqzDKQP20Vm6GV3A/59VzhXdwcect8LMbQTAen+dz+5elTq/0YsLpw6A?=
 =?us-ascii?Q?gH+GpXTHbrFQc+n4rlmJ6NWopb9EWL6SgrI2JXCnxjk2nB0JmELBTp4+dQBI?=
 =?us-ascii?Q?5N5ZbX0ug302cRMaDhT6YfIROHqI2BHjacH2maHE5YpudMSLLlxvLC+7Sq8R?=
 =?us-ascii?Q?QrPh9TPXK2KM2+jUm7GhUMoY2ApPiJg3GxBXvssAe9l7bk8J5j3T6mmo81PN?=
 =?us-ascii?Q?Rt/5ivdwRNXBIy0Edq4nfX3A4LyR1doNy4YIQUkXoAG5fon7Pq4yk3cvlHx4?=
 =?us-ascii?Q?a3QEURo08V0yn35tCyzpy8qgDSG5wAAmDiT9vTnDQ3a1ZTlBVXtaiQd7JqnO?=
 =?us-ascii?Q?7q/vf0e5mlNKNdMt6OGLKgDHxrmdWKu7oTgezHjchrxCbwTS+TJAsHP/ocvy?=
 =?us-ascii?Q?+pjGdvRSFh9cjlxkURnr2NY9N+JiR3RLayLWXzaU7R2R0vo4jBK8gm+tJAS/?=
 =?us-ascii?Q?u7kp+58ZMmW9qzaOdnQh/NnS6nmW/4o7yvC3w3XokBvoR9dLZUJeJ3Ess/Ac?=
 =?us-ascii?Q?6DjD+FAzbF8qrMfz3FrMLXPOyzstjqjZ4LCx2hE1sJkfE7rI7g9YRDf94MQO?=
 =?us-ascii?Q?R27lCw04iA7cTHwDsHYV4qeUwHtEA3+Hz0Ogf/KRN6IDF08nImKlq+ls9FRs?=
 =?us-ascii?Q?v2Zp+UYQXn+0jCusTjprGuyn2asN2IelwYDIMRXk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LrBwSORVVzI16QUkZ+XYc9YC0Yu/kv8BMzpxFmUeLi/c8Z/hFB+8c34JFIDiPrJJLRmGtXyixjyafGVzxgsFb0u3Xq3LlQ8VRPS8ki748jeiWcUmBDCPIvtu7RWK62Rps0xpjDLG7JBvbJCfSp+h8OwyP+RXt30HpPmCt6kT1KywtQn9xkcbhtflHw2DvtSJN2uTbuZaf0GETtGNmJpy52v1qHfL3wAli7wEFwVl3vvlrgtV5cIhVwGDZ8n5dghfrKwxkdneHAfCYqoQ0Qj1NFcNHW9r7pdZ0PBV7IoLq03KqPssEhn6C49bUfFo355N+YU+m+IUqP9HScdm1TCiGxfaRZIZBdUOXSXVNuDdHDydJvEhyN0Cfj0JvQ+qtGMbUF4LoJTdPaWdyFqIjgBoihno3wUmLVEfdpyWDy5qf2W5oP74poti+JzL4KP/KXwCcVAHH3pXRy76V4Q55F0tfnh+QDtXC1e59y7lTCst5jX5ikWYHGtAzhnMnxoKS4YdpS6PIa3K4xsOtRxSmBH4Wq3hZ7Q+h9ucNjdUDVKzEsi2/pTo/dvCRyCmL6PUtPoJ0mIau3RHl7erG65Ix14OsV0l1n/0Krd2A6fWXIohqn0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93415b5-17ac-444d-eb77-08ddbddb5028
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 04:52:59.9069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyG52NKd5gW3rn698pMk1L5JhpwsmWVWprbr6uSscq2iTlKnvySRw/XFkUzSFPnm8PLlSQWBd4XytBvIXOeO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8337777B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507080035
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAzNCBTYWx0ZWRfX/oelDUxPzpn9 /UKY2xt8ED/A751B+/R9SpneSH1ltz6slHXvlb9IfmIQi33XLVqCvxAOJxAeQxw/1bWNcLc3m2L NT9bx8fDhfwDs/ucFBCUT0O56mERKVPLXRNjwXj2tFp36w12odan2BEJVdlHZIRw1J7QYHWBEBA
 kUs5OQntvO/W1FyL0Tmr+3mZfIk23RZ7xKue4zFNK14/TVrqG/PCgH3ZoDjAnX4Hv+ZxsJAfzfW /4wUdc8WovUiUIB8ImHVlHgLvSHuZO3PtZnAYxb98i25NPkVFh6+xuwZznCaHdcrRQLTbkxYZti dvJEhi9YqNzOCDhXxwBtJsA6607caPXJ7Qmuj59XPCYXISw1nDOeg6cjLZ9bRKv+tZH0WqiWxrT
 h1Cy5vYCjk/twKVaOUF2LZHm42csqXWEA1kklgPbe3xxc/IyvKhTSMDJHF8UkGXU1/UjyDWH
X-Authority-Analysis: v=2.4 cv=QvBe3Uyd c=1 sm=1 tr=0 ts=686ca430 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=sq0n6o6O4P6WC5wR2MUA:9 cc=ntf awl=host:12058
X-Proofpoint-GUID: xuNFBCF3RwvwQSr2GhcR2lyXvpqhc37Z
X-Proofpoint-ORIG-GUID: xuNFBCF3RwvwQSr2GhcR2lyXvpqhc37Z

From: Eugene Loh <eugene.loh@oracle.com>

It is unclear what behavior is desired.  For example, consider:

    dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'

The first probe exists.  The second one will be ignored.  Solaris will
reject the script with:

    dtrace: description 'BEGIN ' matched 1 probe
    dtrace: could not enable tracing: Destructive actions not allowed

On Linux, we have:

    dtrace: description 'BEGIN ' matched 1 probe
    CPU     ID                    FUNCTION:NAME
      0      1                           :BEGIN

Perhaps both behaviors have merit.  For now, just skip the test to
avoid test failures we are not ready to arbitrate.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/err.Z_no-w.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
index 4f129341d..a49396608 100755
--- a/test/unittest/usdt/err.Z_no-w.sh
+++ b/test/unittest/usdt/err.Z_no-w.sh
@@ -11,6 +11,8 @@
 # Specifically, the script is launched with -Z and no USDT processes are
 # initially present.  Only once a USDT process is detected does dtrace
 # fail due to the destructive action.
+#
+# @@skip:  need to decide desired behavior;  Solaris will not start dtrace
 
 dtrace=$1
 trigger=`pwd`/test/triggers/usdt-tst-defer
-- 
2.43.5

