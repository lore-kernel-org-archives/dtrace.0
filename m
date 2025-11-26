Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DB26A0DB
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 23:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201400; cv=fail; b=iykTb7m62UZflZq3/IJ20n15s8TqkRNNFZl4Ae/BJneAormRl075klsoxzwxXb52Dx4hxXpWTqXr3xL9IML+TFVqYrAKGZz9NPW6aiZd9E/vHhah3n8ujtCm/GJxdgrsRgVYVC58mMIXOY3Ieyz33s9vBle7Q1qJqzp2hxhQgnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201400; c=relaxed/simple;
	bh=AhChtIrwt6v3FkU+5pnzoh+damNTcfTZ5XQEGhJcVc8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=t1jmnENBitMfAWR8K7984bCV/3EURRZ3lPB67AWIofWNhvNqguBEdfpaotJM8/5jZ/j/HnAlulmQnhCM7d5HPe3FjjGHj+uNgF66AdiStU3usOgrRXmtCF+vN9cPqQcYZ1WYhi1cZB75vyLezxU/f84UUU/UFiu783VqFYEd57g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a/T1J+I7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aHE38M47; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a/T1J+I7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aHE38M47"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQNNUYs3923951
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 23:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ZLndagMOzl0n20d8CPUFPeYHH+0DImi9ThrP7rO68eE=; b=
	a/T1J+I7K1FeJXmSCLOKwA0DUHG73GdEBijf6hwziLGywgBSdVNPzYtKFu7x9GRc
	gAdWp93cRsSDFUYtJa+8qPtSogxCJLOuGUNmwuJ7VYimpgR6Gs8Di12jFmItc8Zb
	xuXIV810Ma0iAdeKcm4UQyG9qmrAswch1+pJkQBxuoCbc0kZXZu5tkd2Oqq+meFq
	ULSNGSvHsXwt4gPCYrXDGMp7NBSrTyRIf9ntFHRqoR7d5WRRGfYj0bfkS1z8dR2t
	SXutv1uzeItJ9LZ0vjoWCXfOAxp/mSSuNzX0+XKVSK6mVxEkID7xA1DI/hBgoXaR
	m9yZ0Qc/HP25vjrDcX2nJg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak7ycp6ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 23:56:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQLbwii029623
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 23:56:33 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ak3mf5hvu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 23:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvcTXqORbzsauap2Or3k9ZZKG4zxS/eJHD5z8xtDUWtdYCeuzQnye3M9quzfR63y4BOUkUJFaxofh76lttTl8nDkp4K8+VA4Qtq2LCOtRUYiMqZsD2sx/Emde/RU0XhBfBv95P8uDHXFQHSMTRj906tbLfNVzYynfZvi/B10dFRVJskku9tvOtOj+bNGNzMT+NeyNgf+scTWznSer5EYb8PUvfIrxe+aGTr/8n3f/O1tb5LE9WErFALy3R5MTQhq3PswQoOAkGUsjQd9sVxad/wHm+P6GH4ycNo/ZeiuZZ6+DsLeBn23W4llsgedA4CFyZMRzuMdVAtKNbSPX0IEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLndagMOzl0n20d8CPUFPeYHH+0DImi9ThrP7rO68eE=;
 b=PhQhRTavpJpNapMN+uMMQlJ5nABUB2go5XT5UrwSmLCPK0cOd3IIPnWXLAf1e7RsiaQQclXoOJL7JB29h+k3jdi5H5ZOYRXFBtUEBmDgmk+P2R7Jb9pHkYNNamk8TA8b1vKwT+CiOQIdGrS9IsBWxjJnI3umYT58R5sLmdazZY9DcV+1nsXF1uKEg02rSyVcB5A1/YqnowJiR5I+Q3JBwJ2mgbdHQxRPVV3D476/K1YKUMUuGs0zj10IZHF0+R0jKh3A1oCulOZ7nmVRYaYdFLn4xIfNw+pJgEccYcPOoxbl+oAqnO+un+cb1l/VxVXN3zRQ4WJIgGqtN49oFwAlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLndagMOzl0n20d8CPUFPeYHH+0DImi9ThrP7rO68eE=;
 b=aHE38M47YsuGZo4Lbn6iWG3UXWsTQpjMw/Urqa9jGQ7Oh2ds7LO3SBiIdOMTONViXkGiVYyD9QV8S0nCFMrg/1zPqB3BunZk67OCS4Bw/0XG2tvo2ULYCw1dkmyHuvDM/hk2KAJpJ9OnJSHU7sX0RM0xR3m2w0foQAAQl/Q5Suc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4418.namprd10.prod.outlook.com (2603:10b6:303:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 23:56:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 23:56:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] doc: Add include path for sys/usdt.h
