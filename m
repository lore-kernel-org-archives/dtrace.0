Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4411CB508
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802785; cv=fail; b=W1AOv+p+mOfoKddeEsasUU5w8yj42ryl+HLq+NlV5pTk5X4fvx5D33apIOP254ZQQh2N/LckdMiDdrZxXfoSiawXqxOs8GL2H7XHnNibMzPKFl/PO+NUw3CT/9owZ3Xu2P61M9Qudh+ZYqDu822Xyc2c8klOhw4KL/HQp9TECeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802785; c=relaxed/simple;
	bh=2ahadzxPGb2cZtIoIKOQwylDjbYbo3gRMzHVoLqYN7A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=j14+UDzyNjsBMyb4OPkV805myuygSaWE8b7r079nzVGgxhDe592aEOp5Bl5pvtqHS/ertBI+Giaz/N1EEimKyB0fYhBNsUQevDZVYht5hSJN5xE65CakkiUIwsGQjZ2Xq2JiKIdWU5P24M7E8IOfjtCET0nC7YLuu/cQoJiswy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WAu7ioiT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uV783LBV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WAu7ioiT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uV783LBV"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491HBt2e011011
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=PVYru2wyaNbDd2
	zkopn61Oi5uBJRv+toGbMD2SoVPIo=; b=WAu7ioiTVVhHstBvSc6Vye0bS//ByA
	Ua757jvHLdW10SYGAQl8FJn/eNDe0XhG3HbrjL3IQp3PHs6LYG1OZGTXOc94gGn/
	M/5ugFueeZfxqF20C82yJLMGmo95R8j3V6uaFa6JxOxmpehfdtPDP+RS9Xf7ua8a
	XIJctCm/MJ7CqKvYlnBb7aywyidgK/VnrhJggTrP2wiP3ahlQdgpVmRptIG4al04
	GHfwNWNguZo7XmSXfrC4wR95PzaifKThk2dvH9ns3Qk36//VM3tU6a4rc8dmxr4O
	pprr22Z3GQVXbPbA2k+F0R+wh8O8J/fbvRAA7LCUyllNC6aWVp11+YVw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x9p9prdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491Gi06X038718
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 17:13:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x887v87g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 17:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJ01qJ5uhlvKisdabQeUql6AInYTSUtbTJdiNzPhBuhYFB3tiautLh0MLAHFjZh34L3JB7/QhnSnTfPEbvlV9LDkkVn11+CLIKYg0n0v0Qd/L8TDvRYw3yfLJlygzxFXp5KRpj9G9blm/GvZNlG+0uqyPyiA0JjpuSTJ4YctATu6yJaHAsduLIOYrHrJplPV6ArtnjM/FiYmzoMnVMacPed+qBo9CI0Zme8ZBs7zffwSNKncklEn4Esg0XtmEC5/GYC3jMqVH1amUNzs2nzOGLixWi2YaRPD+yRviRUjHUR8HL9+79FamFoJUlyQEbgr0VVooIVHtCQ8mkti/NbLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVYru2wyaNbDd2zkopn61Oi5uBJRv+toGbMD2SoVPIo=;
 b=iZfop1JEkVtWxkhj6DI5iPl+qbGVc0ODu+uaaVFHEUn0j6SmjQQjwBfQlz74B0eEia5Kyldpqk2GYrpglIW3/I+H3Y26/5ddqCS4IF3DWkRVdOsDw09BLE3OcfMREros908b4Bk5w6VgL34L9QyLlFxEhleScZHa9S6Aco1EQXltw02sdS0riBk7Bj+lDufD0M801+edp2wOBh/DU4HM6+XfLB9AviDcNPaU9GaieJ5sC8JDVU8562hKg8MLKMr3Ipxl4n7siL6tMh0scvLvbulB37/NViBCDoDHLSvM0WogjE/hn1sCGpVTWGKbDT6yeEV495GUzBBBTMtyZyRx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVYru2wyaNbDd2zkopn61Oi5uBJRv+toGbMD2SoVPIo=;
 b=uV783LBVBoV4qgD5sMXOjcNgfG5/Ib0nJLpq9DVKujlagtSDL3v8UPcFZ67gJXlPg9oi0yFF0lrP2YBakQTp0sN24kmwqgtx4PBTik+859oZ/0qTBXhyI1sXl5ttya1G/ABpQcl5cPNVSrJ/P9oq2zbcRFt7tw0JRWTfHtG3fRs=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by LV3PR10MB7964.namprd10.prod.outlook.com (2603:10b6:408:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 17:12:59 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 17:12:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 0/2 v6.12-rc1] CTF rework to work with modules.builtin.ranges
