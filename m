Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0152153ED
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107100; cv=fail; b=ifMtYia7Jqi5mqh8rL/mkFA/lCyz9QgrBce9nhazKEXsMbAzxHJheT0z1C31eSVL0IdkkdBhuPuNuySs8G2YAyH69PxSM/Wc3h+Nn+2XFOxYaHzpa2R/3AzrzLI/CTLpSLhs7gE2Rpj/tL2mu+dmXIVmeSQJmsBe7rzF1xT8Ji0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107100; c=relaxed/simple;
	bh=Y93+oXWCK5VUT0w8uZAM3VqUNoiYIQWdExgTUdYs/T0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XfP1ik14cl/7YaUS5tUC+7kSJGcZpuSRyYkX8LgE5k305aQ7jL4muV5/Lq/Sd5FVx4jer5sUbBpaVnhGvQ9VG604YfBz2kmgTzrhfPeJOmjfhZWxI4T1l/F9m7c9oaNmonhavJDAm3OFVKJOwAZX4T+lQBkQsm1Ndwhn+/UU11s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f4sHyq3q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XmoijG7y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f4sHyq3q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XmoijG7y"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3N8s5004997
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 04:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=yOBTK5ltLudebemCWRYi6mJWeq+w8qY1kvDkqX6iqHM=; b=
	f4sHyq3qEPHDPawQiTK3+9tITZiJvP8+SOZ5wRL1DCiz/h1jwk3jqT07ezmJnhM4
	OPqttubVbYtvJkONgGbqSzzKeW1WOU2SGnNyuNVtrT9Y42GJzGrxehB9AXhbrduw
	hmAZkzGEWXsHnwVoUbP40Er8vFQ6nMj80EWPbwfxGUDteVGBlfkyTYpnwMtTi2n+
	HRoc4SyHuLq4Co96CAwvp6SRfGTeSM2cNZjPdt+BV89oYgUE2qy1m0CSjEc8MFqD
	VW34WKv2LbgY5IDG1EAeuvscMMF2ddLakx69pF2u0aOc9WgArh/AjVrOOPq0wPFS
	+SKcixXB3z1E3CsYUjb+BA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2waxxcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 04:24:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M1wMK2009790
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 04:24:56 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdwxf0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 04:24:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gp8MsjZB6kzaaiPObeWG1rVLTWioJB0GNeTTr/t33hAkkFweC0VaR3BbXe5FEsLEJrFJWr9W+oyA2IPlBa8EOsgS3QUVR0VLcvqnMVvFHuCUONfY0KgfO6FS9oWGvdkUs7GuEP22nrCN5bj596djF0gqxexxrVw8Iw4PyMHW9rpA2q7A1vHFmVInfaHWxrnzIlPL4yS0wqqfUZLbOolkGlrgiaSoBKdxTd+MQfqPU3N/9ZD5DKAjpmMX+2E8eZHQ9qM+3MXFo0iwABBuQfgWs4bc5OjTMEFFoK9j15hEaoDDA1WV6ZBJKwjHWQxO9bLzmi5b4H6C6tWW5jLXiFRDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOBTK5ltLudebemCWRYi6mJWeq+w8qY1kvDkqX6iqHM=;
 b=Ufkznrq3nCbOuwckuv1LZJBrRWQZ/7PFiy8x1yk8ZYdo3uIKsjHBxh6Gl94Ikmij4psboF268eXCNt0rIzAr3Et+UglKoXDpZ1l1HbClG7FbSPNDIb+cRdr15VrasgswOGuF4jWUlrySzsSFJwTh0o/otpKwX6/IE7Iz10JWzIFgHjubv9LBZyr0IdYkDxmIV2WTE2UtKZv4qbCBjt25Qf3cDbYcl4CwcxCqCI8wAjv4rF3uy195P1GChbV8yM9AcbQDHU6RXWoktHx3xRwRKpFiko8i2MdzyV53zKlmFmA+raJmHSaOe07KXu3YD+NcCh1gYKhDp+LmF5CR4b1Mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOBTK5ltLudebemCWRYi6mJWeq+w8qY1kvDkqX6iqHM=;
 b=XmoijG7yYswA+5of/jmr4fX6xq0ABoqUFjf9uDlDH78U7+h3lCAzwr1+jT49dwFqTPvp7hBT3mketqRpDEQofPYcBr7tQX/WfO4bBdKz/CSsk1aPIaPX4DpsD9mG7wzLLaes7f9wJBdMBG46DcLW1a/hJUek0aCdaS28z7yelC8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6411.namprd10.prod.outlook.com (2603:10b6:510:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:24:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 04:24:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] doc: Add rudimentary documentation for using [u]stack as a value