Date: Wed, 26 Nov 2025 18:56:28 -0500
Message-Id: <20251126235628.3318-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:510:2da::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b86976-2190-49b4-e419-08de2d476b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6yRZ1wHpODI8U642gDYCTKkSdfAiG+FKos5xalXFvkAfwGdEAA0TM+w3Xlkm?=
 =?us-ascii?Q?vt2xHdqT3SNJPSGKAB2HCEIRzSVioZ5SNHqbcd+s1kOss4ihtrprLaH2RgrG?=
 =?us-ascii?Q?pVI93v37aN4+02bySTFCL/UUMCp9a3IRxIdDSs4r84zi/UPyWOpYyCkJt8j9?=
 =?us-ascii?Q?0JMkdSM6QgA+A/mOgKeobTcfHhRTi46gsrO2juCkCq8Wov/56TdMgA3r/y9T?=
 =?us-ascii?Q?kKeDIBTfmoCqklh8frerOobTXri6nDs4STODIcLykKM/0ebIr350kIRZjvYH?=
 =?us-ascii?Q?m1cx2WsiSaLU7FlQt7+c0oHGRa7ps+pzxF54XF5eU0ZSZ1bq6/0l+NRYAqie?=
 =?us-ascii?Q?QoIs/FAsm/+zowhTXx7gB5vng/qRi57PdcfjGvwOcQFlitkTHv7HhAI9zRny?=
 =?us-ascii?Q?sKFmKmolh7GfyI9d7RBrdTzUG9FAlPXZ/PfmikAQb8OlIcrZPEu1mB0VVQHH?=
 =?us-ascii?Q?Q2aDsWJlWtT7FMBizk6SrMJrSZIUIoncRnvb/FfpNFdSrZk5c+xAQ/MMCYZl?=
 =?us-ascii?Q?Q+oUZws//I/r7agkzjXBt7/DNFshEc4lk7TFGL3+URMBSY7deb16S1qp4TeH?=
 =?us-ascii?Q?dOmawi5bRu719j5m2NJGgJ7jIFaZPiXU04SYjKcGce5/F7Uh4sW1CeN4HBWU?=
 =?us-ascii?Q?OusbgPy2g8rASYEn7rWPiLq0H43aDpTPHoOSiui4K/WP40TS33BsiHjSU20w?=
 =?us-ascii?Q?tUSzfrCVKsW6nfOJb3NAL0SazB5wCUI06qPOrJ2nPp2WFgO6l7I4ps7wfbCU?=
 =?us-ascii?Q?rK3nAbYN9hsy7rnaNhnMauzS1ZyNfeg4y0tjEDD9H60fJ+7HPKy0b+zrK62I?=
 =?us-ascii?Q?WdPFD0F7JBVo32JMbLw/ze9opGVC7PU7AQUf7Ko2VxSd1n+raSsXMr/RSM2U?=
 =?us-ascii?Q?RiaPGr4rFAC9BnSox+EV79hzzvOTdtfXMXmAcPVMaJYOgytZyB8mRZ1pdyaq?=
 =?us-ascii?Q?ZaxCtMgQXOsxVIE1BHuXC2rvDp7CvjtUGk20zZnAtN277PDr0NwN59L/eG0P?=
 =?us-ascii?Q?luEdfV8kLeSt4yVhdS0nxm+/BQvfozvmytWaRdMWGSdnXkvKHCKGY8Plp9ED?=
 =?us-ascii?Q?+mj3yWK89ujMicn7DnwqzeS81CGB1b5NP7cyv7JY6kmOVwaD++A9kA+/3Vyd?=
 =?us-ascii?Q?HXBOX9kSqcv4m7Htt4fBMZQmcdfXYF5/4dCRyl5HE9eMLJk7skGNmVLGJUS7?=
 =?us-ascii?Q?cm7vpMaqFQ1jDPmbo/zVWd1JxqVWPKch9vypB0bRtcYNiROJheWmrYwFW/hx?=
 =?us-ascii?Q?/CsDDbDpsChiK008rsS656ozj5yfJJ2Rs7/JwcnSWLunwONzi+AtevsWZrDV?=
 =?us-ascii?Q?pVaan9X5Smgifp4hk8VDBVGS53CsARhVAIVwQgC4hPehGrIjV+lOUeP8mv23?=
 =?us-ascii?Q?zEIINqGK8WOZ64yPRzQVR4fd+D2c5NSfRbUqJwNXUwcTwGppSamd4FWh1EXh?=
 =?us-ascii?Q?1KjxrRvxSVu37f+aq1H3QjKwBAX/4vK6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FTa4yStrDmFbFFWsmZgTKM5H3Ak6N0N2dAFSsu44tuZxS8/Zhdoz/vw+XmNb?=
 =?us-ascii?Q?+lBiDFt/QkJ9cx1aaTgVXYLackFbXRcWsRgGpVB1YF5xcDngIeEGBwY/XTjf?=
 =?us-ascii?Q?o4xc7T3lhvNdbPytK0kDhz2B7dy+n/eKUXo4U4tiQuUB6SgqhlI1KXYdj7Dz?=
 =?us-ascii?Q?zw0A5mk94md9ez2KEy4t0V7A+PFtD3/O3/5Jyl5WZghMvVmY7jth9+m9T4Zn?=
 =?us-ascii?Q?TGssmu440IF+PbxyJ4/+eAq6uiVpJKkHJI2BviYIqyeXxLywbt0c4bbvZEsK?=
 =?us-ascii?Q?cI8LDGXfV9zKVBLLRfWk9k2orcw7XZdNm/JgBzM6Y/rhZokpNILHivBpAXGA?=
 =?us-ascii?Q?Thn4D7uzqPShyGP6qSGYPxrxJ5gmIViCZ5A6MXaSYvfdZ3IA+n6k3wKvDseB?=
 =?us-ascii?Q?hjQGHL1GxlauDNywBtKjKFEnxoLQ5l1S8icwuHyMqlDJlT4guW2gVwApL5Zl?=
 =?us-ascii?Q?0RcnmL3p+TVV2Ei+fVlE+ZPDYdL7NrkVEqmSPwg0hE+YfHmsCzRFlOsLjCfG?=
 =?us-ascii?Q?iaTXFIwqWw9l/rgRw4MgKm4F6qKuhiDmuKysUicD4c5YP5f2023n7rIiFm24?=
 =?us-ascii?Q?GM2DmB5/mZ6InMrwJjlAxJDRo56THDQMdZHOJnx7wKWUySqBiOhUHMzGaBCv?=
 =?us-ascii?Q?uIXBCyRfj9GnhoDjMRMYiD44z5AUtK03PjcN0wbFAy9A6cYwlVEI9pnc8CVs?=
 =?us-ascii?Q?xGD2+3dacjWvu06AKXLWk20P61MktixVFYZZdiFPG2vvHfVpSE1LD6m+8Ba8?=
 =?us-ascii?Q?WRPiGg/lOREHiIYVigEbo+m6ofP03euJTp8IJpoDOp5U0BtHhAoOqJYcUh2G?=
 =?us-ascii?Q?N7fLyst/BCGJ96ZSVLMhkFUe3GRajD0zi51mpUXPjprLkACTlyo+owtAj2Xe?=
 =?us-ascii?Q?tawvs4BkD4JDDbAyJCtBRxdDoqh/31103U6EsLDN6wgXURcu1HuDmXGK51aq?=
 =?us-ascii?Q?Kw5MGe8hJcvPMWfsxlw09sQzxTF4ivZ/1A3GdFIHEsq4uoAtH9X8W19JJh+d?=
 =?us-ascii?Q?wolvOfktX9BEbya55XMuYSdDorGhlOftxzP2D6dCOgKHXC8TyWsxm1LT1MrI?=
 =?us-ascii?Q?5SpC1Y/62HyaSnunLX2MvrdE5a4NKUaejrWhAFJS9gyFKdWF3xZAdzsOjZ2U?=
 =?us-ascii?Q?0Wa7HWGymvshRBmR96wZWNisILJXPhpyooPh7aFyN2fE3mOg5DVRk4pvnqU2?=
 =?us-ascii?Q?yAHoFzXczzaicsmYTvKm+lR//QUUJiGqMDwcngln8TLt2fNTMOKZzPn39gyl?=
 =?us-ascii?Q?DFUz5hNXEwRHl0MOYW8FFpqElohtEv8Gl67Aktn+uQ8VTOgC01Hg6478piFW?=
 =?us-ascii?Q?U0G5vZ3DVW9oFKYkBJzty2akd5FfZTZ1O5udOth9qt6kcraCFjRnBCJX7rm7?=
 =?us-ascii?Q?niCCg00HVCCTstgt5hXxbmbuzx7vicF11HA2o6U+GawlLW0Nj2cG/JP1eURY?=
 =?us-ascii?Q?nhceiY9/6uVYuYvGmVg8Vt5wQxD/dDuBrJiYk+UPohJhC/Jr2zgarV51pzsK?=
 =?us-ascii?Q?NEP5LFrNZRj0skiVuM/rrCcGlFVc6uacn8HuJZpXcyEuyeHegm0N3YLUz1AX?=
 =?us-ascii?Q?MmAjVo78MOHFu0+MzkPd3LKKlgdZj57AZPnfm0gl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4jbmDrIl2bbJPjVL8n7GGnKX8vhJC1TDsXJuPwvdRxQMS4oo6Nrzl7ssE9cFZOe8eXlE7wYqoN27KfU/SSH10ENdgGFStF8TXqqxcndXyRp4pxH91JwSyFmbJn4itpXUbpUCJRN7mX0Kj23x0q1WWzAxbnHM2uwYwhkT+xSgfkL+2XCPjbTLk73toIWjnqHkTRmb8MHYoZUr4Wh71df1rDtw6uO0QswsbheVHk05epYWJ74bnCH6R7knqZIXU86tKeijt1lJT/45iAXYwoeVa+mAUOEzLL24V79Usl+5y8go/2BddvOSzKo4UNbm3GJceMVhop1oFzraHhM3MgEZUn6vdBFl8wC4vbdIsAXNyv8vdvPxu8eE0wS4ypeSqO90A2skg2I0h9cCFIhJBEJR9o99T8UuBpenWQCJx5ZaTztf0YyAqf4SuFo4P4/KiluJ6QosZlQZyItaihI+igL1OTSxV3aEHeJ+rYAfKvNEc8+4xVbcgkoW7K3JRrqkiNGXf5UIeZy1x2uIJIrjlq29tmRqS+3ChBH++l+n6k3p7NlJ2XnHciYzJy/N4amJgZfUYzqySPA71YRvWtoy5je7+KqgE+6Qc8R/Su6hBN2ujGY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b86976-2190-49b4-e419-08de2d476b93
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 23:56:30.7472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69EbPz2s6vDMtTcjqq/w/v3T8VGDgqQbI0++59y0KW1XMLyK6b9mGPRhHQ5LMz8iPYXAhcSKLf0vFj3E99xaIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4418
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511260192
X-Proofpoint-GUID: tgw8WoZa5H8fzUrdB8ctcwmjHEFgpMn2
X-Proofpoint-ORIG-GUID: tgw8WoZa5H8fzUrdB8ctcwmjHEFgpMn2
X-Authority-Analysis: v=2.4 cv=RofI7SmK c=1 sm=1 tr=0 ts=692793b3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=CQg1fIkjT8O_dvwQHnsA:9 cc=ntf awl=host:12099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE5MiBTYWx0ZWRfX0Muapt3voicG
 1Wft0iVfTFRJSMgPQ7WuIQwmnZqPl+45wXImOPFDBdB1kBRm/JNZDmhUpgT8FhPbOdfOapWt1ox
 KT6mo5mu96MEWeODO2Qdrl0dpHE/H7J2XXeg8h79vBMHzNw4cL6oiztt/Oy5YZmTGm2auhH9N6w
 +t1bPSsrfa+9caEtb0kyc9WZ7VO70ywWrlL9xPcNWF4e4ySXxdditk/GdqGikod4G6+MW4o1n/H
 +N2yqQMkBSwxhX/bbtTgFAS/7Z2QtJ5v7Dws3SLi8EXNWf4yOp2ZFE5Hb6qwJjQGpdO9WF7nKky
 sPKOBTeaLBJb6pqxF+ht5TypNAmdXwf7SfjeSKM1aAR730IcNkdm9KNsymwvruAbh9x8ourSUBF
 nOhrb+dD5zNsKJMegV0KqTZoVeG58VEOjBVUsgEz6i703Bd6cpw=

