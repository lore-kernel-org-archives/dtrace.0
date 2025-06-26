Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FFC28C039
	for <dtrace@lists.linux.dev>; Thu, 26 Jun 2025 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950595; cv=fail; b=u+Nzi+dLVJGCwTslK2TAx/MDZ/3oTGzIOEvy5YYC1ZPM8DiKJaj+ISyjIqkUdi3zPY5NAXnMcFUvQQNGrGR7Xm/LxX+v1ArDdTfru9+7J2ensfJrPZKg+k13ye31EzT9QVpT4ym8K03t+9BVycy6QeAhXvwFLH02Uxvb+JgqBAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950595; c=relaxed/simple;
	bh=4yLDJueMUp7K3qRRFk9xbrnvrX6SGOEbZermpDFKvfU=;
	h=Date:To:From:Subject:Content-Type:Message-ID:MIME-Version; b=a2v1udvvcLJUVSJlx2JfhsCMbqPLwWkQsQKsnVA8oVUoBr5VZxr7jci6RaZoApMm+PdPn8wS/F2PakCNowByZdbRdWV/zOpAutnxnNT1WRAWaxm4zxvS3XEb28VNf2NVySPvf9VeyJsbfd4L/T7dAus50DSD5mP/+k400VtE+Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EXFkCBUJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OkocDHQ/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EXFkCBUJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OkocDHQ/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QF77Y2021586
	for <dtrace@lists.linux.dev>; Thu, 26 Jun 2025 15:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=; b=
	EXFkCBUJ9F4w80EF325R0htxY57u/Sk2DEKdRSLhpGWiexYuOMccs7CHrIM3zLlx
	oljgLgiE3EYTSAy7yHlY4fvFaE8ocpY65ZbjqFkIld0oHuXM1M3QhOqSnP0Ta2R2
	WddG0wowEQ9xFVAB+7rVmO+jKSl8GBypJo9s8NVQ79Jji4sEe8wiAepfaEQ/ktkf
	nOOgvgd0u70Hkd/qIsx2j7bZdq95xsREwFDT19tb5HPMdY1Z5rPi8ck2hVnbJvwt
	gnpoPRJCVfG0U5ozqsPu7rZ5MWv+cUUoksekoyTY3el9VCnGTLdUfbrqByC/UUpu
	l4p04N1rsM53/SUKVI9Vaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7v26fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 26 Jun 2025 15:09:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEKIcj019339
	for <dtrace@lists.linux.dev>; Thu, 26 Jun 2025 15:09:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehktmm31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 26 Jun 2025 15:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgKOW22cIFZ1XbuH5BepNW7Ts7NGJ8eFHFVLqZDb7xjqUsDTnVoBULs+F3O0vaHpNCWbU2Os/+bKp/MolgiyTccAyJ5j0UApdnb4Nl2RFFsKCJDOItoJKYnDcllJnLjKS115G3iPcwiSc83d0cEJE/7OiOdjt1FwIgBZXM0zwYCdGv88QTyAfuy2k5cQjm99U22bHt1b89E/xQhYSx4xvnFLb7kKfB2BjPgxYSt95rLQslEPgi3gDNjqWdrYWT0Wj29lZXaSfdTN7m6hFZQl3QurGzj8om7Ux/1/wGZpdweFxVTZvjtQKU9ixlrKFfcODTVPV8AbQdq5ExeH4MNPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=;
 b=i0MO9E1l71o2XEWLnTUrZNJwZZVRWgXNF8kgEQsJhOF9q6tsBmJcSQvvKPRG4daMq0Cs/PvMo+2DRY1PSE8zXSWSM0TgWFAXMRP0yGuOMAkfFc134TtEML3Nie8SjqKdReS/jmW4/tOsb0p3lmigZKLRMKg5ErQxZXMChH1PsR9JUKDPXSH/AqElhjYVU7jOWEhyXlinhA4Vo67+CLTDokXipMpM7YIJvTcWRG7TL6F0SwYSkmmnlMCWE8MWieAo0HSPfyGKkdtdKNrfUgeeFyWyfhFlx8YQeXo/qjdzA4+j5M316KI8WBLYVQgp5YzRFlP3s34SrcHIxSNOpnwj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mft1beeUgxyhGe5RsfPenP8bL9FnjpzcG9pzUHYDAxk=;
 b=OkocDHQ/AiNBR7oQ68CbVZRAVwDgR5drEEvxDEPXEJ2xa67JzKg91yihgZttC3a66sXXQJZgrsZ2cWQaYkWPQHUQO6aadOSGUkip5DmclpWTlYpRTwPM1lmbgfQkG0fn+fCVolkWR0mH0W2Ev6hKYfIGhmAdxJJKh5soEK/vK/Y=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4968.namprd10.prod.outlook.com (2603:10b6:408:12c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 15:09:49 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 15:09:48 +0000
Date: Thu, 26 Jun 2025 11:09:47 -0400
To: dtrace@lists.linux.dev
From: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [RELEASE] DTrace 2.0.3
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672820F3ECDA67CB81E6AAAC27AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b08f582-5d06-427b-58e8-08ddb4c37e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHNQJOGqaEHyVFLe/WXT4V/qxSLNH262XKLWFIIgaRb0pNRjsQUSwQqIaPYI?=
 =?us-ascii?Q?9X8oBG/d1ysjlaVD+5ibXCgLZS+YFawVjyjYbIrLv3MN1KL8dyEz8L7CJBr6?=
 =?us-ascii?Q?WG0igcs5A+eUlqpExqRGP3YhaX5kLsaAvLD1H6rSZJAFG/NPqX2Dz5AA6SEE?=
 =?us-ascii?Q?YQwLSWNE3r7/LRuvJgkEobJFq4HBIHGalVqrcyJMpXFxB9Pyq+0tkNgRSVPI?=
 =?us-ascii?Q?AW03E7BTzRv6TbqJ+om2G0fGguu/m8DI0ZY3T4FbAgqtEvkddASlz+0ImdEQ?=
 =?us-ascii?Q?UbTAkcirK4cxUCLDtRHZP13C74XKofG4r3Ay4LSnBK0+5gdfMWucB0RA/XOq?=
 =?us-ascii?Q?CEMD4tBtcVo8OpCULkGPzidt3Ly6ka9wsyjnP9ZjUgR44RJc+1lelZmYrEaY?=
 =?us-ascii?Q?AcqqL5tgI5W5q6qOaLpapYqlCS306TFLmcdjHrGATTbGnaKKw/qHy5a/RBeB?=
 =?us-ascii?Q?HKua24LXux4MSE/I+X2KpTUg+Q5rOT+STJwPt4Rsp01HGRmP/Qt9XQGHHPGj?=
 =?us-ascii?Q?4yg6s9bU71IW80ALP4VtPPe8c0Es5sh0w/ZGwvDYnK+ZzeO74S49l0QK24GT?=
 =?us-ascii?Q?H/jURzNmb3jVMTdU87kTMkoTi5rpilGHcx49FSgJqVC98SVbBnPbkLNcS5oS?=
 =?us-ascii?Q?JQDjuwZI3q6eEaowCtF0kUVG/rytUgsPztzxbJtVitP7/hQ6sb0XFqqoLeML?=
 =?us-ascii?Q?IWKIPomfMKCOy4D2w3NhYaUpjpcc3pEN3uXSvjAdORGFnbJNf1j2Y2mhf1qg?=
 =?us-ascii?Q?eALziTOiTLPRuGf3ixysWzFXXKtNO9KEBCVxuFKUBIC4g2w8OTcIbhtEb/m/?=
 =?us-ascii?Q?svXY4wtGYxRyMRIpmLDwX09nZCkeqT6hYvXCYQlbzGUMNkjc9FmUeUh+5a6K?=
 =?us-ascii?Q?s3S/YWZ7LuONh4kE8R1226ZQsMGvT3uODOzAJFblGe/Nici/8rSEbKw9WL5D?=
 =?us-ascii?Q?bPnUE/bFaS6/32rG2Ove/aqe/i/R+Yz/q6CazOxyVsVy2t2OHvMydlm6Jt/2?=
 =?us-ascii?Q?QJQcmZPxqWx3oh/fNDHO1xsfs4CciURZG8JhdzqDldYQuFx9v9eHFnCCG7jH?=
 =?us-ascii?Q?+RAUgERb9Mlm1f7fgIJvBeJI5HE9K2WWZ2VPkRKR/yZho4WIBdn53YhrXepc?=
 =?us-ascii?Q?QY6rX/DS9IxMkSaazyqWZP5ICl3DnAVPQzrTpzNS+rNwtishWRY2JiHm02II?=
 =?us-ascii?Q?ykB67mb4aqr8W2kBuV3IdhuxC1TXCcZRDYLfTIEHp+6m4HYiSCJNhQ8iKWYB?=
 =?us-ascii?Q?eNRDvqTOb5OmNGOlnsfilgLmxmmA0cJtoyCYdscjXzPv2QL59QHXCyXx6KBH?=
 =?us-ascii?Q?Pie9zDD7TpNOS/Rv+iuEdhD5jweVBsA624cUF5va+YkVYzgUzXrAKPGRRoOU?=
 =?us-ascii?Q?h0AGKH+3/gZojRP/VTG3ymI/W7H4FmNWHnh0/Unc2IIFALOzaPTJ3dwRS73r?=
 =?us-ascii?Q?PDA/t31VvL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DduHtmgSIbm+cCvSUzD5qKq8pmWoI5GyYCDwDmkxGuXt96GRES4ErymUN5Xh?=
 =?us-ascii?Q?+IalufkIeHAK/H7gVWB5yltYKZ3LElw51lsMFRZUC7z7wjcBADvFa4gpa2DB?=
 =?us-ascii?Q?TX78L1Kaq8pZhDnG1THwA1uQXRqYa0IAhzsxavu/SOfdb8H1menRUti5rlUi?=
 =?us-ascii?Q?Sx9YaqJiEqTl6lFWOgxYV9hDfFtbRKGdXevGW/YpoEnypurFZjCoBXML6o07?=
 =?us-ascii?Q?ZOmmKdrGIdhEMAVkyPg0+KMRmINtG0a1Dqamn2AHbdlFOUSgec65DKLnnv0m?=
 =?us-ascii?Q?LG3bWG3Gb80m/zc01TdC0xLzv3SQhWegloB813BjPXEnFr9B7MdRuxJZDv5j?=
 =?us-ascii?Q?bP85XFHEfEDxBY7Gu5Tsdd1ZzpwtJZ3GGZg2Yr+Zl1l4eVllpfJpkSb0XRn9?=
 =?us-ascii?Q?STBy+Ue1xolfDCQw/qAl6EdcyufSeykVkTJ1ykgoIuLc1ieHgFfw5L/OvG4k?=
 =?us-ascii?Q?ozoMLWUbsmDiRqfJTH0E8gsh267XhyivKQTmKAyHP3FCXL+nVOJvIjniSbeb?=
 =?us-ascii?Q?HWkyf/OPFPIQNs2ns4Qxi/r4e0KeWOLwBiQYaRyDQLfs/UIAKIFrtH4jNO9I?=
 =?us-ascii?Q?+cdP3qI4ZQ+QBnsTuCIWhArNHCdNPZ+QfcrHXWEUh0PMIXcm4IkbPAMX3Rso?=
 =?us-ascii?Q?gc70Zt5xtXHr1Nf+wynPdG6ZtisvA/xIRbLUUKBRfr6SRsgU3xnR5pYk/vgi?=
 =?us-ascii?Q?CdK1nE5xmoDMU4X+Tn99ajN64hpAC1r+BLzMfeinfOUxKmp3jndrdGXa807S?=
 =?us-ascii?Q?rGNxG6K87pmI8Zziy9L40WSQr3LRMkB4NTNsur/3HVXBkMeXwgZACf8deUWM?=
 =?us-ascii?Q?9YlngkibLuil+TqhANBXq1HimsmKeudpg4UH6fDa5zItc+zd8fLioSyNKIgs?=
 =?us-ascii?Q?2kEyQNDyLkQo6QM/ldJSSjq0zcOic3RCwjYtQvd/k5zRqKrAdoQb5Prd1UA3?=
 =?us-ascii?Q?25YMOUoZSzoi0mQNo/xBp7sapdLCWXZjNEV0tCNyMumqfhKha74+0jL10i0A?=
 =?us-ascii?Q?zKy0ZvmaImlbDc7XAE2WD8LL7cUWD7tM6ogVrW+gvT/hIyRnES+Ed2awo6Sk?=
 =?us-ascii?Q?7UdzZQQ9dRBDIeBad8osKwtYtx9EVWNU7zO2R958+6kSt/xBd5cyQL82PvZS?=
 =?us-ascii?Q?Fnj6KFhnDVQPgY5eIrgbBWIPVTBMWO/Uz/c62ibqOtkdvile16wYpEUNCo84?=
 =?us-ascii?Q?Tnj8ISsmpuV49A9WTzbY1oDxxI5fS33WnC88mO8VTOV6TMrrU8/kI45/rDJP?=
 =?us-ascii?Q?+goFlRi+TN60lipLwJGt3N0776js/70tZU0HyO5m3FTZul2slQBTocROxpcl?=
 =?us-ascii?Q?d3+48yXM1sfRMxIkcMrkGxIz7x87pSw74T/MQIExAj7NVXL3l8no8Vn69l/6?=
 =?us-ascii?Q?0/BY6gZvuCeQpdilFX174Q2tU1/BVy4XEQijNEK84U/HxZcF+kh0OdEsQnD3?=
 =?us-ascii?Q?xTIwKShqufJVlG+dQGPt1Nqyl9puo3Hcq98qDjF0zkDiYGM0M/NhWFgUbIGF?=
 =?us-ascii?Q?cL+cnOdekMKYQ/ON5dsAJjwGO28KNYXqQ6xSU5/JNJA8JkB5nTRa1SG25oyM?=
 =?us-ascii?Q?D0GLPASdmo9wFaphRHj15CH7l9Z+t0uVfRw6PU9MNMQnNUx9uXb5Djusoeab?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5mJ0EvkFu9K4ioPiql7lR/KUfZMrqPnMVt1+IkAebf3HUnxU3AORoPGplb5LkQHiC8tslp3LIIWkhmASihhxLdexwnQPSSmiFLqhOu1vRPZwW3Pj4JdAjJhTv/knNe36D8LtgXDt6LBgsUMEzPV3du97zEleoX+Vc8g6DYij0ls/O39gbUbTBrZ4mmdxzu0e33gFcCPNMH1wh7LALAYH1OksTlWpAPcSmGcsDPhVZj9/pfoz9lj1wVI7BBpwOJvsZgRHHRoGGsXbrbkhqYVCEuyCuIomtB7lX3bko6oqIrQuDdWEdv2o4dyl4qtW1QlsZvG146A+x7gQ5kkqEOKHgYcNpFjJBZqLd42Iix5tV5bD4GiHxGR18FLUCTvgzjLlMQn6/yMeNlDQj6KSGW6sUs0/2bYh59gHHrlqqFO9YgA7HaqQ03UET60BbTIw9NHRCJeMiNq7LqvdX8OuZeXcd0d2fQxfndnNWNblkrS2kswkr0ULdW0SPEpt0DM1yRLd/Rntn3bBEChDBnb2bQl1tBD3DDv2AvLC65yTsgCsqE+SwxkpUCTw9xYkShKNej/fm5tqqLRRSQIW9AqtOg/T8aGbbAprLDqXMHPXmgVWLPk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b08f582-5d06-427b-58e8-08ddb4c37e66
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 15:09:48.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJokRaRpoTA/H5ZfN56SFIKHfy7n6JtIvrcFCM7rJRE/2+f/6bTSV38/z/XcVscb8t8cmK45RrSkRZ9ihR7UL3BqHwZh4C4ZjqntMh2ul+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4968
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260128
X-Proofpoint-GUID: Ihmplqv8XwpaH3dgX28Iat4MQJarwUFC
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685d62c0 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=0yZI2SAtThSntCeVz88A:9 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: Ihmplqv8XwpaH3dgX28Iat4MQJarwUFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyOCBTYWx0ZWRfX03SBDGQgYnEv CMpBXpH2CmIFmFBbtDxVPPIv6f9fHB1aPxnSvszuh6slUlRlx7bml4sZByFUDsEeBxyh8wQa3pl 3l3yeDfTdtKPgByjfs4cIE6L5H+oG61RW4kJ2jz9ZwNULRs4nK3pOcj8pdNEdrCDVjMCK7YvENC
 nnjE5jiw6YnpW2mUTMZQ09Krr5aJ+TokfwuiSfrOe2vxPAv9hVIqHeFT0Ssz02DT9ZMI7j9NdZx PQ9VITQekG+EyjfqXvH49Tu1ENE4P52BzejmAsXyQUOtLbzi71/VEqYJuTk64hxJ2A2qeoRbNjo wnxkDrY9XGgsvEdufI8Ko2vBblnl2XCy4rPw8ovgMbhw+eR36h7MjNiLC76UnwZomCzB1HxFnn1
 QBvht/N+TyjUQeBQA72uoOJKVxQXAJT1hefvAd0o9HXZYMANv8VZIUurA1cz/se3Lz1iS//p

We are happy to announce the availability of DTrace for Linux 2.0.3!

This new version is based on BPF and other Linux kernel tracing features and
is implemented entirely as a userspace application.  It can be used for tracing
on any Linux kernel that provides BPF based tracing and BTF type data, although
(as mentioned below) improved functionality depends on two (optional) kernel
patches.

The functionality is close to being feature-complete in comparison with the
kernel module based version of DTrace for Linux (version 1.2.1-1). Development
continues in an incremental fashion to make the full feature set of DTrace
available using existing kernel features.

WHERE TO FIND IT?

The new version of DTrace for Linux is available at:

    https://github.com/oracle/dtrace-utils/tree/2.0-branch-dev

The main development branch for DTrace for Linux is at:

    https://github.com/oracle/dtrace-utils/tree/devel

The most recent release tag is 2.0.3.

FEATURES

  - Providers:
      + cpc: CPU Performacne Counter probes
      + dtrace: BEGIN, END, and ERROR probes
      + fbt: Function Boundary Tracing (FBT) probes
             (Using fentry/fexit probes where available)
      + lockstat: Locking realted probes
      + pid: Userspace function boundary tracing and offset-based instruction
             probes
      + proc: Process lifecycle related probes
      + profile: Timer-based profile-* and tick-* probes
      + rawfbt: Function BOundary Tracing style provider that always
                uses kprobes - it can be used to trace <func>.<suffix> symbols
                that are generated by compiler optimizations
      + rawtp: SDT-style probes for kernel tracepoints with access to raw
               (untranslated) tracepoint arguments
      + sched: CPU scheduling probes [partial implementation]
      + sdt: Statically Defined Tracing (SDT) probes for kernel tracepoints
      + sycall: System call entry and exit probes
      + usdt: Userspace Statically Defined Tracing (USDT) probes

      + [NEW] usdt: probes definitions are now stored in ELF note data, to
              ensure compilation with LTO retains this data
      + [NEW] Command line arguments to the current task can now be accessed
              using the psinfo->pr_psargs translator member.
      + [NEW] Dynamic kprobe/fprobe selection for FBT has been corrected.
      + [NEW] pid: Support for absolute offset probes (using "-" as function
              name).
      + [NEW] fbt/rawfbt: Significant performance improvements to reduce the
              dtrace startup time during probe discovery.

  - Aggregations:
      + Regular and indexed aggregations
      + Aggregation functions: avg, count, llquantize, lquantize, max, min,
                               quantize, stddev, and sum.
      + Aggregation actions: clear, normalize, normalize, printa

  - Speculative tracing:
      + Functions: speculation, speculate, commit, and discard

  - Variables:
      + Global variables
      + Thread-Local Storage (TLS) variables
      + Clause-local variables
      + Associative arrays for global and TLS variables
      + Full support for NULL-strings
      + Built-in: arg0 - arg9, args[], caller, curcpu, curthread, epid, errno,
        execname, gid, id, pid, ppid, probefunc, probemod, probename,
        probeprov, stackdepth, tid, timestamp, ucaller, uid, uregs[],
        ustackdepth, walltimestamp

  - Actions:
      + exit, freopen, ftruncate, mod, print, printa, printf, raise, setopt,
        stack, sym, system, trace, tracemem, uaddr, umod, ustack, usym

  - Subroutines:
      + alloca, basename, bcopy, cleanpath, copyin, copyinstr, copyinto,
        copyout, copyoutstr, dirname, d_path [dummy], getmajor, getminor,
        htonl, htonll, htons, index, inet_ntoa, link_ntop, lltostr,
        mutex_owned, mutex_owner, mutex_type_adaptive, mutex_type_spin, ntohl,
        ntohll, ntohs, progenyof, rand, rindex, rw_iswriter, rw_read_held,
        rw_write_held, strchr, strjoin, strlen, strrchr, strstr, strtok, substr

  - Runtime features:
      + Reporting of drop-counters for trace data that could not be recorded
        for the principal buffer, aggregation buffers, and speculation buffers.
      + Pre-generated translator files to support kernels from 5.2 to current.

  - BPF support:
      + Direct compilation of D source code into BPF programs.
      + Efficient use of pre-compiled BPF functions for library functions.
      + A bpflog option to request the BPF verifier log for loaded programs.
      + BPF program linking of dynamically generated code and pre-compiled
        code to facilitate code sharing and code re-use.
      + Improved integrated disassembler for generated BPF code at the clause
        and program level (-S in combination with the new -xdisasm=# option).
      + Improved trace data buffer handling based on memory mapped perf event
        ring-buffers.
      + BTF type data support.

      + [NEW] Precompiled BPF code is more granular to reduce BPF program size
              in generated tracing programs.

  - Development and debugging:
      + Support to run dtrace under valgrind.
      + Configure script based building is supported.
      + Improved support for building and using DTrace on upstream kernels.
      + Installation paths for all components are configurable.
      + Header files for USDT (sdt.h, etc) have been moved to avoid conflicts
        with projects that supply files with the same name.

DEPENDENCIES

DTrace for Linux depends on libctf (part of newer binutils) -or-
libdtrace-ctf. While libctf is preferred, building against libdtrace-ctf is
still possible. It can be found at:

    https://github.com/oracle/libdtrace-ctf

DTrace for Linux makes use of BPF library functions that are compiled at 
build time. It depends on BPF support in GCC and binutils to generate the
pre-compiled BPF function library.

DTrace for Linux benefits from 2 optional kernel features that are not commonly
available in Linux kernels:

  - CTF data generation at compile time: this provides important datatype
    information for kernel and kernel module symbols.

  - Module symbol address range data: this adds address range data about any
    built-in modules to allow for consistent ways to refer to probes by module
    and function (or probe) name.

DTrace for Linux can be used for tracing without these patches, albeit with
some limitations.

These additional support features for tracing are available at:

    https://github.com/oracle/dtrace-linux-kernel/tree/v2/6.7

Please consider joining our development list: dtrace at lists.linux.dev
and/or our IRC channel: #linux-dtrace at libera.chat

    Enjoy!