Date: Wed, 22 Oct 2025 00:24:51 -0400
Message-Id: <20251022042451.2987-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: bfac1ae5-bee7-4e24-f400-08de1122f25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzEka+5wi5lQsGTaa3ZHufr9E403JGq7jDuJS2KsS8abIWhDafIV1yHK9NJJ?=
 =?us-ascii?Q?5JzdXlLofa+VCE7DLXrbKJafjxIrNRm2FKM0/gjSlR0fYukJvWhHWrQB/2tE?=
 =?us-ascii?Q?uNd7+9tSC+uA3QRFGpJo+u9+8F0gzTZcy8YOLneEgwA/Lc9honXHydPVR0cS?=
 =?us-ascii?Q?xc23iYlIfaXOmDiHzRpB11qZqjLY/BHbZBCc4j5g8h/TXMGQ6lfKmubb3Cqh?=
 =?us-ascii?Q?hZlj79Hb0R+ujPnIsrrBCeSPJmVfgu6ihgtB7MuJy4tgyarHKLeqWKgTjQVe?=
 =?us-ascii?Q?5hXMYusTWdnr35S/zTLv+qQJGxCEm4sNpXAYHtedz+KmVyGvzi5SwU7uVRMr?=
 =?us-ascii?Q?DYfeahGBUTLVLx2eHBNCUZkdVqM4cXqOTYdwiu4gplUUBa8ZADnCfOM5J+al?=
 =?us-ascii?Q?EsU9JLc5pH+gYL1J9WbqOjMTE+8oJjC1SWWOFYsZOwgGWm5nFrjVzb9YYEVV?=
 =?us-ascii?Q?d6WJB3B3DIiSUDQ7fNyh+/WBjavhZgnkrlnYNQosaWTzRPustLcsKuBEkjO1?=
 =?us-ascii?Q?mT4jRc+TM3uoprZcLhY7d25rvQChvCNdBLTsyylz+e8QUyuFVk4P5xxhgsAy?=
 =?us-ascii?Q?b7ZunKMSUZmYtkjtKE/DXWsuHKGa/KDD3Sc/CpZEOmgQdNCL7hBX8Gwdkn0M?=
 =?us-ascii?Q?mhHmz6yJrbd/q5sSAqwWyFRqLu4AseFA67LmIAQ2vKogumwuYZNWAs79yk28?=
 =?us-ascii?Q?AqjSC+zr8A54NG7C5J0uLwzcwAvLcGEsHw4JTR7RB2bukruNxScBjg9iFKOl?=
 =?us-ascii?Q?Gabnx/7rXA18n5vxDul2uWr054DkmGahBDQ7SPFPJT5xQLxq9BZhfbdtQEKt?=
 =?us-ascii?Q?Cex5gbjie5wnK4h0zkpO6RqwYOaZAwTTdAPKm+F10OqUbjn0KiOuD5jbd3di?=
 =?us-ascii?Q?iOcoUCi15s1Du8WMZysBzvlox3TUBeOY6ooDh64FjsV7Cg2/C4yMgjuqAR0y?=
 =?us-ascii?Q?xncmhw482IJbqDFQUzf5Tzg6LDaBJYmCXJh5HcFq+8C/cmGVinT7cedoWrFw?=
 =?us-ascii?Q?hn3qe1vRfottEoj4K/fbt08Y53wATnF6w1Jpxgtv9OVjxbFJ7MD+cUcSZNoC?=
 =?us-ascii?Q?+OP3cuNNwhdJ+G6nddipVoBRKVKc0Hxu9uZOgu5nUai7snUwVqyRAfK2ZpCR?=
 =?us-ascii?Q?7zvjtM1ZfJeUTtmoR62rEclRNFuCxq9+CQlae9Pp5C/9dronSV4s7W6ZGROO?=
 =?us-ascii?Q?hYTSw+U6tiMRggyW55LAmGLSwdk9Ct3Y+BbTVC3pA5hV/0anPILT6fOt5PRm?=
 =?us-ascii?Q?LDzxN3FMR7f3VfeoSsMAM+nXVWEa0R40jEezS+b86w4nCegNZi2mC9kIj3Oh?=
 =?us-ascii?Q?OkKME5/9I70I9o4DxSMxZXLjgiPRubRyZZflOUgVB4VO6oy6AbsZBcMKfIfw?=
 =?us-ascii?Q?Eb7NsRChY1Ymmnv2waAt39m1afKvPec8qqmv5PpcMNJKih/cFYGIT9mvw9GY?=
 =?us-ascii?Q?tnne+N4zmKk9WxEy0bjeA+lwmjXLy39U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9EAZrjUIrukfKpUv7PhOItr6c45thOwZ6RG4uqNnhGuG1T0+ODjFgr43fduY?=
 =?us-ascii?Q?n7UYSg2DBQvl6unUGSq/WKtm+sUUSZRDukcjcmtayHcLQhsL01DVa9m2MXmL?=
 =?us-ascii?Q?cFXpnrDWP1ajsD+mxbbCrmugGIAXRknunBu6MfXelBBm3WHKZbqiVe2yi6Xg?=
 =?us-ascii?Q?if2aVtmiNymsRugAdRiVhqFylZ595APQtiz2GEYckg0m3FRhWYfIskM1DTHN?=
 =?us-ascii?Q?QjTRQi5VXsFTBuUY5JY1KxiWGpd5287QS9yrwAMEWmmXkY8TKY0fp+cXLWFc?=
 =?us-ascii?Q?1Px4FJNqqijdJjCmh8znezKfPXSh6Vrj1XbFTTJeO2yz5wwNh4Lp7rMMqZrF?=
 =?us-ascii?Q?JG+xqLprc3lNys3Q8F4PuBxXkXP3n19iyHN6O9U0dWPwxR4lgcN2Q5caQ8um?=
 =?us-ascii?Q?mrQxz8q42DxQl3jUw40Tkbjlp9G8hR1Dy9ZqYyXMpXAcj50aWyp/IXKwOb6A?=
 =?us-ascii?Q?cnZ1cnqPdjcOzIfjiZTlvtuSefFqcCPxUz3Gex/A4Kj25oHvE+Kb1mFRjLGD?=
 =?us-ascii?Q?McvJP2MjW4EYrgeJ6wV8cQAVh1ia9x59AkxKx7eVk2HOPZiyw49Ay3C+u283?=
 =?us-ascii?Q?cjksSHCpe2jglFSxC0oZsweWbVSBdfUr3c0/1IRAMsqciYXsLbBANIif/dNh?=
 =?us-ascii?Q?2D2bZbTyh9g06VFtymWuXUlnVz9q6rlkPvocRgkedRUk3My6plyAsYuS+mzs?=
 =?us-ascii?Q?rpCJxQ038kc/NLKU7UpXjZ3cSxEQ1ympyK7Lf9tH/kezKpJTvT+KQI9Kl4wq?=
 =?us-ascii?Q?nzpCDDT9FFU6J8n58IGwmvM95774w1IXA+qO4VySKCQ/vvszxk4Gkzuc0kEQ?=
 =?us-ascii?Q?TUQbXlSMnldJYepzdCiql5h+/rQC7z0HbahMo9Ao1hgxknbUFQRctPouIaOb?=
 =?us-ascii?Q?cjrBmteUmBRPj9FY0Wccd1MlwqyaI4koCvaFGzFR9KQJfyUDP/lHxksY4fRR?=
 =?us-ascii?Q?WleTa4qmgRnaOtQ1IIj/yNOZ+ZWfmoMkGflrlGCpgoyGJ7XuEV23Jjq1C6ZF?=
 =?us-ascii?Q?HeBxOZBcg3Iw4dsY+J6swfXJHa7Iu6BPj59eH+2M/TTIJoO7K1GPIjEtfa0e?=
 =?us-ascii?Q?kAVDyYk/A16CF+oO5NF3LX4wu0437H97Oq/3QkuZixLAcqtftjuXUCTj8LVQ?=
 =?us-ascii?Q?cPcmVgf35urO9bcFtbx+/mLoerp6NY6nXlWldSNEcWTKfJDyEkBEsLhIvw8n?=
 =?us-ascii?Q?PyvN4+v6outry9N4aC7qTeCLGqEJ+47/3mVezr4QYDpw5fM6ExnqQd9FS+4k?=
 =?us-ascii?Q?pADnIEHOFvJmbEtB/Go7OcVvLDZRLvsOfTyaNT+ffo7hFTho3Bv1vXHOjEJI?=
 =?us-ascii?Q?pvOoGwlZQkDEfOzLCRrZL5pkVztBxpt8ax9sUt9eY2C0imFIXMJhAk+zG4Od?=
 =?us-ascii?Q?zEe0lfS8FBslb797mARUHv2XgsoT78+uS+304wXUuNRq5LR037C+heyMDUbW?=
 =?us-ascii?Q?9jdX0l7xk9/y00pCuZ0D1kF4+bxJ/Z77kH/DffUgShqg5PHNxXy5M6sACOS4?=
 =?us-ascii?Q?JhK+AGypyRSVPnrbEdHNl3NDG2+WOIToBOEH2p5RssPmJNg3xQFLJHXZGiDx?=
 =?us-ascii?Q?HTh7FRVi/wUXMXqMCuzrpe3hrkxjAulu8yZVAUE4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3IyzKUNbtrDXWARYr6jXg4YoofEZeUcQBrec9Znm6oOhWfWP9R7iPWkpbwfO2BMjFV5S5PFl+Eo6XO6lmfnQUUxQSga24zpjF3z2ApsWzLHuTESbu274zMIK/AVVhp/JR/rf98a/qhP9S6S7NWpQEoDcea/ubkqkEPxrGihqvI1k6xWJCaoYmu5yf6a1fUDuoocgIdeSWhFCuddO3Qt2z3NmK3lo4MfE0F9Njn1duuweQyaXeUYj6x735/zL8tRX5Lw3q4KtdyDrnIak7ByXw60TPNUVKuImH9RR265lf8mA8Gz61LGJuL1pl9QUnyWNWVOCydy848mBb5evDOaCFn/ZxOZsiqvffO8xrCEMsGbnEmyaySy21gM6eYswzqBsXMGUt5c1rZZTu9yPAf4BGEKY+8Wq87gjYLPRluW39nuXxmz8q0sm4RUwtbKNte7twpaEL9V2jKCWiqwVQLdov8dRorE9U7QAoUn667V29ea2O9wkz04vzxHuzRZPivqilFRzoov6hqDLW7pDLkarFyYLTmO5BvvclkNZgImCrWKvyxAJ4ju7dm6NXsmUhhMWH6M6R1dEU8o3JZ6JavuEWXBmYJS9beUQHtRa3ww9UOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac1ae5-bee7-4e24-f400-08de1122f25d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:24:52.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hvIvJjdVmx5vIwmrrpyLf38DGKUBCHlbEjwhXU3gTp6gS9p/XXd1CvjhgSX9PJJoYzfGgvqfe6iBpbGVqiBLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220032