From: Eugene Loh <eugene.loh@oracle.com>

When dtrace constructs a USDT header, it includes the header sys/usdt.h.

Add a note to our documentation that /usr/lib64/dtrace/include needs to
be on the include path for this header to be found.

While we are at it, break long lines of text up for better readability
of the Markdown file and simpler diffs in the future.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 ...ticallyDefinedTracingofUserApplications.md | 115 ++++++++++++++----
 1 file changed, 89 insertions(+), 26 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
index e8298dea8..1ad4f6410 100644
--- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
+++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
@@ -1,17 +1,26 @@
 
 # USDT Provider <a id="dt_ref_usdt_prov">
 
-Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
+Use the USDT provider, for user space statically defined tracing,
+to instrument user space code with probes that are meaningful for an application.
 
-For example, if an application has `put` and `get` operations, you can insert `put` and `get` instrumentation points in the source code, even if each operation is implemented on several code paths. A DTrace user could then enable such probes to trace activity, even without knowing how those operations are implemented in the source code. As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled. USDT probes can also appear in shared libraries.
+For example, if an application has `put` and `get` operations,
+you can insert `put` and `get` instrumentation points in the source code,
+even if each operation is implemented on several code paths.
+A DTrace user could then enable such probes to trace activity,
+even without knowing how those operations are implemented in the source code.
+As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled.
+USDT probes can also appear in shared libraries.
 
