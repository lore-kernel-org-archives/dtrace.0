Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B31DD384
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109045; cv=fail; b=mYI5ILOtm6xTG1W4SHbuRLKU1SxRLPM8fjbK2SWO1MSGLeJvDfVbImhzshLfYoLzc/k3YbuYnjKzgpHahDdjJBeQ9iHDpI3AeGjRI9UTJ5l+0J+N1J5bsfKAv2qG10A3WDQoVyB7gtV48NuZCe08oyRnH2u2xFGPkpYkFJN+c7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109045; c=relaxed/simple;
	bh=TSjFUYYF3L0pcnqQqE67S3fAYGTyntk1rd3rCoqUtb4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=tRYsv5eahryCtz1VPFz3irrpm3eqRMwUH/hOdDmRMrPgBCz59B9AKqkTy/8UfjWGRgdcs7QkhFv8klWFp9oNrc2qXYHUMmKqYCk0NhKn4l5+uAt77j+BLriY33HZ6uszCrGQXeHqISBRpTxySlDtsn0+YnCNfp8f4Q35Psa9taE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ScBJwmR5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LMxtXIHl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ScBJwmR5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LMxtXIHl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKTHe008458
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=7O/L0KZ5XFEAlb2h30VzIyQqIbt5i4dj3SDkUtKqkHk=; b=
	ScBJwmR5ZwR/Bju1nHuMEQgPbV9RGxsqJeOKe4VAZec5uZNqbof+Z5R6VJ2RJlYO
	sgDmaEqn6Ofdz6gYx61PaVTn1+3TRlGRRLu5F8L6iiVnIIN/1Wl08qMSDgL4Ez3R
	7VqeVlA49G6zgtphrGVG2vDY/gThvINO2v3oEvis7vMX6qHbwN7vNKT0Xq9G5Dn1
	UsoaB4JPrXwyZ+J2SRoIFze0+YeL0yzjGLCQCIIqw+24T9emhLe2+P+1HJkZ+wB4
	64Cj2jslmNuf2bKpSpD+VaK9piCR7GlAulWy1SCMxYkLDqbrVTRMhDWe4hkRrL2N
	q7Nubcd6FekTcCgeEekqTA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m4uuske-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:10:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMx1A8027465
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:10:41 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414faw0a04-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaT+hKLuyJAxqDR+bDU3eyZQKSaEcB9THmeVeI6kjn8wqHPkJ842VKNuKmbYr+zHxNtQYOTWeAdpy8PiRk8TQ1vkOENp6IC549bbEWBnYx5/6gLUFDlZh5nW4AHp0ZVhXayS9hwZ0OgIHMT3VBYc4Nv6BMOujCW53OMo6fWNXlNN+h/TqQa/GURVNhxWCgosY71g2u6uz8Y7GTTEpvw5AlNaP1HMe/VN9bA16f+VhDPstg4l5/K0Smged8qGpSJg03Bk6qre2ugAINMlU/PoW2I/Zcmhd4JsuFH75seI5rE5LcUOw7Rafd4vK6+4/zqV6BwCkmtHQ8S7y5LKzbQjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7O/L0KZ5XFEAlb2h30VzIyQqIbt5i4dj3SDkUtKqkHk=;
 b=lyV399f6EdXacp1afrJIooJOswNmxAGiWcPJi8tV8tkTTAiRStxYRVr9V2nHEzGku+R5ltxQpyQa3ZtZN1ZKumPI7ZF4XGWRiX7hVxwUiXzuQLMl4ctBvbMGQaHJfC6nYxdoMnjTwDwzjd65pb+3fJeE0p6lyDbm25q6cKFOn7aiCo3fGJKp5qcnhnctXBADH1+U/bxV/2MOtiGA6N3ke0o3x3GLULnHEKADmx5gtI6ldLigZ0Q/UY9g++BXYM5eSV6oV6QpnT9TIs0xVhxSAD+oPsYsrd/3UnpS/JW+5tulW1sJQEp9o5a467tJQPkExgpfbW4ywvVpDzVBsIzLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7O/L0KZ5XFEAlb2h30VzIyQqIbt5i4dj3SDkUtKqkHk=;
 b=LMxtXIHl0DUBLjWXEdojYELLidVnEjB3gCxEapAGS5vaHAx9trfAjlp/NpWpusjXDPfpQvWmu4Tx7d6THAzEmazWUsWXfuF9vIYl7ZolUm+vzvj1TMgsAdrFSpeydCbeD0YK6BxTvsAikNmieQ4fKQjklhSZdW6aAgPmLWy2dtA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB6445.namprd10.prod.outlook.com (2603:10b6:806:29d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.11; Mon, 19 Aug
 2024 23:10:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:10:37 +0000
Date: Mon, 19 Aug 2024 19:10:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: updates to README
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:408:f5::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB628746AEDD5AF32C30E29A0DC28C2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 62adddaf-d386-47b5-2201-08dcc0a42336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?63tLZr3LygnvlzOym1HnJ5zpyXpz41Rj9ur3LOqGfQ8Mim9Ertn85Uc9X6B4?=
 =?us-ascii?Q?FDiNMoriKfvAbfsleBEbMDf/MlFtiNROGX3rrhw9I5J3frBvaVEEgxJVC6Z/?=
 =?us-ascii?Q?epN6jgvfqHVbJX/vcGUd2SBiuSTqejNQBDpWhZp6eVwjAoXb70+C/8FAF06j?=
 =?us-ascii?Q?9YCvuMqLu8eV6TSKT2oWBd7PDk3cucFj5zsPIcpzaB7d8QK33Ng+MVjrVvBo?=
 =?us-ascii?Q?P4rmZUHWm98R3weiZbwe7kr+O40VtV4p7Oq4WUzBWc81LAyiC9HPwI6u5JaF?=
 =?us-ascii?Q?7Bpa6D81DOQwA2RTppvvAsQYtBnMJs2owFqbk7/B1xdsxzZbOLGHzf9Wof3Y?=
 =?us-ascii?Q?7r15TnQyaispSlU3iKV7roa4jX6ynOv47mbebt8xbDmJ7dkYs/1KyvUnlVjU?=
 =?us-ascii?Q?UDhuNMfYEUhm9uRq5csX/WKi5QDKbld0IDFoIcLVTaSb59FL+cBVdlSQq9hc?=
 =?us-ascii?Q?rqRrdpjj7xcc0aURNfksBSrl/+ybhl5yDuM8I9fJfhnlfZLmjDpvAboo20bj?=
 =?us-ascii?Q?Uc1grxiFQFOInVMFWsK+aiaLIGh/tyOU0PDlWFEP0485xdnuhP0/ZT3lkdfO?=
 =?us-ascii?Q?K3A1J3xuZe33y14SjrSAKlS+zVYQ2tQSSx8auqChRRpPckIpUlBpyj86kkVt?=
 =?us-ascii?Q?8nLOW1gfp1TXdEqnizt4zp1yPvfSxCMxvEqcu8V4PUzDVHvK828kvxDKJVaT?=
 =?us-ascii?Q?d9j49CTWHPMibtdmGcuy5O7sF8gNPBnp0KHdUlBsEEiZuF/5IiYxoeCPUC9d?=
 =?us-ascii?Q?gknffeYaHRWrcHGh127e/Yv+yjatP7fw8Le+y/8oQ2nPHOowRdvdK4Bcwh03?=
 =?us-ascii?Q?uc5i4aNvH7vU/LHPlytVzfV9S5Q+qTsFru8j3jzTeEAByjSFJznB1zLJfa65?=
 =?us-ascii?Q?esWrnj203K5dArO0ON/A0l7jxQ1sQAVrUDsoszX6kyEoXbtuSDliTU7l9+1b?=
 =?us-ascii?Q?wUfMr9imaynGoRU+Tsj3YB0pGzzu0o3Gnq3/1EV0YRq0ElsLZ099ozYFpHD7?=
 =?us-ascii?Q?/dXjwVw9URs8mqni+weBuxPQoorARFTDswLfQRjjLCBBr/ms3ku0cfjq4qtV?=
 =?us-ascii?Q?oxKwUo6qycW4AUSl8DCYa8x88O1tEtYKwd5/RfTwUc9YqBZYe+zxAQM1Tsm3?=
 =?us-ascii?Q?1ggHqEQI58LmvTEA2UFDPyQItFElcovu2I+GcABzptTmscnx7WaaBNtpzIRM?=
 =?us-ascii?Q?D/QUMHGc1NnQg8nsFulMgcYlG/1aNzjUubmD2gKjTXfcnQpS3DKpFBlnLOVX?=
 =?us-ascii?Q?3V+ICrDjrTEPmqhp8eWvPzXgfLj06eGisAnHneI9IMilcyw+WfeT4PJ2l6hi?=
 =?us-ascii?Q?PKXSKmnttoAU/oAAkQ+CC7S+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wiDp8qNRBfQb55WazYlIeeda6DobYFPXrgu0EnFxa04RBqVHNK4H9F129w2I?=
 =?us-ascii?Q?n5d8VtHAVsmNPPa9TN//4REQ0tsIGwyquS+JpqiWionPx8/r2R45LYg+8nWM?=
 =?us-ascii?Q?3+7SxG4leeCWk8pfdV0dDeGb5ONENLcEG4yLXgbWp9N+B47Adr5nyXXKNF0j?=
 =?us-ascii?Q?Q894b67l9wY4TMV3PaMtQmAdX9/Qfo/4q9qHH81HHaC38FgjxTLwrUMKD49o?=
 =?us-ascii?Q?ur43ZIp3e9whk0AtCJ9DllamyOBwxsI2spYkS+0vt26dctRr6ey4Q0ov7at4?=
 =?us-ascii?Q?3ew3K348d6sKz7mCRINU5e594qVwutEknpF94B0+55PZKauKAhsyAfHoZRpv?=
 =?us-ascii?Q?ifPZsd2udop7Fy5Ty+42lozqzL9CH2AHU8sRxEPe0bROGqplah6ZFuVPSqqv?=
 =?us-ascii?Q?c7GvVrqaLhkZ/GIG/4LrA45mexVXVFviUXWCJwzLZ/lpNhg9wuFbimErze+X?=
 =?us-ascii?Q?OcspLjpjDAT7deIoy8FxsrfDyMrAVmg4MfGy3YLMcNUIalTGfF7rY0aTZf5I?=
 =?us-ascii?Q?OXv6V3ZX5Q7LTdsin/pq4orMW9iFMLdw29oTnYRERse0d0c14N2jAYe6uiHC?=
 =?us-ascii?Q?Wi/WC3mZEpOLkbJ88fcXShs7scE2rNCKxavQARZMDSCI7NmfWzE11EJYZ3iF?=
 =?us-ascii?Q?f8HrXmBPAp0CwVA0sn1p4pr4YDQylYZ7iA394XNnOJtX3OAcOX6CsEiEIZ2V?=
 =?us-ascii?Q?7JxnQ3c84Gt12aLMqBGeDy8cpK0RZUjEVs0u2Rl5wBso2JXIeB39SwIbxrRM?=
 =?us-ascii?Q?phYyIshs6Rz459VL7DuhkBuIr5ZZHpGO6jgDU35cqtnSOKQnN3iT6/fxs+/5?=
 =?us-ascii?Q?Ybh8wDCBK+30c0IfPD3teebhOpFxV3psPABor6EchcbVmKuxKkSCslL//P9M?=
 =?us-ascii?Q?JKYjde7yC0BpbYcOnZ6r7jLP+bagRH2joENWy0uNTllpKEgelR51GLgXAC8m?=
 =?us-ascii?Q?bXeMbNRBdVhBjoeLe+8PRXO1qmPR4Xb1ZEDTbtBN54qgFnU0gWB9gPlchMsM?=
 =?us-ascii?Q?XYEh6478y+gFYYLN7cVMd0fsA3eF/ntgb19oj4OLYgXkHnvyO60Uz4746Rt9?=
 =?us-ascii?Q?okS9TgaQwwwU9q5hLXeOWRjv3R9uxbhGAD7SGHshQOaHXwWOXPxS1NvWztuW?=
 =?us-ascii?Q?VZ2QiAH1NjZgP+9ZdbfkUBoyVO9ZKRUOqhgvFBlLjHS6VwbWRXCR7092PzqQ?=
 =?us-ascii?Q?sBLO9ssZPkFyoghgkU7xjW9uJEWMTrv9OKMuCnzJttnwfOGR01E5S/wsnr4R?=
 =?us-ascii?Q?lsvKUUCU0njDxhGY+o8P+N+CJV0dc4AokWs1gu/+1A0jQvj/mcxZPDCy2kdn?=
 =?us-ascii?Q?Jl8kH4bdbQbBuI1En1nAwv94Hqql75cby4TgiXUYnrj3iTC09b+wBu6fw9ep?=
 =?us-ascii?Q?W/FwRq/BXpT5gbHCwJ4LV3FjX3IlGyj8G2YEOX0VqDTOMLfbRnhWZGJ5QO5d?=
 =?us-ascii?Q?JiX3EJR/t3kfvRLZeaxOB4mwWA6oAH6X3V5qjj/E/Zsuzpxv/OYNLCLU3bKA?=
 =?us-ascii?Q?tzFn2G+QhwcSxyYuD+57TGMpAo2kVx/XI1Qcv5kbEMqHVlMt3U1CHlcXdzxk?=
 =?us-ascii?Q?Hyw+XodN40LWqsF4wynPIF70zaUhmhM+gxtEPcECYaIY2W/z/lLttx6tGRvL?=
 =?us-ascii?Q?GG2HiTMoYkeqdCxjU2aSD90=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e0KUYyIXIcQsA6rKpjFgqicS9aG/SmVYSX3q3TdTcA1i2HqznQMRjLvx0N+C3JyCMNepPUtkTQzTDUbT+0SeNEf7T8CjLs9IJAO3y0O4hwXi0MFbXsty7Z7tQoBNV4vG7f6nmL1DUsFpA4c+4bQGBsSmLTKYn2MNCl+S84r1Uhj5B9mMMlrnmE0LQT5jwYoGxSEO03t8jeAR0459Jux7C6ViIygV0UhtKjRIF+Ea2v6GpF6DOqS8TI20XRvnNt3vA/tt0cHsTJMG63bHsv/BjS3H76SsW1CIMHxRuy5wR5tIixFtbHEW4cJKbFWGU3DodaZ2sSVn8pOy62i39MGZY/Da+XeIBC3lq8o28KBjAEhgdHUBFTfagNg7DzyEFKebFuGUYG6nEgy5CIctK8RXZhby+VeNgCjKBa7As3TaXMtfAcDbzYo5NIzsh/zMzBk+InMZYRIpX5ZjeOWY9OWSdDQl1k7L43sWBHDW640OKvvf1vJPcTSE4aJX0/xAR0D/gnGR+MKf8Deb7a5fWGjslXMGcYvdufBCz6lx25zzYcVSxIjhKDJa59HqxRiTvw/FeZKRnQz4aOojQZGcKUgiANDiXehgHAMoPlqbYmqqLgs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62adddaf-d386-47b5-2201-08dcc0a42336
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:10:37.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzVdrrEJ873+1Sd93aYW3kLr5WutPzrYgXxEt2asKXxot2NgBBJjF7jSI64iv/c+AHR1+5BvL/y/sQ6ITr/jhRfH4/yf00Ytk+tGqDZ6gAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6445
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: LH9y4EYk_vRs18vIYe-1UR0dmeCEKiPI
X-Proofpoint-GUID: LH9y4EYk_vRs18vIYe-1UR0dmeCEKiPI

Remove obsolete reference to kernel source and headers for building
DTrace.

Move build instructions for pre-1.13.2 versions to a new file.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 README.md         |  86 ++------------------------
 README.pre-1.13.2 | 152 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 82 deletions(-)
 create mode 100644 README.pre-1.13.2

diff --git a/README.md b/README.md
index 9c506694..5855a55a 100644
--- a/README.md
+++ b/README.md
@@ -128,24 +128,9 @@ make BPFC=bpf-gcc BPFLD=bpf-ld
 sudo make install
 ```
 
-In this scenario the build system expects that kernel sources can be found at
-`/lib/modules/$(uname -r)/build`.  It is also expected that the kernel used for
-userspace build is compatible with the utils (the exported userspace headers in
-the `include/uapi/linux/dtrace` are compatible with the utils version being
-built).
-
-You can point at a different kernel version with the KERNELS variable, e.g.
-```
-make KERNELS="5.16.8"
-```
-as long as the source tree that kernel was built with remains where it was
-when that kernel was installed.
-
 See `./configure --help`, `make help`, and the top-level GNUmakefile for a
-full list of options (building translators against multiple different
-kernels at once, building against kernel sources found in different places,
-building against a kernel built with O=, installing in different places,
-etc.)
+full list of options (installing in different places, building translators for
+kernels, etc.)
 
 Some of the options (e.g., those specifying paths) may need to be specified
 when installing as well as when building.  To avoid this, you can use the
@@ -200,68 +185,5 @@ Support for DTrace is included in Oracle Linux support subscriptions. Individual
 
 ## 7. Building Previous Releases of DTrace
 
-For versions of DTrace prior to 2.0.0-1.13.2 a small number of kernel patches
-patches are needed, which are
-[here](https://github.com/oracle/dtrace-linux-kernel).  Branches named
-starting v2/* are suitable.
-
-To build such versions of dtrace follow the steps below.
-
-### 7.1. Prerequisites
-
-See [above](#21-prerequisites).
-
-At this point, you will need an additional step:
-
-### 7.2. Build a kernel with add-on features that DTrace uses
-
-DTrace 2.0.0-1.13.1 and earlier depend on a few extra kernel features that are
-not available in the upstream kernel:
-
-- CTF type information extraction
-- /proc/kallmodsyms
-- New system call: waitfd()
-
-As noted above, patches that implement these features are available from the
-v2/* branches in our Linux kernel repository for features that DTrace uses:
-https://github.com/oracle/dtrace-linux-kernel
-
-The customary way to obtain these patches is to clone an appropriate upstream
-kernel version (5.8.1 or later) and to merge our
-[updated tree](https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.8.1)
-into it.  The patch set is quite small, but may need some tweaking if it is
-being merged into a newer tree.  We occasionally push a new patched tree to our
-github repo, so do look around the repo to see if there is a branch with better
-match.
-
-Oracle Linux's [UEK7](https://github.com/oracle/linux-uek/tree/uek7/ga)
-provides a simple alternative if you don't want to patch your own kernel.
-
-Building of a patched kernel from sources is also straightforward.
-Please consult `Documentation/process/changes.rst` in the kernel source tree
-to ensure all required dependencies are installed first.  The following steps
-should build and install the kernel.
-
-```
-# Start with your preferred .config options.  Features DTrace needs should
-# enable themselves automatically.
-make olddefconfig
-make
-
-# This step will produce vmlinux.ctfa, which holds all CTF data for the kernel
-# and its modules.  If it doesn't work, you don't have a toolchain that is
-# recent enough.
-make ctf
-
-# Install with root privileges.
-sudo make INSTALL_MOD_STRIP=1 modules_install
-sudo make install
-```
-
-It is preferred (but not required) to reboot into your new kernel before
-trying to build DTrace.  (If you don't reboot into it, you need to specify
-some extra options when running make.)
-
-### 7.3. Build DTrace
-
-See [above](#22-build-dtrace).
+Refer to [these instructions](./README.pre-1.13.2.md) to build DTrace versions
+prior to 2.0.0-1.13.2.
diff --git a/README.pre-1.13.2 b/README.pre-1.13.2
new file mode 100644
index 00000000..1509ec65
--- /dev/null
+++ b/README.pre-1.13.2
@@ -0,0 +1,152 @@
+ Linux DTrace
+
+For versions of DTrace prior to 2.0.0-1.13.2 a small number of kernel patches
+patches are needed, which are
+[here](https://github.com/oracle/dtrace-linux-kernel).  Branches named
+starting v2/* are suitable.
+
+To build such versions of dtrace follow the steps below.
+
+## 1. Prerequisites
+
+Please read this section carefully before moving over to the build
+documentation to ensure your environment is properly configured.
+
+### 1.1. Verify that binutils is recent enough...
+
+DTrace uses a type introspection system called CTF.  This is supported by
+upstream GCC and GNU Binutils.  Make sure you have binutils 1.36 or later
+installed.
+
+If your distro provides libctf.so in a binutils development package, you need
+to install that too.
+
+### 1.2. or install a recent-enough binutils
+
+If your distro provides binutils 1.36 or later, you should install it.  If not,
+you can build your own local copy (which can be configured with a --prefix
+specific to itself to avoid disturbing the distro version).
+
+### 1.3. Install other necessary packages
+
+A few other packages are required, either for building or at runtime.  They
+should be part of most Linux distributions today and can be installed via the
+package manager of your distro.  The table below gives package names for Debian
+and Oracle Linux.
+
+For building:
+
+| Prerequisite       | Debian                      | Oracle Linux              |
+|:-------------------|:----------------------------|:--------------------------|
+| glibc headers      | libc6-dev                   | glibc-headers             |
+| glibc (static)     | (in libc6-dev)              | glibc-static              |
+| glibc (32-bit dev) | libc6-dev-i386              | glibc-devel.i686          |
+| bison              | bison                       | bison                     |
+| flex               | flex                        | flex                      |
+| BPF gcc            | gcc-bpf                     | gcc-bpf-unknown-none      |
+| BPF binutils       | binutils-bpf                | binutils-bpf-unknown-none |
+| libpcap dev        | libpcap-dev                 | libpcap-devel             |
+| wireshark          | wireshark                   | wireshark                 |
+| valgrind           | valgrind                    | valgrind-devel            |
+| fuse3 or fuse      | libfuse3-dev or libfuse-dev | fuse3-devel or fuse-devel |
+| kernel headers     | linux-headers-<kver>-<arch> | kernel-uek-devel-<kver>   |
+|                    | linux-headers-<kver>-common |                           |
+
+At runtime:
+
+| Prerequisite       | Debian                 | Oracle Linux              |
+|:-------------------|:-----------------------|:--------------------------|
+| wireshark          | wireshark              | wireshark                 |
+| fuse3 or fuse      | libfuse3-3 or libfuse2 | fuse3-devel or fuse-devel |
+
+## 2. Build a kernel with add-on features that DTrace uses
+
+DTrace 2.0.0-1.13.1 and earlier depend on a few extra kernel features that are
+not available in the upstream kernel:
+
+- CTF type information extraction
+- /proc/kallmodsyms
+- New system call: waitfd()
+
+As noted above, patches that implement these features are available from the
+v2/* branches in our Linux kernel repository for features that DTrace uses:
+https://github.com/oracle/dtrace-linux-kernel
+
+The customary way to obtain these patches is to clone an appropriate upstream
+kernel version (5.8.1 or later) and to merge our
+[updated tree](https://github.com/oracle/dtrace-linux-kernel/tree/v2/5.8.1)
+into it.  The patch set is quite small, but may need some tweaking if it is
+being merged into a newer tree.  We occasionally push a new patched tree to our
+github repo, so do look around the repo to see if there is a branch with better
+match.
+
+Oracle Linux's [UEK7](https://github.com/oracle/linux-uek/tree/uek7/ga)
+provides a simple alternative if you don't want to patch your own kernel.
+
+Building of a patched kernel from sources is also straightforward.
+Please consult `Documentation/process/changes.rst` in the kernel source tree
+to ensure all required dependencies are installed first.  The following steps
+should build and install the kernel.
+
+```
+ Start with your preferred .config options.  Features DTrace needs should
+ enable themselves automatically.
+make olddefconfig
+make
+
+ This step will produce vmlinux.ctfa, which holds all CTF data for the kernel
+ and its modules.  If it doesn't work, you don't have a toolchain that is
+ recent enough.
+make ctf
+
+ Install with root privileges.
+sudo make INSTALL_MOD_STRIP=1 modules_install
+sudo make install
+```
+
+It is preferred (but not required) to reboot into your new kernel before
+trying to build DTrace.  (If you don't reboot into it, you need to specify
+some extra options when running make.)
+
+## 3. Build DTrace
+
+The simplest way of building DTrace is done by issuing the following commands
+from the DTrace source tree:
+
+```
+make
+sudo make install
+```
+
+Some distributions install the BPF gcc and binutils under different names.  You
+can specify the executables to use using the **BPFC** and **BPFLD** variables.
+E.g. on Debian you could use:
+
+```
+make BPFC=bpf-gcc BPFLD=bpf-ld
+sudo make install
+```
+
+In this scenario the build system expects that kernel sources can be found at
+`/lib/modules/$(uname -r)/build`.  It is also expected that the kernel used for
+userspace build is compatible with the utils (the exported userspace headers in
+the `include/uapi/linux/dtrace` are compatible with the utils version being
+built).
+
+You can point at a different kernel version with the KERNELS variable, e.g.
+```
+make KERNELS="5.16.8"
+```
+as long as the source tree that kernel was built with remains where it was
+when that kernel was installed.
+
+See `./configure --help`, `make help`, and the top-level GNUmakefile for a
+full list of options (building translators against multiple different
+kernels at once, building against kernel sources found in different places,
+building against a kernel built with O=, installing in different places,
+etc.)
+
+Some of the options (e.g., those specifying paths) may need to be specified
+when installing as well as when building.  To avoid this, you can use the
+configure script: it bakes variable settings into the makefile so that they
+persist across multiple invocations, including `make install`.
-- 
2.42.0

