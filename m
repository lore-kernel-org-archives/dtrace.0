Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2D1DE4D4
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 21:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738100189; cv=fail; b=IS6v/SgkEPB0MbCuTRiH+wVEgQcyDQ1BJfAdN5Ei8JtdjCMo5G6AQXqGDrBi5DekJRo4YaZ5EFDed93gU9gGhLYnz+P56rXXq1EPecV81zCrviCh0CAgBS9sddag1nBWuZHCjZv4NlDWzaDFJP66yfwQ2igc/1prySpoSngIzhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738100189; c=relaxed/simple;
	bh=f2iS/9/kV88eXSOoTauruyqBpK3YJWary1RRHBZCZ+4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Mu5Xbw/mVnIMiMSbLHmkIRbbHjxQHjl33oaj3D5ylj89EfBq/zCbtXLLtMTu5WByAGRiCfznXCMatV2SefGXp/0ATr/cN2t3NZBCmY5MIo4mP6ziqSSpKe2dto71SCiLQflQ991aJPNFI3cTwd6qylJ3tWDEEJWaFL2w2TxqvQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CYKyFsjp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XipAnY+s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CYKyFsjp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XipAnY+s"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SLWo1j010352
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 21:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=xAoEXfcJ/qF9bhTnS2rhxYfjq0RWYuWpGqkdUEHIM10=; b=
	CYKyFsjpx7onPawaRll+2F6NsbhqU1+TGwziUaweAMAYcYrqOyJcDzPLRqWFz7EW
	NpTXBqEKGT/kkNmps0bbGO4sdx2k/6B4JA4m3sK7Fk0Svq6QrldHx292O+UVuMKR
	vWL+YjySKOdPasew/VOrngU6OUp34khLfY2S9BlewQc5iHNH9j0GNhVn6IPLAQaX
	Wp1w15eLKlzsJGrfKa1IlCAiuoGld0rIW3UNyEzSeH+BNSsmHi5qhxNkvj1dbU/E
	s4uKnTqBq3kB4GbNxRC93QaWTEQ/cSSXhthhObMvpys6XoiUNbplJTIpOfu/cNpC
	DCKBW810GLIFzdO7CLuMuw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44f783006d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 21:36:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50SLYqHf034436
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 21:36:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd8wae6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 21:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgWBPw5PJu7KR4ZnMvZ0aHag1w3q+ONkbzaphxulyYBygYu6j/yhCMRL2nv1mYaFdTbPuMffz9ERi7qvywqhUDKDdv9q7ngsJXIvAdEG+aDZIxDCQB5d47mEu5l/XNpPp8JVbcogpC4m89vVckNBOlXylZNdwaku6TorxnCgGNdFKE4mxv2dkFPL8gm+dgN7CL/PxU2pG6hEsgGom9NYVbo+p1jmeohRCLEWJdBBsJaLqfccKmZlsmaxmfcjz5mPTVzaLtF4D1UQnuPLpS9roMeDGR5ryNbuUt+aEPntU02CvIVyTHVMm4fCFgF4lR+0R9uUiDF/co8emvGgzxMFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAoEXfcJ/qF9bhTnS2rhxYfjq0RWYuWpGqkdUEHIM10=;
 b=MyWr+Tt8wi9/2TkesSKrB8J0t6yg8yyNPu/EPA+S086fi2YpNyl/iyut4g0lfDBoHstDEDyl79/Mj/lervHJwOzwNuWXeN/C64ayC+XwV5xiQ/uMnjqQCa6hXRmH3aSyt50QE9ZXxfHNmqzT8bHI4MdQpToPxQEBwan+HCIt6d+GydQ7Yiiv6iixkI3a2lNDiR+G2/nn1uZZZLoYJv1+Pp9/Hk8aCOFEvQs6cgKQ9b+ZRaVPk2JqhSXa3KMhJo8Wutlz3Ax+jfOgW1IGw5pH+dO4gUTvUVwYbVbc9terhFmkJsYnrHawEVjntyfrPkcnlAL+yB/3I6Gt2r/IRbkBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAoEXfcJ/qF9bhTnS2rhxYfjq0RWYuWpGqkdUEHIM10=;
 b=XipAnY+scquxS6dpeilWRu/FO0FmzTvKF7YjBqxPYP63pGWUDWdSSu97uT6T3w1Wbeqyp3Vara46GsfqVuisqlUfsgd9INnBwfZpEzcx2q3LVvxnEp4kXH8wbCgqu13+VQhxEzlAuyGHyo0p3vxYCJP28QrPN8DKoN6BISPPtY0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7457.namprd10.prod.outlook.com (2603:10b6:610:159::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 21:36:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 21:36:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Improve resilience of tests to ptr widths
Date: Tue, 28 Jan 2025 16:36:21 -0500
Message-Id: <20250128213621.2617-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 281728d8-8640-4454-9f20-08dd3fe3cfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D7eumiQqvEHuCjJJ/RLpfp6HtA6Vnib+rZckzc6//8Z5IQ2Bb1K2ZbyznAjV?=
 =?us-ascii?Q?1DPw5wox3Hz9+JSMRX92RPC30hTDGuAbKN57u8199I/V5WvDevEloDzLnn4N?=
 =?us-ascii?Q?bUJWrr9MyCOoGQv2Xjiu0ozr+MaO6GlJ6/fRanNy5brE0mrKg0nGopSPSQoQ?=
 =?us-ascii?Q?p+/1M2vpJ+xEqpB170UQU/K7sKgMpuq2RkgvV90stNPtTbV3Bmrcwf5CmH5p?=
 =?us-ascii?Q?DLcmjK/Xl/6uKk1IlAY66Kshjiqa6LXM5P5y0IRLD8UmXiAPsriOJLm2O5BI?=
 =?us-ascii?Q?SeWCaUVWWhzohv8HRKEIrq6e6m1ZFAZk6fInaswqxya1OqTJgPTUR65deV0h?=
 =?us-ascii?Q?o9lf8O/H+CjKIvt9WiT3E4fbgTrS0za2mFayrTJymLqP5FHZ8s3ANBLTaD++?=
 =?us-ascii?Q?eaZpDZdK3RYveP5p1yeSVQelqchTZzDS+xnBriaaj6eaqDIBkVVqXY07RpZS?=
 =?us-ascii?Q?TG2PD5sR3LXlMUOn1C+qJ1zGajaMUCpFLVmqog5yRGXcTTt1FPmBzjAb1UQu?=
 =?us-ascii?Q?N9+KS4jU9PQVKjHxCwHPP0RaFf4rFzSg41l/Z+A6a3g7JJpLS1onrODMPnwW?=
 =?us-ascii?Q?s9BXpx07LBOpWCDZP2pQditC+YwPRF1z1yBOWXEfuIhluiPjPP6j7k21xFpP?=
 =?us-ascii?Q?1K84cHPq/D1kGdvWTZW3UbUfJSmiG9+8PGAsPalZ3oJoMKZTWYQyQ+E716op?=
 =?us-ascii?Q?osc1vMJsQKY8c9u5SX+QwjWfuf+ijN7FzKrnS8gQ1GOq1esjLEsO+Axms60X?=
 =?us-ascii?Q?liL/5xgkD9DNeMKpdEK7otH8HGNPtvr9/73q55MwXvkWeF8GTfzlmI8tFR49?=
 =?us-ascii?Q?4vrzGZzJXBLTDEYyqVQ3j/kYC0lY+srrMQmUhJm8CVZD/2EJNqEcZzLjMcaP?=
 =?us-ascii?Q?lR1mA42ErmvGRIfBIW9dmhIGh83Vnr77nlrno1MdZgCft1G578qBsBFlbL9M?=
 =?us-ascii?Q?RYdN1svlaon67vQd+I/EyGDHcl5AScXsgn+eRj0h7B3cZshbFE+KkPf58Fx+?=
 =?us-ascii?Q?5UMvXKHGvGBenMi3ew3EXF0kPgXzQDXUNVZdDBDihVIxkvksFDNh8pyCUl2U?=
 =?us-ascii?Q?IE4wNE0z6R9P5y3wKb8h4kULI/ivpECUPnp0khsXJyT/XyiN5hi6HkTtiHri?=
 =?us-ascii?Q?s5hVLrQyumiH6cgYoODhcsQAgdtce9e9GMF/judTSPQ2XyOILXhYYd0teafa?=
 =?us-ascii?Q?egOI+up1Qa+N9b95mqXk+UfwEw8PwxvAyLOWOlUcOdG1kpZaKrUbHGX1Uvv2?=
 =?us-ascii?Q?JOhmP5cn9cfW8seLgD1YaGgFZqJZY9XGn4kZx8hmE8wA+jtv11fBOBs31lfQ?=
 =?us-ascii?Q?T+vq6INlE2Nmak9oS2I2JCHJyctjyV1YChgggkhzDinTB1d6kBKQQaL/CdlU?=
 =?us-ascii?Q?b8+ah1uJsx4JpMW4/FCUQSvKhCra?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JeSXES1QdBMlPZVuKmG/3yhmd6VPCIMhfuafp53x2a2cULR0msNndxxzlvTW?=
 =?us-ascii?Q?4k0XvYzbSgO8DaPno3HuA5B0RvvY3hQGBGfaOdy49CKIkA4o/IxWfA9vpq1R?=
 =?us-ascii?Q?CNFzuU3l76Zoch8+UCVxYgww9mRiLhipuEHcGX5U9s5tdVCr541ZCPwWd3It?=
 =?us-ascii?Q?oxl8NCf/gG1bA+jxwQsEFwH82MbMywXEvyilCROtEHa0SRhkUkQQYfZpPs9q?=
 =?us-ascii?Q?IrnCwuDnPRNMYK3tVnjmEVcPM+afNsdg5PmtMed7ijForAXAOpMEZi74Me55?=
 =?us-ascii?Q?XNjpjaYihWGwCVyEYQeanSdm0sOk6rHfDfK6t8PNSF0piphzUtad+N6VTvSf?=
 =?us-ascii?Q?mvge6F2LQo73ROqdB098VMGOsG/s/de2Ldz3RCeEre/VB2knOdoxWoDIOkiG?=
 =?us-ascii?Q?CDZ1c6KCx2cNM10yxVQ5qGCvVKGqpxfJLUpdj+Qw9lwmYw4I8iYhC/mcAXSu?=
 =?us-ascii?Q?aKZwLSdOVMID9e3/GE+gOFogIEK7nb2SwIrzpDTMZht1Qo2rTnfHtyZuLSmf?=
 =?us-ascii?Q?2PV1iEOfcmqA8Rt48R6y9CiBpcELCup6OhikZ67dyO2JT3XM0jkXIE8Zyl+6?=
 =?us-ascii?Q?vzFXxijj+1S9UJ7wYQOqQhyJBIxyh515qNc7DkajI5TzyWJttIoNCWmzwlMF?=
 =?us-ascii?Q?hO5tOB6g0iclhNnkEFI8r9NZh8/TKCi3Q2ML9mDTu4VKGugfygLVv6fDZxil?=
 =?us-ascii?Q?2Lb8i0ZZ6C+2jXiFzJZSqcsWc2bX24wNbEG5BPKCk/YnQamkCfVR1socoCLY?=
 =?us-ascii?Q?tL0qsmgzaj19xDDCFWBqy7lRvsM/me9fG/tPkFiKTDY+3j5YROksiXCKmAXz?=
 =?us-ascii?Q?TqvXxIP0Ao7l2QIyLrgD9LVIScc9hLfoXt+D/fQQDF+pFmtArimWo3F9vA7j?=
 =?us-ascii?Q?G2NUMFoX7hC7mqmcbUX9aNm5YBx6+4cMMRpluUIxJVwsYxUF7VIBhCw87Dy7?=
 =?us-ascii?Q?a0m9IYyS8BuDeeElk/vxidW1DVHES1AgQtMWEj/j0PTNLRbn28ebkMD7oMz8?=
 =?us-ascii?Q?sTJbOyO51lKwwWMbSnLYjgf7mmZSzusXcwt1TiPCnsDlLY9YnwcbcjmbSrp3?=
 =?us-ascii?Q?JFaqOHWStXGiptt+9xKTJlO3fjLzbnVsyDRWMp6cVcLJ02Ex/iI5oRyPWnwu?=
 =?us-ascii?Q?mRSuwrhN/L4dHuxXOtVIQvENPGZLsnfuxQyDAdmVgXv+oOThOsDFGLy1/HGN?=
 =?us-ascii?Q?iDIEadeYmfSPKMG2N8c2/mOo0dzvPaxysXQty/yVM6aDkwKFH+6liwLDJneV?=
 =?us-ascii?Q?GaqB0Ne0Tk8o584X0eHtqCLVHwPiRaQ8RnkL04+6OiMOtgqXWva+aG/+nmuS?=
 =?us-ascii?Q?k4NgTRpoy9Ml9pbswYhBDIRRMe+bb+N+fuuVLorFrF8aJgOAeklij0DS0fmD?=
 =?us-ascii?Q?U1TYethOLY6gHkfY4R6zbUb7kKCkZxp9jRZepibqx4Z+TGCC404o9ME03K8n?=
 =?us-ascii?Q?NJZ0ZcT0qWED9DpObvqsxc4UnLI8LPagC3Z1vKwpv7Hta+/WMyNM0czfcg3j?=
 =?us-ascii?Q?k7Y5qWRA3kRw33+wkUaLHAYNrEg8hQ0i6Qv7l0L/gTPHn7We8I6Tbj2DfyQP?=
 =?us-ascii?Q?e8b+72L9i1taWG9qB0F5nNKL4F+0eGXX7OnqvUBe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oh9CR+ozaYGlVEuq7GA/XDG4NF4DibAT2igT4AScYGmlutJyPRtJrUVgBgYM/BD+kEzLurxLUW8t4sdjlKo8y38H2hRuWXzY8Z7iTWjhMTcH5/cAV52U5BWVbQkdlesTaku8VFYMhldpeukpvTywO+ClNWgdLEabYXvuytPfVm2HWgeTTO/V0TeyPFswyMlI9cKnP9mghtqabRHFakZYnGiQ4FrmfbHZa7xZ1Kil87pqq/8Oli3FSTg1gsKZZkhOiYH3fxFL/BgIzyUwSnK2fvoTskqV8tUcEdVTn/1xo1CH0kRv68UBTkaKCiT1i3gSNEVW5f/IX3k9RR7PNt+VspGWSwTJkd/kghlHNT5BzDHW1X7X29umLy1F3PYWJFiUkXJT1r2Mr/nOGS4B7VwXyQTuiH4JBdtusxFuXRrtpn0BHGA5xu5DyzzHnoPUveJQoznl51LSXtSor1XkYU9t6SNn8JB4jGYF/iaJoBPGRcoXs0Qg1kQGMJ7HSJY1BtGv2a14mXFbT8MoygmRfAQL4SvEgQ044mg4Xbnt/K6bxaPEPwFWmZ/nzqjHlgZWVrdNC1TrEe7nCo7O961lsUePIY/jN4nLZY1QKsLLaS+8g6Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281728d8-8640-4454-9f20-08dd3fe3cfc0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 21:36:23.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l35zc3xSqiszPTwnyzRbGsEoaouI2Tj+lefYYiT/jXOuvY2m0REhg3bsT8eP73+EBJp3z7wE7C7WotPnwPWwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7457
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280157
X-Proofpoint-GUID: iFUSKWUb55dpbNJD4WURql2UeumSmtd6
X-Proofpoint-ORIG-GUID: iFUSKWUb55dpbNJD4WURql2UeumSmtd6

From: Eugene Loh <eugene.loh@oracle.com>

When tests are run, runtest.sh runs postprocess(), which among
other things turns irreproducible hex strings (presumably offsets
and pointers) into fixed strings (like "ptr") for correctness
checking.  In a few cases, however, there are trailing blanks
to justify the right margin, meaning that the width of the hex
string can cause the number of trailing blanks to vary.

Improve the resilience of these tests by stripping out such
trailing blanks.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.uaddr-pid0.r   | 2 +-
 test/unittest/ustack/tst.uaddr-pid0.r.p | 4 ++++
 test/unittest/ustack/tst.uaddr.r        | 2 +-
 test/unittest/ustack/tst.uaddr.r.p      | 4 ++++
 test/unittest/ustack/tst.ufunc-pid0.r   | 2 +-
 test/unittest/ustack/tst.ufunc-pid0.r.p | 4 ++++
 test/unittest/ustack/tst.usym-pid0.r    | 2 +-
 test/unittest/ustack/tst.usym-pid0.r.p  | 4 ++++
 8 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100755 test/unittest/ustack/tst.uaddr-pid0.r.p
 create mode 100755 test/unittest/ustack/tst.uaddr.r.p
 create mode 100755 test/unittest/ustack/tst.ufunc-pid0.r.p
 create mode 100755 test/unittest/ustack/tst.usym-pid0.r.p

diff --git a/test/unittest/ustack/tst.uaddr-pid0.r b/test/unittest/ustack/tst.uaddr-pid0.r
index a8e68f4e6..cc1cdbc3d 100644
--- a/test/unittest/ustack/tst.uaddr-pid0.r
+++ b/test/unittest/ustack/tst.uaddr-pid0.r
@@ -1 +1 @@
-  {ptr}                                               
+  {ptr}
diff --git a/test/unittest/ustack/tst.uaddr-pid0.r.p b/test/unittest/ustack/tst.uaddr-pid0.r.p
new file mode 100755
index 000000000..9203dc824
--- /dev/null
+++ b/test/unittest/ustack/tst.uaddr-pid0.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# remove trailing blanks
+{ sub(" *$", ""); print }
diff --git a/test/unittest/ustack/tst.uaddr.r b/test/unittest/ustack/tst.uaddr.r
index be48a12ab..cc329e213 100644
--- a/test/unittest/ustack/tst.uaddr.r
+++ b/test/unittest/ustack/tst.uaddr.r
@@ -1 +1 @@
-  ustack-tst-basic`myfunc_y+{ptr}                     
+  ustack-tst-basic`myfunc_y+{ptr}
diff --git a/test/unittest/ustack/tst.uaddr.r.p b/test/unittest/ustack/tst.uaddr.r.p
new file mode 100755
index 000000000..9203dc824
--- /dev/null
+++ b/test/unittest/ustack/tst.uaddr.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# remove trailing blanks
+{ sub(" *$", ""); print }
diff --git a/test/unittest/ustack/tst.ufunc-pid0.r b/test/unittest/ustack/tst.ufunc-pid0.r
index a8e68f4e6..cc1cdbc3d 100644
--- a/test/unittest/ustack/tst.ufunc-pid0.r
+++ b/test/unittest/ustack/tst.ufunc-pid0.r
@@ -1 +1 @@
-  {ptr}                                               
+  {ptr}
diff --git a/test/unittest/ustack/tst.ufunc-pid0.r.p b/test/unittest/ustack/tst.ufunc-pid0.r.p
new file mode 100755
index 000000000..9203dc824
--- /dev/null
+++ b/test/unittest/ustack/tst.ufunc-pid0.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# remove trailing blanks
+{ sub(" *$", ""); print }
diff --git a/test/unittest/ustack/tst.usym-pid0.r b/test/unittest/ustack/tst.usym-pid0.r
index a8e68f4e6..cc1cdbc3d 100644
--- a/test/unittest/ustack/tst.usym-pid0.r
+++ b/test/unittest/ustack/tst.usym-pid0.r
@@ -1 +1 @@
-  {ptr}                                               
+  {ptr}
diff --git a/test/unittest/ustack/tst.usym-pid0.r.p b/test/unittest/ustack/tst.usym-pid0.r.p
new file mode 100755
index 000000000..9203dc824
--- /dev/null
+++ b/test/unittest/ustack/tst.usym-pid0.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# remove trailing blanks
+{ sub(" *$", ""); print }
-- 
2.43.5