X-Proofpoint-ORIG-GUID: QJUOx1nu2JLel4cUIn1IgY_eMwSKwhW2
X-Authority-Analysis: v=2.4 cv=Pf3yRyhd c=1 sm=1 tr=0 ts=68f85c98 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=yvIBNqMXTie84SnjEfMA:9 cc=ntf awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX6CXR4hPtlNU0
 hjlq9+pfmBJfw/T/X/k1Y00H/0Cn8HnGU6MCo8F4axxY4Putfj6uAgOYxKWCx3xrC+P6DGbvmL7
 Pgxhev7/w48cRY4MNaSCQhAxceWUfbSVW2/dadjo19opk/HYX5WBlsER8LIKBWaG5wxhJz3tMDb
 46aZWaAbc0qesOQLHCE+EIM67TcmA7nm1yHIC8Ael3YfmgpU2iLXuAuWEDL3XkJyyyzlWlQls30
 pl8Y6Fn2QgKvUiy1G+B9a5YOTP1RNA+bPaKA4xzCsJpvfFnl+z4xALmfWHwLoM4lIw/W6azKlqu
 ZcNTTgo4/fOKL8+RGDtqMsjeXnlSRjJpWRSUuFT+2VNMPgK6SEXtrABSmvzb/3T5N2QEPLG7vA1
 RmbdCUHyT29fmZk/jTvASc6gDGVBCZYFROtneLGvWLUSA+wUMwI=