-USDT is for user space processes. For kernel modules, statically defined tracing is handled by the related SDT mechanism.
+USDT is for user space processes.
+For kernel modules, statically defined tracing is handled by the related SDT mechanism.
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
 ## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
 
-Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
+Define USDT providers and probes in a `.d` file that you add to the source code.
+For example, a file `myproviders.d` contains:
 
 ```
 provider myprov
@@ -21,17 +30,28 @@ provider myprov
 };
 ```
 
-In this example, the provider name is `myprov`, but, as with the `pid` provider, DTrace users must append the process ID \(pid\) of the process or processes that interest them. In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids. For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`. In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented, even processes that haven't yet started. Or, as with the `pid` provider, you can use a symbolic pid, such as `myprov$target` for the process started with the `-c` option.
+In this example, the provider name is `myprov`, but, as with the `pid` provider,
+DTrace users must append the process ID \(pid\) of the process or processes that interest them.
+In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids.
+For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`.
+In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented,
+even processes that haven't yet started.
+Or, as with the `pid` provider, you can use a symbolic pid,
+such as `myprov$target` for the process started with the `-c` option.
 
-The provider definition lists its probes, along with any probe arguments. The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
+The provider definition lists its probes, along with any probe arguments.
+The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
 
-This following example runs command `./a.out`, then traces the USDT probe `my-put` on that one process, displaying the two arguments to that probe.
+This following example runs command `./a.out`,
+then traces the USDT probe `my-put` on that one process,
+displaying the two arguments to that probe.
 
 ```
 sudo dtrace -c ./a.out -n 'myprov$target:::my-put { printf("put %d %d\n", arg0, arg1); }'
 ```
 