Date: Tue,  1 Oct 2024 18:12:50 +0100
Message-ID: <20241001171253.426429-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|LV3PR10MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 860195b5-700c-4f9e-1b37-08dce23c4c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbyiSCUKMoRh9CwRQ+0n1dqvgOfNnzLuoFTWWSCzydK5bIrx8DDxEq6+BlXQ?=
 =?us-ascii?Q?fh993eP/t0cEYMX8pDQPgu9jUWxS3Z58fbXADU5z95z2idL40aQcNJhLcW6d?=
 =?us-ascii?Q?TD8Gmd6AEnIwsjJrefjjkHoxYRi9S9fj00pMvHV6ihkqQnBYdKGIXEHJf2/Y?=
 =?us-ascii?Q?cPj/0etqn+CixidMhM/TNF74F4UgtqEw/c5Kk5YWSPObX4asLsL2SR+QmES4?=
 =?us-ascii?Q?rYl9Ghzgws0il0spjOFZDZKJ37o8mT5L5E9yESvFJdzj/CE12u8zTuFoEzuE?=
 =?us-ascii?Q?yn9mFW3+gc/t7WxvYktf9NlFtp8LeCKLRQB2yvwQG4Ql24Inbv7jYieqrgrq?=
 =?us-ascii?Q?ly8bJKb+/gXBB5BXzVhsEB29uGeUPjXja+NfeSxkgWcT2/UEgU5zKPVN2CSg?=
 =?us-ascii?Q?j70QcYcSRmOkMvzpmuV36Yj42VgwOk+PUMhz1pGC/x1IonIQpkpUomeLGaZq?=
 =?us-ascii?Q?iVMTgYEKPOoB4qgaTHvp6logZP4gnI5acv5tkuUqgPPa4DvwOdAUsPUhGOO5?=
 =?us-ascii?Q?wpbg+nHeKIb/hyk7fHCl0ipjYSKpzuGt6y94/8EdCsw3FHZasZ1On2BgAm7p?=
 =?us-ascii?Q?zXHd/c56JqPLkckGKXeoobwcDSTgZ3XF+V4w65rBj4imwoNJSuJA8ozWhZbL?=
 =?us-ascii?Q?upUUB6LfrfTzgPES6r0opj5uLbzqMW78Fk+vmTLNIQO4OJB215gEwX/V/2EJ?=
 =?us-ascii?Q?lf8qHeeyhvM5bQXfQRxg21Kk4iCIqGz1pzRhIkSasP+2Wy9ECBanUOKAe79Y?=
 =?us-ascii?Q?fZwh822ttEm1JpXm2bRwe886nCkB7YUfoS+jIkJExbmXNslzLLlnH2qHMQn5?=
 =?us-ascii?Q?6aBZcvVBkOLIaTfGKjU7PXVjG3236jI29P89ELRPvzkRBU0CJUUQHZwO6Kn4?=
 =?us-ascii?Q?6M5Uwi1iWO48Pi9McWXBZKZz1DT8o6Y2eZJgBNVseMO3+SAbEr9nRrlti+Fe?=
 =?us-ascii?Q?woyMFP8dZp55azbq1242bA11NColC4FfwjCA4mZqxla622DbmnzcEK9OPwzl?=
 =?us-ascii?Q?fseoU99nQl310YG5NHW6fJjNsznWt48UeOORe1efILTqaqi0gQLM2k8RIDiO?=
 =?us-ascii?Q?i9gLDdQenvD+Xw/sMsAcHbLD55VrKutyUr3AGmKWLQ3n1MhItgDMT3ITI9UG?=
 =?us-ascii?Q?YD2TD4M91QqBEPtmt6MxR4iN/DWHo2iaFD6vFKEhb4evIQEoxC5jE6Gg1Zhl?=
 =?us-ascii?Q?GP+A65HIVyhSH3k/wXPaPLOJR3stEG9KfesiNp1Td9WDh3Sfzvc+IxzYpihd?=
 =?us-ascii?Q?D8y6azEWUxYWn0h5iTP6x4rvv0nRXYUVppmZQZ7CFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5sks/IW2o/qsRr1BTSNVUQ/+HDqJUGXvU2ML7rLozA84bNQ5wzNUD+KMz/28?=
 =?us-ascii?Q?XknA3XGHamLqurjw+Bt0ybOV0UDrOLYu+3sT02Fi9qOiYto+Quw6UzN0PjEe?=
 =?us-ascii?Q?ktl9U37uSn+jqWp95kE62gyQiLS7UkwvgMq8wg+5ow/vjljtW2ALePraJME5?=
 =?us-ascii?Q?uu4xRa1SnPpZ2RsfuOJpEUN1ouitkfnzr+HxXvnY/K7X26nDU+TUlLzX9pxG?=
 =?us-ascii?Q?f2OUh/hqRZsOQtGDINGAR67FAkFNzVjPWiZcHOpmDZbYHj/N3Ssw7Ax1ZmrF?=
 =?us-ascii?Q?/RJOU7EBNTAX9kSf/KifzJtuOLC2XFBlAac+9bAuxChA8HlbS0rooHFbF+8m?=
 =?us-ascii?Q?3/iglCTbrKe/zoBJW4ZXuOOcyEW/3iz9Jp2BeSz7+kvNkrNSD7tU4vhMSJ0A?=
 =?us-ascii?Q?Fx3cl5hkpkETv3/sd5IDpmT+TCypMHyXaCxc5hiNzzHJPJ/gPAUKok0K2p+j?=
 =?us-ascii?Q?zMbAiHGfdtlJMsb1+Jo96aZfJ0hUPsn5eg/1zfZ1R0sntVaxwqm98SmhVOPE?=
 =?us-ascii?Q?bnf+cLaBUaL2s05w3xmJFJP5sGybP81mAZO91G/KOH5rRGK5hKF8kYXjmnBW?=
 =?us-ascii?Q?Klo0kDnnDJtnjbP5Yb6H0R14t+/8rCtRqkj0AsoZudhBEPlUAHCL4k839JNk?=
 =?us-ascii?Q?sXURtBdUucO+O8gKPBIJ89RZYPzxO7N/PIoTaBdhVw26dRgovu7dX5sIVqhO?=
 =?us-ascii?Q?6v6EYb9Mv9DUekLrKgeJ6Fudw0YR39x1PlfT2J0sbDWB8pKmN3QkoIP7+K1T?=
 =?us-ascii?Q?EGJA0EjvZ+hQ0HLhcOAe1RjpdHD1Tx2RZf3+kGeUqFFATPBZT/ZjP7Q5S34N?=
 =?us-ascii?Q?BAIB31mHGBQT++sBKhddFZ3IifSAyeV3NqubwkJtc81YM1ffPtMoYH6C7cup?=
 =?us-ascii?Q?1XWyvvwCOqWHvpqgQsKxObEq7+gBmOZHqd1LCYrP+phz8D9Ybzc502gc3zC7?=
 =?us-ascii?Q?/VR2L/0x5JWeY59kmA5mFDkvT1Cz+mLDuqOiCU67SiKnzvErsFCnhq9cjcKZ?=
 =?us-ascii?Q?oTpPraG5AcsW7D9JBjzolbvi3skEKitqCtzLsuJodf/uS1VaFWhi1h6EyIq9?=
 =?us-ascii?Q?7s4SxW0900K78vQGWocrGUbJzX0FK4lshztUHb/zxtGRuAsISIo4BvnYiRUv?=
 =?us-ascii?Q?ig4L0fc6kRnZy4q1lHhRm2svPdvHR58C0CYvP/nQKCWKKxNrrpO6K957BPah?=
 =?us-ascii?Q?dnqWwIX6o0ahz+a2sKDuHBYAxzGReb0IegH42WzC4Bmtq3+1IWnt6FUFFDzu?=
 =?us-ascii?Q?WlpWNuV5wkdl2quWPMuzyCYilav+TrUAShCFlJfvfhoBN2SlEHMbpNdfqVG2?=
 =?us-ascii?Q?1/xDGNeo0es3sek/MEMAbQPpgb2qGwMMCutMCbhBRowu6uB8Lk1WgBmQZE8Z?=
 =?us-ascii?Q?92XUlPDhfi8p/JzAx6MXmRUKYdB8w5UTYaDFIGp5Ac0DU24TAQwMr6tLhSu1?=
 =?us-ascii?Q?IEi873S4KqEM51KALqnwzZOdTAJzkngnJDUIZlhmqSMsXIm2mpDBR1t9IGiB?=
 =?us-ascii?Q?8p4Vls3T/iRQZhO4A5Yjoj3jFbSegZl6HYOQYGRjF8NiER4hcMgFGz2pdEA8?=
 =?us-ascii?Q?Hv0p9ORVY8K5MnxSYV5QMo8qeHkiT5Zzt48zxfX6j8bMmnHjwQFmbkLWw7K1?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aCzxrpgJ7Fu63QCdTXUWAnaobfbYVNBaZjbCP1Iufxn8J1ole1+9jZazZ6WV/V3VdyWd1Lz7sjl30AmXRHuZSIn/1Ggd/AGRIWEr2E4w/txdYjYznJ9aGJrfxL+tjwUjOyVoBYGF1F3QBKbpc/ke6OuZlllOI1qFG/Ge+TWUJ0WX64AhzDK0yFQUh32rSIGY/C6WV4DPrTS5e9n6MAQrPxq9R97Vd7ckcj5oq79VRZOwQFbfrRtmA44A47sRbSKy3alCBuKhSj1tjh1eVxEdzIPJvuLM/kWDY7MGrimbo4Fgce7+xolwxITQH5ViAfEGDqh+EiB6/E8vp6dyarnVwelMNRQWQovZ/mbgkHdSM+p+hwqYbHx2qi89B/YC13ZS/sPPvAhc7hJLJaSTDfAfcNe0aXHC+tqcIXAtGF08PCzCjwdYNV5MAyPNiAlRLjXh0ntUMGTwLnr0MDfpBAf+GFZk7EhnY8Hktg0+gUatc4KwZSrgqhMCcnqZpOqK0jwVmrOR2HhorwHkjL10eFlRB9G8RXOC+VcIIDxIMY0PfQ4iZldDcnheiKLWvJ5TZRLzn7Fjs/ZKili9oDLza9/8lhtNjnTwkm5JEc2ug9pX8XI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 860195b5-700c-4f9e-1b37-08dce23c4c68
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 17:12:59.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oY/nWBCWF19JOi5/dJUIGeVTc2Ftq2p27PZvS2rO0r2la3fYjNwRk/sZdjCZfdPHps5poT1sDbqdJMVL/c431w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_13,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2410010110
X-Proofpoint-ORIG-GUID: OSiDIELbNKesqmJ-GrEc1b3UnJEaV33l
X-Proofpoint-GUID: OSiDIELbNKesqmJ-GrEc1b3UnJEaV33l