X-Proofpoint-GUID: QJUOx1nu2JLel4cUIn1IgY_eMwSKwhW2

From: Eugene Loh <eugene.loh@oracle.com>

While we are at it, break up some of the super long source lines for
future maintainability of these files.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/function_stack.md  | 26 ++++++++++++---
 doc/userguide/reference/function_ustack.md | 39 +++++++++++++++++-----
 2 files changed, 52 insertions(+), 13 deletions(-)

diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
index a92c61a0f..903d3f090 100644
--- a/doc/userguide/reference/function_stack.md
+++ b/doc/userguide/reference/function_stack.md
@@ -1,17 +1,33 @@
 
 # stack
 
-Records a stack trace to the buffer.
+Retrieves the kernel call stack.
 
 ```
-stack stack([uint32_t *frames*])
+dt_stack_t stack([uint32_t *frames*])
 ```
 
-The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
+Returns a `dt_stack_t` value that can be stored in a variable,
+including an associative array element,
+or used as a key to an aggregation or associative array.  
 
-The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
+When `stack();` appears alone, as a singular action,
+it records a stack trace to the output buffer.
 
-## How to use stack to obtain a kernel stack trace for a particular probe
+One can optionally specify a number of frames.
+If no value is specified, the number specified by the `stackframes` runtime option is used.
+Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
+
+## How to use stack
+
+Here `stack()` is used to assign to a variable and print later using `%k` conversion.
+
+```
+        v = stack(3);
+        printf("%k", v);
+```
+
+In this example, `stack()` is an action that prints the kernel stack.
 
 ```
 fbt::ksys_write:entry
diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
index be9436f82..a70cba54a 100644
--- a/doc/userguide/reference/function_ustack.md
+++ b/doc/userguide/reference/function_ustack.md
@@ -1,17 +1,42 @@
 
 # ustack
 
-Records a user stack trace to the directed buffer.
+Retrieves the call stack in user space.
 
 ```