-The following example traces all processes with `myprov` probes, even if they haven't yet started. This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
+The following example traces all processes with `myprov` probes, even if they haven't yet started.
+This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
 
 ```
 sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
@@ -60,15 +80,27 @@ void foo(void)
 }
 ```
 
-This example includes a header file that's automatically generated. The name of this header file is derived from the file name that defines the macros to access the probes. It defines macros that provide access to the USDT probes.
+This example includes a header file that's automatically generated.
+The name of this header file is derived from the file name that defines the macros to access the probes.
+It defines macros that provide access to the USDT probes.
 
-You can place probes in the code, referring to the probes by using the macros, which concatenate provider, and probe names, and converting to uppercase. In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
+You can place probes in the code, referring to the probes by using the macros,
+which concatenate provider, and probe names, and converting to uppercase.
+In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
 
-An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
+An optional optimization is to test if a probe is enabled.
+While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions,
+setting up probe arguments can be expensive.
+In this example, `bar(1111)` and `bar(2222)`might be costly function calls.
+Therefore, for each probe, DTrace also supplies an `is-enabled` macro,
+named by appending `_ENABLED`.
+In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe,
+to help minimize the cost of any work associated with disabled probes.
 
 ## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
 
-The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
+The `dtrace` command becomes part of the build procedure,
+which can be thought of in four parts:
 
 1.  Generate the header file that defines the macros to access the probes. For example:
 