This rework (against 6.12-rc1) makes CTF work without any of Luis's
modules.builtin.objs patches.  For now, for ease of review, it's atop the
existing series -- obviously after review I'll squash it back into the
appropriate commits, so no sign of modules.builtin.objs remains.

We also fix the unfortunate problem whereby make ctf repeatedly rebuilds the
kernel every time it's done, and the bug causing a.out to get left in the
build tree. (And we also fix libctf detection with ld.lld, though it still
doesn't check that $(LD) can actually *deduplicate* CTF, so it'll misfire if
ld.lld and GCC are used together. In time I hope this will be fixed when
ld.lld gains the ability to dedup CTFv4, but that's waiting on the FSF
license people. For now, affected users can just override CONFIG_CTF's
defaults.)

The patch is much shorter than it seems, because the renaming of
modules_builtin.c to module_objnames.c confused git's rename detection: in
fact, the one file was renamed to the other and a bunch of code was removed
at the same time.

Pushed to nix/6.12-rc1/ctf-rejig on ca-tools4 dtrace-kernel.

Nick Alcock (2):
  ctf: rejig with better builtin object detection
  ctf: fix config test

 init/Kconfig                                  |   2 +-
 scripts/Makefile.ctfa                         |   2 +-
 scripts/Makefile.ctfa-toplevel                |  41 ++--
 scripts/ctf-module-objnames.sh                |  35 +++
 scripts/ctf/Makefile                          |   2 +-
 scripts/ctf/ctfarchive.c                      |  14 +-
 .../{modules_builtin.c => module_objnames.c}  |   2 +-
 .../{modules_builtin.h => module_objnames.h}  |   2 +-
 scripts/module_objnames.c                     | 160 ++++++++++++++
 .../{modules_builtin.h => module_objnames.h}  |  20 +-
 scripts/modules_builtin.c                     | 200 ------------------
 11 files changed, 236 insertions(+), 244 deletions(-)
 create mode 100755 scripts/ctf-module-objnames.sh
 rename scripts/ctf/{modules_builtin.c => module_objnames.c} (54%)
 rename scripts/ctf/{modules_builtin.h => module_objnames.h} (54%)
 create mode 100644 scripts/module_objnames.c
 rename scripts/{modules_builtin.h => module_objnames.h} (64%)
 delete mode 100644 scripts/modules_builtin.c

-- 
2.46.0.278.g36e3a12567