-stack ustack([uint32_t *nframes*, uint32_t *strsize*])
+dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
 ```
 
-The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
+Returns a `dt_stack_t` value that can be stored in a variable,
+including an associative array element, 
+or used as a key to an aggregation or associative array.
 
-The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+When `ustack();` appears alone, as a singular action,
+it records a user stack trace to the output buffer.
 
-## How to use ustack to trace a stack with no address-to-symbol translation
+One can optionally specify a number of frames.
+If no value is specified, the number specified by the `ustackframes` runtime option is used.
+Frames are included either up to the root frame or until the specified limit has been reached, whichever comes first.
+
+Stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
+If *strsize* is specified and is non zero,
+`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
+Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
+If such frames can't be translated, the frames appear only as hexadecimal addresses.
+
+The `ustack` symbol translation occurs after the stack data is recorded.
+Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
+If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+
+## How to use ustack
+
+This example shows a D clause that stores the user stack to a global variable,
+then later print it with a `%k` conversion:
+
+```
+        v = ustack(3);
+        printf("%k", v);
+```
 
 The example shows how to use `ustack` to trace the stack for an `openat` system call by the `date` command.
 
@@ -19,7 +44,7 @@ The example shows how to use `ustack` to trace the stack for an `openat` system
 sudo dtrace -qn syscall::openat:entry'/pid == $target/{ustack();}' -c 'date'
 ```
 
-Generates output similar to the following:
+This generates output similar to the following:
 
 ```
 CPU     ID                    FUNCTION:NAME
@@ -35,7 +60,5 @@ Mon 20 Feb 17:38:15 GMT 2023
               0x7f6d63fc2e65
 ```
 
-
-
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
 
-- 
2.47.3