@@ -76,25 +108,44 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
     dtrace -h -s myproviders.d
     ```
 
-    The previous command produces the `myproviders.h` header file. While `dtrace` requires root privileges for runtime tracing, generating the header file doesn't have this requirement.
+    The previous command produces the `myproviders.h` header file.
+    While `dtrace` requires root privileges for runtime tracing,
+    generating the header file doesn't have this requirement.
 
-2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions. For example, for several source files:
+2.  Compile your source code.
+
+    For example, if you have multiple source files:
+
+    ```
+    gcc -I/usr/lib64/dtrace/include -c func1.c
+    gcc -I/usr/lib64/dtrace/include -c func2.c
+    gcc -I/usr/lib64/dtrace/include -c func3.c
+    ```
+
+    The `-I` option is to find `<sys/usdt.h>`, which is
+    referenced by the header file generated by `dtrace` in the
+    previous step.  The path to use on your system is given by:
 
     ```
-    gcc -c func1.c
-    gcc -c func2.c
-    gcc -c func3.c
+    pkg-config --cflags dtrace_sdt
     ```
 
+    Note that `<sys/usdt.h>` is also in the DTrace source code
+    directory `uts/common/`.
+
 3.  Post process each object file using `dtrace`. For example:
 
     ```
     dtrace -G -s myproviders.d func1.o func2.o func3.o
     ```
 
-    Again, `dtrace` doesn't require root privileges for this step. This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files, linking provider and probe definitions with a user application.
+    Again, `dtrace` doesn't require root privileges for this step.
+    This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files,
+    linking provider and probe definitions with a user application.
 
-4.  Link the final executable. The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime, for example, when you use the D function `ustack()`. For example:
+4.  Link the final executable.
+The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime,
+for example, when you use the D function `ustack()`. For example:
 
     ```
     gcc -Wl,--export-dynamic,--strip-all myproviders.o func1.o func2.o func3.o
@@ -152,7 +203,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
 
     ```
     dtrace -h -s myproviders.d
-    gcc -c func.c
+    gcc -I/usr/lib64/dtrace/include -c func.c
     dtrace -G -s myproviders.d func.o
     gcc -Wl,--export-dynamic,--strip-all myproviders.o func.o
     ```
@@ -168,7 +219,12 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
             tick-5sec {exit(0)}'
         ```
 
-        This first example, runs the `a.out` command with the `-c` option. The `-q` quiet option suppresses extraneous output. The D script is on the command line, and it prints both args for the `put` probe and reports the `get` probe. The example refers symbolically to `$target`, the pid of the target command is specified with `-c`.
+        This first example, runs the `a.out` command with the `-c` option.
+        The `-q` quiet option suppresses extraneous output.
+        The D script is on the command line,
+        and it prints both args for the `put` probe and reports the `get` probe.
+        The example refers symbolically to `$target`,
+        the pid of the target command is specified with `-c`.
 
         After five seconds, the `dtrace` job finishes, ending the target command.
 
@@ -184,7 +240,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         kill $pid
         ```
 
-        In this example, the command is already running with process ID `$pid`. We refer to the specific numerical pid that interests us. The `dtrace` command doesn't, in this case, end the process of interest. We handle that separately.
+        In this example, the command is already running with process ID `$pid`.
+        We refer to the specific numerical pid that interests us.
+        The `dtrace` command doesn't, in this case, end the process of interest.
+        We handle that separately.
 
     -   One more possibility is to run the program using:
 
@@ -196,7 +255,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         ./a.out &
         ```
 
-        In this example, the `-Z` option allows for zero probe matches at first. The probes match later, when a USDT process has started. After a short delay, a USDT process is started. At some point, the USDT process is ended.
+        In this example, the `-Z` option allows for zero probe matches at first.
+        The probes match later, when a USDT process has started.
+        After a short delay, a USDT process is started.
+        At some point, the USDT process is ended.
 
     In each of these cases, the output is printed after one second, and looks similar to:
 
@@ -217,10 +279,11 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
         tick-5sec {exit(0)}'
     ```
 
-    In this case, not only does the `put` probe not fire, but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false. Therefore, the `bar()` function isn't called. The only output displayed each second is:
+    In this case, not only does the `put` probe not fire,
+    but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false.
+    Therefore, the `bar()` function isn't called.
+    The only output displayed each second is:
 
     ```
     get
     ```
-
-
-- 
2.47.3

