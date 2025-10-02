Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773A50276
	for <dtrace@lists.linux.dev>; Thu,  2 Oct 2025 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434470; cv=fail; b=iYPR9KCRB5I4982SxSoV3pgUMruxePz/19sAuI9zeoE5szkoA13eiIOA9zQClltTYlYlFp2CypDiXiNUmFLWlOqd78SZfbyO+SsN2WXZix5mUb5ZQNNx0N52C2OOfe37Y4ocmSF/CSgQPAfw3V1g/hDfSwQKtj35EuXblsnkIBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434470; c=relaxed/simple;
	bh=nnpjAnzRTOH4LtuqPd6agpllCvSSpeM4gj0WcgcVWiQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=EGcMlpeTCqYZ3rQRyFT3VX3x1xtYkUEeG1qm/MjrLnFglKyb/w4pOU5tsNoMC5OKr39RAXlqKsBnLKXKIjK2MNTdWBH/aMOwGQnvTlGLFQ5Aa4z1kWvK5CsMYg/9ocZdY0hvccx85DgAXjBIjPHR5q892Oi3Wl+dXrP9xjCC4e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qvc2dLeU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WzBYTy0H; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qvc2dLeU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WzBYTy0H"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1u15013658
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 19:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=7zaZ0UwMueBw05gpo25kAZ8HhIN32QADX92OTLsZdTc=; b=
	qvc2dLeUvmZmHQAbeYV1puJyHkOo6Xi/f5KpMnRbXwcON+JE9FdnRNV8u0tA7eVl
	tYKRSDNFL9O1prcO2dNRIStkm1rwWAQK93aFsmbyKEdcX0adeC6MD9+ew3jeFrRH
	VKqVRMfBT8/FlNvq/qFPrifeiPx+TlQpYaiIJVwjeiOdQ+3hMbX5nCLJihZS6y/i
	FPAdDwr4U7MIzCF6ddKQdOIgJhjWxecrwSjG5OwYXwf28tpoJk26yHP7r1pPfJgi
	3tSbbsoxcVj8839uFVs9zD/ORmzVDxACy5ZtPSh9hI/z6UZjC2DeSzf8jGSCZRgQ
	57KyLg5u/MWUJW+T9uz0Rg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmrfuy8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 19:47:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592IeiHu018176
	for <dtrace@lists.linux.dev>; Thu, 2 Oct 2025 19:47:44 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw326jq5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 02 Oct 2025 19:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHqV2zqFmOx+dv4lrsiH8YPGb/jZYeC+0a2AHCwVr0AqmA0Pm7Bk0EmmGZpG/uBvxBf58imp7UATw1k5w2/cUk42oWFwvsC9ay30FJ4nUDOWh0LPlqi7ai0PjDONxRNtt9G3xOdX/paa+zNNRnNanxWuwJlv20er7gIFu2K9pDmkO4EcyG2xGn6vM/JvzzBU2qh9sAnbfMYuMDIoAkg+G9Yz6keXS0+4keEiPAQMh1HFzVtsCYl+99UTHFoBmbsjQdxaXCgQay8JWQgP7WvoOiUH+DONrbmVU56X1X6FPKRRaDpnL8gj+CMzSrOz06tRod7+Tv1UOynwv/umsti73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zaZ0UwMueBw05gpo25kAZ8HhIN32QADX92OTLsZdTc=;
 b=B7YxLzf1LwIq3/cR3zVIoGAWCQUOyXpNPwzIk4uoLlblCiZcPIk7Pqb0WudYfDXCNLH8rJtV6O1uccJRxClbDBfIAOdpA1SShTp3SfaqAHiaZ+Ssxo+du9wn3RSzoBt3PPcHkfgJgBo/dH/+pCQ0aqpuMzeXRkenap+Z35HbW9bf2TgMgRl696ruvaAaSsfDJyV7m7+64cquEQPv21NiMzPq6Le9SWTnpdFS5ug1rbNY1kx+3ontIi1L6dbPDiKvi4vdDP2NTHCcVmUEHk9RHri6J7zXwyXzAsnUKMmAkBUdXKl0/UTT/7g5c2pqT3w+WeXmGjqE3AzUEvKfhydfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zaZ0UwMueBw05gpo25kAZ8HhIN32QADX92OTLsZdTc=;
 b=WzBYTy0H9/pc8W7EO+fio4IwMWHgR926zAOrO9ydCQ8T5ZjbxrWcNOwn8DtT2MhYXjoxhcNQ5ZV4Tp6U2tI9AmL7vsYDjPFGYeVYZ1QzAHgvONlLTj99h8jwTmdVKRptkPoX/LvPHPpo9gO9z9IFC4JIqE3gjELvHSg8ZH0/cy0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6766.namprd10.prod.outlook.com (2603:10b6:8:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 19:47:41 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 19:47:40 +0000
Date: Thu, 02 Oct 2025 15:47:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] cg, printf: allow storing [u]stack() into vars and printf
 using %k
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672C09310C10847AEB00DCBC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: d3679b5e-a1c7-4f52-c0ab-08de01ec8c09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g8+lklmx+ChKFJmO+k+N7yJe7fu9RIPB0CWAcYMchWqyoUtlDgORbhIC1a3j?=
 =?us-ascii?Q?zODoaweOgkFTba7/yCsUyuDpwJ67AM1UlG8drAJfqaVibzWv/5adUrckAFTA?=
 =?us-ascii?Q?rHZT58YJn92G6CfHoT9pffVj3PMyQcYg8qRfF/O8inszwF4ZmNcoayHvrC96?=
 =?us-ascii?Q?1s7v9ehWsOim+/gml6RNSF8wlKYxV3GhzhmGo2Wc/6VEKT3CeQLw28bO1/kd?=
 =?us-ascii?Q?GUqUvn+0K5h4SaOIv7KuH+TGrhAF6izlLbT/DVUAG3BTcgjXKdDZ958682Fz?=
 =?us-ascii?Q?zpA54nS9B1L7kVRNtYZf+JYQtj9OiLDCYW/WmG5picWC5MtSkO/NRiN3jEbr?=
 =?us-ascii?Q?n5wmVngHFREyEQgU6Bd9hdYEOrVXX0jHcLLA4KURWCMPfypc0tH9sKU62i1N?=
 =?us-ascii?Q?4kkbSJdlgRsBgls72afDjeQD7kjfevD3svxnWSxAN3pytIf62WI2NgzbIeZi?=
 =?us-ascii?Q?yR/k2DxDdGT0X0MPfNfjkALlath5QeJn7nM661spB0k32+HYV3we9ZfWu60d?=
 =?us-ascii?Q?8h/HiM7o2qnvNXKRhe9ydgCJZSQqbCuysszgHf1G0/X4cPIB8wAjcqfAPVJC?=
 =?us-ascii?Q?nB4DEfHT+FkHlZwFDUd09O5qjX+nFEtKkRZ9aznbXJemjDI/g9y5fwZwAFeC?=
 =?us-ascii?Q?uF7bxlmfSRcTZeoZ6SJ8xsHzoUHgvWX1mebeEw90pT0vaxG7hsmW2YB/gHTJ?=
 =?us-ascii?Q?0B4Ng2KNPoxv+XpK407WyPO/+J6WCgm6A6Tg0muNlUDijjSnCah8v75uKvKn?=
 =?us-ascii?Q?Itk+v081FpW5SzMOrsZBI+Z8Ah7JNXQiSt1u/mJZfumT1rP+m7F21SGRbJV/?=
 =?us-ascii?Q?JkzfERV3P/f1WDIiXCGYfI0X/5msV4X6bqsAHn1FjPMLPSnq4EYK+qRyea4O?=
 =?us-ascii?Q?6mrIzcQrEgsvKELsboqcW1BKJyBqvmkhgg+HLZVIS1RE0QAw8DkC2EBru/GF?=
 =?us-ascii?Q?dvnTPxJgxvDReqM47yzJWqsDONHEws0T+8eSfORhcalWIuz3frX8u1vPRQpv?=
 =?us-ascii?Q?zIh+ueDiicndH4jQ3lO98/hwslFxBzkHx0s6/WOdV3/+YhpQ/53mmyt5sbVZ?=
 =?us-ascii?Q?vAVBvVzYVPwhrZH2ObTKuOOCx7LoSRcsBBhAXbpUikfgwdLB09q6QrEcKHzn?=
 =?us-ascii?Q?Ov28E3Y3mCK6I3H8jfAqkoPpANMJwqvFlwzkAPrmbwS5i+Xap7Ue0J6bBGqk?=
 =?us-ascii?Q?mWN8mbZ4iKZ72Hlxeasop4Obs5fAT/AIf/MEEDYvWnT5PwOyEk2r/y5DrNn4?=
 =?us-ascii?Q?8h8048cIivl/k03OVytffoGF3SNgpni6zeT/kph65yph2YmaAHNE5/y8ApoR?=
 =?us-ascii?Q?/UPP3UOqAmeYwBBWdj+nXQpyEdHCvo7KuXhFDM5f1NcpxyWGv5n3e+BSXXFI?=
 =?us-ascii?Q?zBcvlOof5GGNsS7fQW+13LCgxfRbsPIE5bMFUR7qwCFtLU3mLLSOBCS7CFj8?=
 =?us-ascii?Q?KcLyZEYcNK4+X60iABL9GdgPcu0SbAhE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xj1nRewi4orupWeL5/pC+j6aPJ7MDNhzegOScnoJO9G1nW+geZQ0HFr5HBsb?=
 =?us-ascii?Q?AYbjceYZsoFT+1vUmEMkaub/UILAnN1SInIFR8PJ5bWyRixToTGDnNnVu/Qg?=
 =?us-ascii?Q?Hf3LWXD3PLjkMFn6dl+K9kERWaoC5xHi5cIwwCNxaCeHeogpnP+2/aPsrwyV?=
 =?us-ascii?Q?I89i/btLrdsmyEI/xbTRj8WGsRK/7f+aB2m8oSWclF5Z4OsIbpgJ5menNo4V?=
 =?us-ascii?Q?trzn4AzR1qTZH76YoBMem8N6nk9CeopLLhIFzepB924698Y3qEA/M/yjbIQu?=
 =?us-ascii?Q?WyZyExJxc1hXj5SCo/JcYZI+4LfEDNy7a686c0u8lXQDDqPQ3p37cw7Y6pum?=
 =?us-ascii?Q?SHe370lXseTA1MCbPlgnRyhOBxO79pNUR/ZHRjCDmKhy70A8Ju39qSU/A9EK?=
 =?us-ascii?Q?ZDWw7+z0LKWni4cEtP1M1Y0eKneMoYv2W+RtVgF8Hgwjg/Nun/W4pvzlPHO9?=
 =?us-ascii?Q?4cTNIM0OuZuWWOiYMsExA0cNJrHVTIt7rWwO/3NHTc2O1oXHXKuzNiHI2FhK?=
 =?us-ascii?Q?X9V6aQQ7lCpJ/k6+uYfsH6rQlw5IziIoGv7id17txGSg8geBMGUiz53YNG14?=
 =?us-ascii?Q?5S1bEr/16N8zWqTj5q1k2CsWzPWIhycm7BYjbgXro3yEUf67kGiAKoDc7N0O?=
 =?us-ascii?Q?pZ1de45PePz8jJ9yfuQy8br9TJ/ByCee/56mxS9nCQCZRDDx6r0l6HjXe2pu?=
 =?us-ascii?Q?FGx3u3iPdqO99rjfPkZAJ4lKeV1k/TzUiO53513MU3541F2aI9bCes2NzAfP?=
 =?us-ascii?Q?iKDlB0laGUYpnUpspo/0Idf9U0+ynzATei1xrRL+dOEGwK1o19Yxft9B9OIK?=
 =?us-ascii?Q?iQeKE33NtgvRG11frCT8DpyFSd8OYXXSkWliATN6Zb1/fVdUPXW3kbjtj1F9?=
 =?us-ascii?Q?2GM+taGE8AzsmvVN93MFQGhqfNE+f/1FcNwJBtUtiJau/7rwtnAAPoVDgJu1?=
 =?us-ascii?Q?UQ4fP7b615RXrYpeQlg5e3W07DW/37J8xt9pKC2U+ADdk05KI0lwWumGdvzf?=
 =?us-ascii?Q?k9AoLyIdBUy8KwkEySalIOoV6zVFn+5LODqLH0Kn/HY4NZlWwwOXB81cdie6?=
 =?us-ascii?Q?2kmRorK/FdBA3dOYhQYjaFAJXppsFGkhAyrK1haHW+5zqyeoRDb+xjDLB9tz?=
 =?us-ascii?Q?MqMBRDDUUFqH8p3rhW8t+3VJPofjZ9tQ9l2d+VH6GGxu3nE3szUUAaw4dBs+?=
 =?us-ascii?Q?UQJMv3f+4zY1kujTlC/ncJpRsMQo6of8fw1Wh2l4PbkGDASJ0lgP+m0thUKW?=
 =?us-ascii?Q?Ha0G2lk+t2WhoX9bQyAqfZX01QcJXGXbj1Ist+a4S8pLck4rjlbMUyr9Cjnm?=
 =?us-ascii?Q?MDU+2SlGgiTXHgWei16/4chDBcCJ2UZNe4iCHueEIsqjzhAib/RFKzABgSx8?=
 =?us-ascii?Q?/yrZl4y5e0Qhlcp98/FHxbjR5VMhaTzDyTQvNCj5Jz8su6VmDxi6otSe3I2w?=
 =?us-ascii?Q?upFc1BFsx9WSdLkS/LgImJEltq8+R+wokwvDcC4MlHBG/AcBoD91glkxARsO?=
 =?us-ascii?Q?OFxAsZ//C9o0gKHMoNjoOnaKQJpLBlF8tp5k7yb03VRqwfusKzc759E8xkaH?=
 =?us-ascii?Q?cT4X3sdrRuXvIuIlhFEFoOitIs7BIE3qRohuRXgTzMglbSNEQ5S1I1pjw15U?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IrK6KcUtO5/dKrqMf2LtUCmbixyLcoMHcSMBdprcRwYVa0Jo7yw0Lhxqh3HfhPYn3OLZcafAovoZYIGoA9tvkThJF4fGmFNps8GIAOe0PHocUbjOmomyf15lxLLblI//4GXd3DilSdirC9zkD/FhxRoSFl/v3flebN05b6LtarpFUEod//3wwmMlKTeNDDfWMmDTsTDGTvsubsoSaT+ANxxiNbR/i4KzmbMn10bPMehIYExoI9t6Rw35zmSotF4fypVT9g3obz/Qp+iECprKtT+a/09fqIwBz/b6BE25JIW2Bi3b1I2Vh9uXBRTXi7IWblFKgnWBQG1rds+Y5XB8Kvt0qTKyQqmqk3lwTJtKvS3yYcIvJBOSX4nIblgDLp88VYsMBt9zGQjdXx5kKJun7p9NLoD2r0bJbO7yB/YYwPrtOJOC94TeioQXEO45K01WMBNNhM7axpCRB/ctqTF+6l2knQ8wrGqiAeQR4VR7JKsBvgkZPaSsnmrzi++TCZxm4an766jNZaO/zUKfSdTh5TWrxOX001G7xlCo81W10QX1YJCCcd3/ySr38HO6AZYRfCQClsLpMlvfB8YTqAiXv+O/qbE2YPWuOzczl+2IoWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3679b5e-a1c7-4f52-c0ab-08de01ec8c09
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 19:47:40.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAX+NxEM9zSjv6yTLUA4sNqo7kVe1TIRaSsKUgw0eKHW7V6g2x7Df13qgEd2u0aoOC7bbyO4zFPH1vcpQan5j3jr7faaKRcfMx1L40/iN3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6766
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510020171
X-Proofpoint-ORIG-GUID: axJ5wqKMQoL6ExIt6hRiUROcloEZEZA1
X-Proofpoint-GUID: axJ5wqKMQoL6ExIt6hRiUROcloEZEZA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE3MCBTYWx0ZWRfX0daJC4WIfChv
 uprC5T1xl1UUy+KCVsSK1/vQbuojzAvUY/r6qiBNTlz1xPjWaeoi56REs32YwuUYxWeFGNjwja0
 8UWOV/eAirrZM7sdtqlS9htYl4bx1hn7KhUZZhvN2iTUATCidr12tpcfIWxjTxZpJhFayz9QMkE
 3/6oCTi5uDs+OqbGFXO5fdC3pFiH0xU2UWPFK83wZBV3/eCKS+MFGVWVY7OIKxPUchS6/yXf8dF
 LgFbcl2inyryAjoOm29lY7WvnrE0b2QwRLM5vIG5xtCRjOJQ4UAwjc5DKYpE4/+Wgm9txf9NN2D
 wTBMeZPkGo/9m5BmomQYy1BAci+NhmP1vVmV6R3IUrGlPII8X5fEAUBJskQX14mZIRwusaGRqHg
 Yo5YHx3MF/SBcYoz4z1r8LqVUVGmEtjVOAIAGXlRiyml6S+tSaQ=
X-Authority-Analysis: v=2.4 cv=VpMuwu2n c=1 sm=1 tr=0 ts=68ded6e2 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=elBfma47d09_EIEHixcA:9
 a=PI8kJ6t5kbnCqaq4:21 cc=ntf awl=host:12089

To support storing [u]stack() values in variables and as arguments for
printf(), a type definition is introduced:

	typedef struct dt_stack {
		uint32_t	frames;
		uint32_t	strsz;	  // optional string blob size
		uint32_t	type;	  // type of stack (kernel/user)
		uint32_t	pid;	  // process id (or 0 for kernel)
		uint64_t	addrs[n]; // stack trace addresses
	} dt_stack_t;

where 'n' is the maximum number of frames that can be retrieved (set
with the 'maxframes' option).

Since dt_stack_t needs to be known early enough to define stack(),
jstack(), and ustack(), it is defined in two stages.  First dt_stack_t
is defined as a typedef for struct dt_stack, and once options have been
processed, struct dt_stack is finalized.

Once the value of a stack has been assigned to a variable, it can be
accessed as a regular struct (*not* a pointer to a struct).
Modification is also possible, and safety checks are performed to ensure
that such modifications do not cause crashes in the consumer.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                             | 43 ++++++-----
 libdtrace/dt_dctx.h                           |  3 +-
 libdtrace/dt_impl.h                           |  3 +
 libdtrace/dt_open.c                           | 62 ++++++++++++---
 libdtrace/dt_parser.c                         |  2 +-
 libdtrace/dt_printf.c                         | 40 ++++++++--
 .../unittest/funcs/stack/err.corrupted-data.d | 30 ++++++++
 .../unittest/funcs/stack/err.corrupted-data.r |  6 ++
 .../unittest/funcs/stack/err.store-to-stack.d | 28 +++++++
 .../unittest/funcs/stack/err.store-to-stack.r |  2 +
 test/unittest/funcs/stack/tst.asgn_dvar.d     | 30 ++++++++
 test/unittest/funcs/stack/tst.asgn_dvar.r.p   | 35 +++++++++
 test/unittest/funcs/stack/tst.asgn_gvar.d     | 30 ++++++++
 test/unittest/funcs/stack/tst.asgn_gvar.r.p   |  1 +
 test/unittest/funcs/stack/tst.asgn_lvar.d     | 30 ++++++++
 test/unittest/funcs/stack/tst.asgn_lvar.r.p   |  1 +
 test/unittest/funcs/stack/tst.asgn_tvar.d     | 30 ++++++++
 test/unittest/funcs/stack/tst.asgn_tvar.r.p   |  1 +
 test/unittest/funcs/stack/tst.ref_addrs.d     | 29 +++++++
 test/unittest/funcs/stack/tst.ref_addrs.r     |  7 ++
 test/unittest/funcs/stack/tst.ref_depth.d     | 40 ++++++++++
 test/unittest/funcs/stack/tst.ref_depth.r     |  8 ++
 test/unittest/funcs/stack/tst.ref_pid.d       | 40 ++++++++++
 test/unittest/funcs/stack/tst.ref_pid.r       |  8 ++
 test/unittest/funcs/stack/tst.ref_strsz.d     | 40 ++++++++++
 test/unittest/funcs/stack/tst.ref_strsz.r     |  8 ++
 test/unittest/funcs/stack/tst.ref_type.d      | 40 ++++++++++
 test/unittest/funcs/stack/tst.ref_type.r      |  8 ++
 test/unittest/funcs/stack/tst.store.d         | 30 ++++++++
 .../funcs/ustack/err.corrupted-data.d         | 25 +++++++
 .../funcs/ustack/err.corrupted-data.r         |  4 +
 .../funcs/ustack/err.store-to-stack.d         | 23 ++++++
 .../funcs/ustack/err.store-to-stack.r         |  2 +
 test/unittest/funcs/ustack/tst.asgn_dvar.d    | 25 +++++++
 test/unittest/funcs/ustack/tst.asgn_dvar.r.p  | 35 +++++++++
 test/unittest/funcs/ustack/tst.asgn_gvar.d    | 25 +++++++
 test/unittest/funcs/ustack/tst.asgn_gvar.r.p  |  1 +
 test/unittest/funcs/ustack/tst.asgn_lvar.d    | 25 +++++++
 test/unittest/funcs/ustack/tst.asgn_lvar.r.p  |  1 +
 test/unittest/funcs/ustack/tst.asgn_tvar.d    | 25 +++++++
 test/unittest/funcs/ustack/tst.asgn_tvar.r.p  |  1 +
 test/unittest/funcs/ustack/tst.ref_addrs.d    | 24 ++++++
 test/unittest/funcs/ustack/tst.ref_addrs.r    |  5 ++
 test/unittest/funcs/ustack/tst.ref_depth.d    | 35 +++++++++
 test/unittest/funcs/ustack/tst.ref_depth.r    |  6 ++
 test/unittest/funcs/ustack/tst.ref_pid.d      | 37 +++++++++
 test/unittest/funcs/ustack/tst.ref_strsz.d    | 35 +++++++++
 test/unittest/funcs/ustack/tst.ref_strsz.r    |  6 ++
 test/unittest/funcs/ustack/tst.ref_type.d     | 35 +++++++++
 test/unittest/funcs/ustack/tst.ref_type.r     |  6 ++
 test/unittest/funcs/ustack/tst.store.d        | 25 +++++++
 test/unittest/printf/tst.stack.d              | 33 ++++++++
 test/unittest/printf/tst.stack.r              |  1 +
 test/unittest/printf/tst.stack.r.p            | 75 +++++++++++++++++++
 test/unittest/printf/tst.ustack25_pid.d       | 21 ++++++
 test/unittest/printf/tst.ustack25_pid.r       | 28 +++++++
 test/unittest/printf/tst.ustack25_pid.r.p     | 37 +++++++++
 57 files changed, 1196 insertions(+), 40 deletions(-)
 create mode 100644 test/unittest/funcs/stack/err.corrupted-data.d
 create mode 100644 test/unittest/funcs/stack/err.corrupted-data.r
 create mode 100644 test/unittest/funcs/stack/err.store-to-stack.d
 create mode 100644 test/unittest/funcs/stack/err.store-to-stack.r
 create mode 100644 test/unittest/funcs/stack/tst.asgn_dvar.d
 create mode 100755 test/unittest/funcs/stack/tst.asgn_dvar.r.p
 create mode 100644 test/unittest/funcs/stack/tst.asgn_gvar.d
 create mode 120000 test/unittest/funcs/stack/tst.asgn_gvar.r.p
 create mode 100644 test/unittest/funcs/stack/tst.asgn_lvar.d
 create mode 120000 test/unittest/funcs/stack/tst.asgn_lvar.r.p
 create mode 100644 test/unittest/funcs/stack/tst.asgn_tvar.d
 create mode 120000 test/unittest/funcs/stack/tst.asgn_tvar.r.p
 create mode 100644 test/unittest/funcs/stack/tst.ref_addrs.d
 create mode 100644 test/unittest/funcs/stack/tst.ref_addrs.r
 create mode 100644 test/unittest/funcs/stack/tst.ref_depth.d
 create mode 100644 test/unittest/funcs/stack/tst.ref_depth.r
 create mode 100644 test/unittest/funcs/stack/tst.ref_pid.d
 create mode 100644 test/unittest/funcs/stack/tst.ref_pid.r
 create mode 100644 test/unittest/funcs/stack/tst.ref_strsz.d
 create mode 100644 test/unittest/funcs/stack/tst.ref_strsz.r
 create mode 100644 test/unittest/funcs/stack/tst.ref_type.d
 create mode 100644 test/unittest/funcs/stack/tst.ref_type.r
 create mode 100644 test/unittest/funcs/stack/tst.store.d
 create mode 100644 test/unittest/funcs/ustack/err.corrupted-data.d
 create mode 100644 test/unittest/funcs/ustack/err.corrupted-data.r
 create mode 100644 test/unittest/funcs/ustack/err.store-to-stack.d
 create mode 100644 test/unittest/funcs/ustack/err.store-to-stack.r
 create mode 100644 test/unittest/funcs/ustack/tst.asgn_dvar.d
 create mode 100755 test/unittest/funcs/ustack/tst.asgn_dvar.r.p
 create mode 100644 test/unittest/funcs/ustack/tst.asgn_gvar.d
 create mode 120000 test/unittest/funcs/ustack/tst.asgn_gvar.r.p
 create mode 100644 test/unittest/funcs/ustack/tst.asgn_lvar.d
 create mode 120000 test/unittest/funcs/ustack/tst.asgn_lvar.r.p
 create mode 100644 test/unittest/funcs/ustack/tst.asgn_tvar.d
 create mode 120000 test/unittest/funcs/ustack/tst.asgn_tvar.r.p
 create mode 100644 test/unittest/funcs/ustack/tst.ref_addrs.d
 create mode 100644 test/unittest/funcs/ustack/tst.ref_addrs.r
 create mode 100644 test/unittest/funcs/ustack/tst.ref_depth.d
 create mode 100644 test/unittest/funcs/ustack/tst.ref_depth.r
 create mode 100644 test/unittest/funcs/ustack/tst.ref_pid.d
 create mode 100644 test/unittest/funcs/ustack/tst.ref_strsz.d
 create mode 100644 test/unittest/funcs/ustack/tst.ref_strsz.r
 create mode 100644 test/unittest/funcs/ustack/tst.ref_type.d
 create mode 100644 test/unittest/funcs/ustack/tst.ref_type.r
 create mode 100644 test/unittest/funcs/ustack/tst.store.d
 create mode 100644 test/unittest/printf/tst.stack.d
 create mode 100644 test/unittest/printf/tst.stack.r
 create mode 100755 test/unittest/printf/tst.stack.r.p
 create mode 100644 test/unittest/printf/tst.ustack25_pid.d
 create mode 100644 test/unittest/printf/tst.ustack25_pid.r
 create mode 100755 test/unittest/printf/tst.ustack25_pid.r.p

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 3ce13c74..ec47bffa 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2730,7 +2730,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_regset_t	*drp = pcb->pcb_regs;
 	uint64_t	arg;
-	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
+	int		nframes, allocsz, aloff;
 	uint_t		lbl_valid = dt_irlist_label(dlp);
 	dt_ident_t	*skip = dt_dlib_get_var(dtp, "STACK_SKIP");
 
@@ -2738,19 +2738,26 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
 
 	/* Get sizing information from dnp->dn_arg. */
 	arg = dt_cg_stack_arg(dtp, dnp, kind);
-	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
 	nframes = DTRACE_STACK_NFRAMES(arg);
-	stacksize = nframes * sizeof(uint64_t);
+	allocsz = DTRACE_STACK_ALLOCSZ(arg);
 
 	/* Handle alignment and reserve space in the output buffer. */
 	if (reg >= 0) {
-		off = ALIGN(off, align);
+		aloff = ALIGN(off, 8);
 	} else {
 		reg = BPF_REG_9;
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind,
-				 prefsz + stacksize, align, NULL, arg);
+		aloff = off = dt_rec_add(dtp, dt_cg_fill_gap, kind, allocsz, 8,
+					 NULL, 0);
 	}
 
+	/* Store the stack trace meta-data (type, depth, strsize). */
+	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff,
+				 DTRACE_STACK_NFRAMES(arg)));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 4,
+				 DTRACE_STACK_STRSIZE(arg)));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 8,
+				 DTRACE_STACK_IS_USER(arg) ? 1 : 0));
+
 	/* Write the tgid. */
 	if (kind == DTRACEACT_USTACK) {
 		if (dt_regset_xalloc_args(drp) == -1)
@@ -2760,17 +2767,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
 		dt_regset_free_args(drp);
 		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
 		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
-		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
+		emit(dlp,  BPF_STORE(BPF_DW, reg, aloff + 12, BPF_REG_0));
 		dt_regset_free(drp, BPF_REG_0);
-	}
+	} else
+		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));
 
 	/* Call bpf_get_stack(ctx, buf, size, flags). */
 	if (dt_regset_xalloc_args(drp) == -1)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
 	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
-	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, aloff + 16));
+	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, nframes * sizeof(uint64_t)));
 	if (kind == DTRACEACT_USTACK)
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
 	else {
@@ -2786,7 +2794,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
 	emitl(dlp, lbl_valid,
 		   BPF_NOP());
 
-	return prefsz + stacksize;
+	return (aloff - off) + allocsz;
 }
 
 static void
@@ -8735,15 +8743,14 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 
 				if (idp->di_kind == DT_IDENT_FUNC) {
 					switch (idp->di_id) {
-					case DIF_SUBR_USTACK:
-						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
-						kind = DTRACEACT_USTACK;
-						size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
-						goto add_rec;
 					case DIF_SUBR_STACK:
-						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
 						kind = DTRACEACT_STACK;
-						size = 8 * arg;
+						goto is_stack;
+					case DIF_SUBR_USTACK:
+						kind = DTRACEACT_USTACK;
+is_stack:
+						arg = dt_cg_stack_arg(dtp, knp, kind);
+						size = DTRACE_STACK_ALLOCSZ(arg);
 						goto add_rec;
 					}
 				} else if (idp->di_kind == DT_IDENT_ACTFUNC) {
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index b50a1395..5bf21345 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -128,7 +128,8 @@ typedef struct dt_dctx {
  *	    completed.
  */
 #define DMEM_STACK_SZ(dtp) \
-		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES] + 1)
+		(4 * sizeof(uint32_t) + \
+		 (dtp)->dt_options[DTRACEOPT_MAXFRAMES] * sizeof(uint64_t))
 #define DMEM_TSTR_SZ(dtp) \
 		(DT_TSTRING_SLOTS * DT_TSTRING_SIZE(dtp))
 #define DMEM_STRTOK_SZ(dtp) \
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 723aac8b..97ad5e37 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -248,6 +248,9 @@ typedef struct dt_tstring {
 #define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
 					 ((t) ? (1UL << 31) : 0) | \
 					 ((x) & INT32_MAX))
+#define DTRACE_STACK_ALLOCSZ(x)		(4 * sizeof(uint32_t) + \
+					 DTRACE_STACK_NFRAMES(x) * \
+						sizeof(uint64_t))
 
 typedef struct dt_dirpath {
 	dt_list_t dir_list;		/* linked-list forward/back pointers */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index ba5463a0..c43cf06d 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint_t" },
 { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
+	&dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
 { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
 	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
 { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
@@ -274,7 +274,7 @@ static const dt_ident_t _dtrace_globals[] = {
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "int()" },
 { "stack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_STACK, DT_ATTR_STABCMN,
-	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t])" },
+	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t])" },
 { "stackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_STACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "uint32_t" },
@@ -329,7 +329,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_regs, NULL },
 { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
-	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
+	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
 { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
 	DT_ATTR_STABCMN, DT_VERS_1_2,
 	&dt_idops_type, "uint32_t" },
@@ -1058,16 +1058,33 @@ dt_vopen(int version, int flags, int *errp,
 	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
 
 	/*
-	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
-	 * final value of MAXFRAMES may be adjusted with the "stackframes"
-	 * option.
+	 * Define:
+	 *   typedef struct dt_stack {
+	 *   	uint32_t	frames;
+	 *	uint32_t	strsz;		// optional string blob size
+	 *	uint32_t	type;		// type of stack (kernel/user)
+	 *	uint32_t	pid;		// process id (or 0 for kernel)
+	 *   	uint64_t	addrs[n];	// stack trace addresses
+	 *   } dt_stack_t;
+	 *
+	 * It is done in two stages because we won't know the size of the addrs
+	 * array until runtime options have been processed.  We add all members
+	 * (except for addrs) here, and then append the addrs array in
+	 * dtrace_init().
 	 */
-	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
-	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
-	ctr.ctr_nelems = _dtrace_stackframes;
-
-	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
-		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
+	{
+		ctf_id_t	stid, mbid;
+
+		stid = ctf_add_struct(dmp->dm_ctfp, CTF_ADD_ROOT, "dt_stack");
+		dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
+						     "dt_stack_t", stid);
+
+		mbid = ctf_lookup_by_name(dmp->dm_ctfp, "uint32_t");
+		ctf_add_member(dmp->dm_ctfp, stid, "depth", mbid);
+		ctf_add_member(dmp->dm_ctfp, stid, "strsz", mbid);
+		ctf_add_member(dmp->dm_ctfp, stid, "type", mbid);
+		ctf_add_member(dmp->dm_ctfp, stid, "pid", mbid);
+	}
 
 	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
 	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
@@ -1174,6 +1191,27 @@ dtrace_init(dtrace_hdl_t *dtp)
 	int		i;
 	dtrace_optval_t	lockmem = dtp->dt_options[DTRACEOPT_LOCKMEM];
 	struct rlimit	rl;
+	dt_module_t	*dmp = dtp->dt_ddefs;
+	ctf_id_t	stid;
+	ctf_arinfo_t	ctr;
+
+	/*
+	 * Finalize 'struct dt_stack' now that we know the maxframes value.
+	 */
+	stid = ctf_lookup_by_name(dmp->dm_ctfp, "struct dt_stack");
+
+	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
+	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
+	ctr.ctr_nelems = (uint_t)dtp->dt_options[DTRACEOPT_MAXFRAMES];
+
+	ctf_add_member(dmp->dm_ctfp, stid, "addrs",
+		       ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
+
+	if (ctf_update(dmp->dm_ctfp) != 0) {
+		dt_dprintf("failed update D container: %s\n",
+		    ctf_errmsg(ctf_errno(dmp->dm_ctfp)));
+		return dt_set_errno(dtp, EDT_CTF);
+	}
 
 	/*
 	 * Initialize the BPF library handling.
diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index 006b4b6e..e71c0985 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -3794,7 +3794,7 @@ dt_cook_op2(dt_node_t *dnp, uint_t idflags)
 		 * described in the ANSI-C spec (see K&R[A7.17]).  We share
 		 * most of this code with the argument list checking code.
 		 */
-		if (!dt_node_is_string(lp)) {
+		if (!dt_node_is_string(lp) && !dt_node_is_stack(lp)) {
 			kind = ctf_type_kind(lp->dn_ctfp,
 			    ctf_type_resolve(lp->dn_ctfp, lp->dn_type));
 
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index a3e15397..9c5ed4d3 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -449,7 +449,8 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	if (depth == 0)
 		return 0;
 
-	tgid = (pid_t)*pc++;
+	tgid = ((uint32_t *)pc)[1];
+	pc++;
 
 	if (format == NULL)
 		format = "%s";
@@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	return err;
 }
 
-/*ARGSUSED*/
+/*
+ * The data at vaddr is structured as follows:
+ *	uint32_t	depth
+ *	uint32_t	strsz
+ *	uint32_t	type
+ *	uint32_t	pid
+ *	uint64_t	addrs[depth & 0x7fffffff]
+ *
+ * If 'depth' member provides the maximum number of addresses in the stack
+ * trace.
+ * The 'strsz' member provides the size of the optional string blob that is
+ * appended to the stack trace data.
+ * The 'type' member identifies the stack trace as kernel space (0) or
+ * userspace (1).
+ * The 'pid' member provides the userspace process id for userspace stack
+ * traces and otherwise will be 0.
+ * The 'addrs' array provides the stack traces addresses.  If the stack trace
+ * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
+ */
 static int
 pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
 	      uint64_t normal, uint64_t sig)
 {
 	int width;
-	const dtrace_recdesc_t *rec = pfd->pfd_rec;
-	caddr_t addr = (caddr_t)vaddr;
-	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
+	uint32_t *vals = (uint32_t *)vaddr;
+	uint32_t depth = vals[0];
+	uint32_t strsz = vals[1];
+	uint32_t is_user = vals[2];
+	caddr_t addr = (caddr_t)(vals + (is_user ? 2 : 4));
 	int err = 0;
 
+	if (depth >= dtp->dt_options[DTRACEOPT_MAXFRAMES])
+		return dt_set_errno(dtp, EDT_DSIZE);
+
 	if (depth == 0)
 		return 0;
 
@@ -603,9 +627,9 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	if (dt_printf(dtp, fp, "\n") < 0)
 		return -1;
 
-	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
+	if (is_user)
 		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
-					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
+					  strsz);
 	else
 		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
 
@@ -777,7 +801,7 @@ static const dt_pfconv_t _dtrace_conversions[] = {
 { "hx", "x", "short", pfcheck_xshort, pfprint_uint },
 { "hX", "X", "short", pfcheck_xshort, pfprint_uint },
 { "i", "i", pfproto_xint, pfcheck_dint, pfprint_dint },
-{ "k", "s", "stack", pfcheck_stack, pfprint_stack },
+{ "k", "s", "dt_stack_t", pfcheck_stack, pfprint_stack },
 { "lc", "lc", "int", pfcheck_type, pfprint_sint }, /* a.k.a. wint_t */
 { "ld",	"d", "long", pfcheck_type, pfprint_sint },
 { "li",	"i", "long", pfcheck_type, pfprint_sint },
diff --git a/test/unittest/funcs/stack/err.corrupted-data.d b/test/unittest/funcs/stack/err.corrupted-data.d
new file mode 100644
index 00000000..bf312346
--- /dev/null
+++ b/test/unittest/funcs/stack/err.corrupted-data.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Corrupted stack data does not cause a crash.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	v = stack(5);
+	v.depth = 0x7fffffff;
+	printf("%k", v);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/err.corrupted-data.r b/test/unittest/funcs/stack/err.corrupted-data.r
new file mode 100644
index 00000000..d447a360
--- /dev/null
+++ b/test/unittest/funcs/stack/err.corrupted-data.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry -- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/err.corrupted-data.d' matched 3 probes
+dtrace: allowing destructive actions
+dtrace: processing aborted: Data record has incorrect size
diff --git a/test/unittest/funcs/stack/err.store-to-stack.d b/test/unittest/funcs/stack/err.store-to-stack.d
new file mode 100644
index 00000000..9ce76163
--- /dev/null
+++ b/test/unittest/funcs/stack/err.store-to-stack.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Assigning a member in stack() is not allowed.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	stack(5).depth = 2;
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/err.store-to-stack.r b/test/unittest/funcs/stack/err.store-to-stack.r
new file mode 100644
index 00000000..51c14758
--- /dev/null
+++ b/test/unittest/funcs/stack/err.store-to-stack.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/stack/err.store-to-stack.d: line 21: operator = requires modifiable lvalue as an operand
diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.d b/test/unittest/funcs/stack/tst.asgn_dvar.d
new file mode 100644
index 00000000..e347915e
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_dvar.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of stack() to a dynamic variable (assoc element).
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	assoc["a"] = stack(5);
+	printf("%k", assoc["a"]);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r.p b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
new file mode 100755
index 00000000..f2b99b67
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
@@ -0,0 +1,35 @@
+#!/usr/bin/gawk -f
+
+/ksys_write/ {
+    # check probe
+    if ( $1 != "ksys_write:entry" ) {
+        print "ERROR: expected fun:prb = ksys_write:entry";
+        exit 1;
+    }
+
+    # check stack(3)
+    getline;
+    if (index($1, "`ksys_write+0x") == 0 &&
+        match($1, "`ksys_write$") == 0) {
+        print "ERROR: expected leaf frame to be ksys_write";
+        exit 1;
+    }
+    getline;
+    if (NF == 0) {
+        print "ERROR: missing second frame";
+        exit 1;
+    }
+    getline;
+    if (NF == 0) {
+        print "ERROR: missing third frame";
+        exit 1;
+    }
+    getline;
+    if (NF > 0) {
+        print "ERROR: expected stack(3) to have only three frames";
+        exit 1;
+    }
+
+    print "success";
+    exit(0);
+}
diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.d b/test/unittest/funcs/stack/tst.asgn_gvar.d
new file mode 100644
index 00000000..af925a7d
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_gvar.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of stack() to a global variable.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	v = stack(5);
+	printf("%k", v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.r.p b/test/unittest/funcs/stack/tst.asgn_gvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_gvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.d b/test/unittest/funcs/stack/tst.asgn_lvar.d
new file mode 100644
index 00000000..02b8cb53
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_lvar.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of stack() to a local variable.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	this->v = stack(5);
+	printf("%k", this->v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.r.p b/test/unittest/funcs/stack/tst.asgn_lvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_lvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.d b/test/unittest/funcs/stack/tst.asgn_tvar.d
new file mode 100644
index 00000000..ead7282f
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_tvar.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of stack() to a TLS variable.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	self->v = stack(5);
+	printf("%k", self->v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.r.p b/test/unittest/funcs/stack/tst.asgn_tvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_tvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.ref_addrs.d b/test/unittest/funcs/stack/tst.ref_addrs.d
new file mode 100644
index 00000000..b096460b
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_addrs.d
@@ -0,0 +1,29 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'addrs' array of a kernel stack.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	trace("Expecting vmlinux`ksys_write, got ");
+	func(stack(7).addrs[0]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.ref_addrs.r b/test/unittest/funcs/stack/tst.ref_addrs.r
new file mode 100644
index 00000000..83117e4c
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_addrs.r
@@ -0,0 +1,7 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry   Expecting vmlinux`ksys_write, got   vmlinux`ksys_write                                
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/tst.ref_addrs.d' matched 3 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/funcs/stack/tst.ref_depth.d b/test/unittest/funcs/stack/tst.ref_depth.d
new file mode 100644
index 00000000..37f07d8e
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_depth.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'depth' field of a kernel stack.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	trace("Expecting 7, got ");
+	trace(stack(7).depth);
+}
+
+fbt::ksys_write:entry
+/stack(7).depth == 7/
+{
+	exit(0);
+}
+
+fbt::ksys_write:entry
+/stack(7).depth != 7/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.ref_depth.r b/test/unittest/funcs/stack/tst.ref_depth.r
new file mode 100644
index 00000000..04eb7382
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_depth.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry   Expecting 7, got                           7
+                ksys_write:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/tst.ref_depth.d' matched 5 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/funcs/stack/tst.ref_pid.d b/test/unittest/funcs/stack/tst.ref_pid.d
new file mode 100644
index 00000000..c674bcd3
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_pid.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'pid' field of s kernel stack yields 0.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	trace("Expecting 0, got ");
+	trace(stack(7).pid);
+}
+
+fbt::ksys_write:entry
+/stack(7).pid == 0/
+{
+	exit(0);
+}
+
+fbt::ksys_write:entry
+/stack(7).pid != 0/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.ref_pid.r b/test/unittest/funcs/stack/tst.ref_pid.r
new file mode 100644
index 00000000..223f5ac2
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_pid.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry   Expecting 0, got                           0
+                ksys_write:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/tst.ref_pid.d' matched 5 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/funcs/stack/tst.ref_strsz.d b/test/unittest/funcs/stack/tst.ref_strsz.d
new file mode 100644
index 00000000..19aae30d
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_strsz.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'strsz' field of s kernel stack yields 0.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	trace("Expecting 0, got ");
+	trace(stack(7).strsz);
+}
+
+fbt::ksys_write:entry
+/stack(7).strsz == 0/
+{
+	exit(0);
+}
+
+fbt::ksys_write:entry
+/stack(7).strsz != 0/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.ref_strsz.r b/test/unittest/funcs/stack/tst.ref_strsz.r
new file mode 100644
index 00000000..5811faf4
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_strsz.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry   Expecting 0, got                           0
+                ksys_write:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/tst.ref_strsz.d' matched 5 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/funcs/stack/tst.ref_type.d b/test/unittest/funcs/stack/tst.ref_type.d
new file mode 100644
index 00000000..38a6db03
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_type.d
@@ -0,0 +1,40 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'type' field of a kernel stack.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	trace("Expecting 0, got ");
+	trace(stack(7).type);
+}
+
+fbt::ksys_write:entry
+/stack(7).type == 0/
+{
+	exit(0);
+}
+
+fbt::ksys_write:entry
+/stack(7).type != 0/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/stack/tst.ref_type.r b/test/unittest/funcs/stack/tst.ref_type.r
new file mode 100644
index 00000000..f68b6ba5
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_type.r
@@ -0,0 +1,8 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+                ksys_write:entry   Expecting 0, got                           0
+                ksys_write:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/stack/tst.ref_type.d' matched 5 probes
+dtrace: allowing destructive actions
diff --git a/test/unittest/funcs/stack/tst.store.d b/test/unittest/funcs/stack/tst.store.d
new file mode 100644
index 00000000..cf31fc68
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.store.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: It is possible to store to members of dt_stack_t.
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	v = stack(5);
+	v.depth = 2;
+	printf("%k", v);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/err.corrupted-data.d b/test/unittest/funcs/ustack/err.corrupted-data.d
new file mode 100644
index 00000000..c4525aaf
--- /dev/null
+++ b/test/unittest/funcs/ustack/err.corrupted-data.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Corrupted stack data does not cause a crash.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	v = ustack(5);
+	v.depth = 0x7fffffff;
+	printf("%k", v);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/err.corrupted-data.r b/test/unittest/funcs/ustack/err.corrupted-data.r
new file mode 100644
index 00000000..8ad0244f
--- /dev/null
+++ b/test/unittest/funcs/ustack/err.corrupted-data.r
@@ -0,0 +1,4 @@
+                   FUNCTION:NAME
+                  myfunc_z:entry -- @@stderr --
+dtrace: script 'test/unittest/funcs/ustack/err.corrupted-data.d' matched 2 probes
+dtrace: processing aborted: Data record has incorrect size
diff --git a/test/unittest/funcs/ustack/err.store-to-stack.d b/test/unittest/funcs/ustack/err.store-to-stack.d
new file mode 100644
index 00000000..106c0cd9
--- /dev/null
+++ b/test/unittest/funcs/ustack/err.store-to-stack.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Assigning a member in ustack() is not allowed.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	ustack(5).depth = 2;
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/err.store-to-stack.r b/test/unittest/funcs/ustack/err.store-to-stack.r
new file mode 100644
index 00000000..3a0aeba5
--- /dev/null
+++ b/test/unittest/funcs/ustack/err.store-to-stack.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/funcs/ustack/err.store-to-stack.d: line 16: operator = requires modifiable lvalue as an operand
diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.d b/test/unittest/funcs/ustack/tst.asgn_dvar.d
new file mode 100644
index 00000000..da9e61ff
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_dvar.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of ustack() to a dynamic variable (assoc element).
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	assoc["a"] = ustack(5);
+	printf("%k", assoc["a"]);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
new file mode 100755
index 00000000..f2b99b67
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
@@ -0,0 +1,35 @@
+#!/usr/bin/gawk -f
+
+/ksys_write/ {
+    # check probe
+    if ( $1 != "ksys_write:entry" ) {
+        print "ERROR: expected fun:prb = ksys_write:entry";
+        exit 1;
+    }
+
+    # check stack(3)
+    getline;
+    if (index($1, "`ksys_write+0x") == 0 &&
+        match($1, "`ksys_write$") == 0) {
+        print "ERROR: expected leaf frame to be ksys_write";
+        exit 1;
+    }
+    getline;
+    if (NF == 0) {
+        print "ERROR: missing second frame";
+        exit 1;
+    }
+    getline;
+    if (NF == 0) {
+        print "ERROR: missing third frame";
+        exit 1;
+    }
+    getline;
+    if (NF > 0) {
+        print "ERROR: expected stack(3) to have only three frames";
+        exit 1;
+    }
+
+    print "success";
+    exit(0);
+}
diff --git a/test/unittest/funcs/ustack/tst.asgn_gvar.d b/test/unittest/funcs/ustack/tst.asgn_gvar.d
new file mode 100644
index 00000000..02f53dfb
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_gvar.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of ustack() to a global variable.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	v = ustack(5);
+	printf("%k", v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.asgn_gvar.r.p b/test/unittest/funcs/ustack/tst.asgn_gvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_gvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/ustack/tst.asgn_lvar.d b/test/unittest/funcs/ustack/tst.asgn_lvar.d
new file mode 100644
index 00000000..24acde52
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_lvar.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of ustack() to a local variable.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	this->v = ustack(5);
+	printf("%k", this->v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.asgn_lvar.r.p b/test/unittest/funcs/ustack/tst.asgn_lvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_lvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/ustack/tst.asgn_tvar.d b/test/unittest/funcs/ustack/tst.asgn_tvar.d
new file mode 100644
index 00000000..7a5034b5
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_tvar.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test assignment of ustack() to a TLS variable.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	self->v = ustack(5);
+	printf("%k", self->v);
+
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.asgn_tvar.r.p b/test/unittest/funcs/ustack/tst.asgn_tvar.r.p
new file mode 120000
index 00000000..2ca41971
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.asgn_tvar.r.p
@@ -0,0 +1 @@
+tst.asgn_dvar.r.p
\ No newline at end of file
diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.d b/test/unittest/funcs/ustack/tst.ref_addrs.d
new file mode 100644
index 00000000..57b99efd
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_addrs.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'addrs' array of a userspace stack.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	trace("Expecting vmlinux`ksys_write, got ");
+	ufunc(ustack(7).addrs[0]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.r b/test/unittest/funcs/ustack/tst.ref_addrs.r
new file mode 100644
index 00000000..c9876067
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_addrs.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                  myfunc_z:entry   Expecting vmlinux`ksys_write, got   ustack-tst-basic`myfunc_z                         
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/ustack/tst.ref_addrs.d' matched 2 probes
diff --git a/test/unittest/funcs/ustack/tst.ref_depth.d b/test/unittest/funcs/ustack/tst.ref_depth.d
new file mode 100644
index 00000000..d847736a
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_depth.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'depth' field of a userspace stack.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	trace("Expecting 7, got ");
+	trace(ustack(7).depth);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).depth == 7/
+{
+	exit(0);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).depth != 7/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.ref_depth.r b/test/unittest/funcs/ustack/tst.ref_depth.r
new file mode 100644
index 00000000..de6bf067
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_depth.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                  myfunc_z:entry   Expecting 7, got                           7
+                  myfunc_z:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/ustack/tst.ref_depth.d' matched 4 probes
diff --git a/test/unittest/funcs/ustack/tst.ref_pid.d b/test/unittest/funcs/ustack/tst.ref_pid.d
new file mode 100644
index 00000000..6ed62f12
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_pid.d
@@ -0,0 +1,37 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'pid' field of s userspace stack.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	trace("Expecting ");
+	trace($target);
+	trace(", got ");
+	trace(ustack(7).pid);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).pid == $target/
+{
+	exit(0);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).pid != $target/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.d b/test/unittest/funcs/ustack/tst.ref_strsz.d
new file mode 100644
index 00000000..b78a00c0
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_strsz.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'strsz' field of s userspace stack.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	trace("Expecting 42, got ");
+	trace(ustack(7, 42).strsz);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7, 42).strsz == 42/
+{
+	exit(0);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7, 42).strsz != 42/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.r b/test/unittest/funcs/ustack/tst.ref_strsz.r
new file mode 100644
index 00000000..840f7e21
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_strsz.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                  myfunc_z:entry   Expecting 42, got                         42
+                  myfunc_z:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/ustack/tst.ref_strsz.d' matched 4 probes
diff --git a/test/unittest/funcs/ustack/tst.ref_type.d b/test/unittest/funcs/ustack/tst.ref_type.d
new file mode 100644
index 00000000..77f815a4
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_type.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test accessing the 'type' field of a userspace stack.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	trace("Expecting 1, got ");
+	trace(ustack(7).type);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).type == 1/
+{
+	exit(0);
+}
+
+pid$target:a.out:myfunc_z:entry
+/ustack(7).type != 0/
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/ustack/tst.ref_type.r b/test/unittest/funcs/ustack/tst.ref_type.r
new file mode 100644
index 00000000..61075e25
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.ref_type.r
@@ -0,0 +1,6 @@
+                   FUNCTION:NAME
+                  myfunc_z:entry   Expecting 1, got                           1
+                  myfunc_z:entry 
+
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/ustack/tst.ref_type.d' matched 4 probes
diff --git a/test/unittest/funcs/ustack/tst.store.d b/test/unittest/funcs/ustack/tst.store.d
new file mode 100644
index 00000000..6a9f7c94
--- /dev/null
+++ b/test/unittest/funcs/ustack/tst.store.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: It is possible to store to members of dt_stack_t.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+pid$target:a.out:myfunc_z:entry
+{
+	v = ustack(5);
+	v.depth = 2;
+	printf("%k", v);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/printf/tst.stack.d b/test/unittest/printf/tst.stack.d
new file mode 100644
index 00000000..db943c29
--- /dev/null
+++ b/test/unittest/printf/tst.stack.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test printf with %k and a stack argument.
+ *
+ * SECTION: Output Formatting/printf()
+ */
+
+#pragma D option destructive
+
+BEGIN
+{
+	system("echo write something > /dev/null");
+}
+
+fbt::ksys_write:entry
+{
+	printf("%k", stack(1));
+	printf("%k", stack(2));
+	printf("%k", stack(3));
+	printf("%k", stack());
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/printf/tst.stack.r b/test/unittest/printf/tst.stack.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/printf/tst.stack.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/printf/tst.stack.r.p b/test/unittest/printf/tst.stack.r.p
new file mode 100755
index 00000000..895f96f5
--- /dev/null
+++ b/test/unittest/printf/tst.stack.r.p
@@ -0,0 +1,75 @@
+#!/usr/bin/gawk -f
+
+/ksys_write/ {
+    # check probe
+    if ( $1 != "ksys_write:entry" ) {
+        print "ERROR: expected fun:prb = ksys_write:entry";
+        exit 1;
+    }
+
+    # check stack(1)
+    getline;
+    if (index($1, "`ksys_write+0x") == 0 &&
+        match($1, "`ksys_write$") == 0) {
+        print "ERROR: expected leaf frame to be ksys_write";
+        exit 1;
+    }
+    FRAME1 = $1;
+    getline;
+    if (NF > 0) {
+        print "ERROR: expected stack(1) to have only one frame";
+        exit 1;
+    }
+
+    # check stack(2)
+    getline;
+    if ($1 != FRAME1) {
+        print "ERROR: stack(2) leaf frame looks wrong";
+        exit 1;
+    }
+    getline;
+    FRAME2 = $1;
+    getline;
+    if (NF > 0) {
+        print "ERROR: expected stack(2) to have only two frames";
+        exit 1;
+    }
+
+    # check stack(3)
+    getline;
+    if ($1 != FRAME1) {
+        print "ERROR: stack(3) leaf frame looks wrong";
+        exit 1;
+    }
+    getline;
+    if ($1 != FRAME2) {
+        print "ERROR: stack(3) frame2 looks wrong";
+        exit 1;
+    }
+    getline;
+    FRAME3 = $1;
+    getline;
+    if (NF > 0) {
+        print "ERROR: expected stack(3) to have only three frames";
+        exit 1;
+    }
+
+    # check stack()
+    getline;
+    if ($1 != FRAME1) {
+        print "ERROR: stack() leaf frame looks wrong";
+        exit 1;
+    }
+    getline;
+    if ($1 != FRAME2) {
+        print "ERROR: stack() frame2 looks wrong";
+        exit 1;
+    }
+    getline;
+    if ($1 != FRAME3) {
+        print "ERROR: stack() frame3 looks wrong";
+        exit 1;
+    }
+    print "success";
+    exit(0);
+}
diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/printf/tst.ustack25_pid.d
new file mode 100644
index 00000000..9ae3a7b8
--- /dev/null
+++ b/test/unittest/printf/tst.ustack25_pid.d
@@ -0,0 +1,21 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: ustack-tst-basic */
+
+#pragma D option quiet
+
+pid$target:a.out:myfunc_z:entry
+{
+	printf("%k", ustack(25));
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/printf/tst.ustack25_pid.r b/test/unittest/printf/tst.ustack25_pid.r
new file mode 100644
index 00000000..e7732fb8
--- /dev/null
+++ b/test/unittest/printf/tst.ustack25_pid.r
@@ -0,0 +1,28 @@
+
+              ustack-tst-basic`myfunc_z
+              ustack-tst-basic`myfunc_y+{ptr}
+              ustack-tst-basic`myfunc_x+{ptr}
+              ustack-tst-basic`myfunc_w+{ptr}
+              ustack-tst-basic`myfunc_v+{ptr}
+              ustack-tst-basic`myfunc_u+{ptr}
+              ustack-tst-basic`myfunc_t+{ptr}
+              ustack-tst-basic`myfunc_s+{ptr}
+              ustack-tst-basic`myfunc_r+{ptr}
+              ustack-tst-basic`myfunc_q+{ptr}
+              ustack-tst-basic`myfunc_p+{ptr}
+              ustack-tst-basic`myfunc_o+{ptr}
+              ustack-tst-basic`myfunc_n+{ptr}
+              ustack-tst-basic`myfunc_m+{ptr}
+              ustack-tst-basic`myfunc_l+{ptr}
+              ustack-tst-basic`myfunc_k+{ptr}
+              ustack-tst-basic`myfunc_j+{ptr}
+              ustack-tst-basic`myfunc_i+{ptr}
+              ustack-tst-basic`myfunc_h+{ptr}
+              ustack-tst-basic`myfunc_g+{ptr}
+              ustack-tst-basic`myfunc_f+{ptr}
+              ustack-tst-basic`myfunc_e+{ptr}
+              ustack-tst-basic`myfunc_d+{ptr}
+              ustack-tst-basic`myfunc_c+{ptr}
+              ustack-tst-basic`myfunc_b+{ptr}
+              ustack-tst-basic`myfunc_a+{ptr}
+
diff --git a/test/unittest/printf/tst.ustack25_pid.r.p b/test/unittest/printf/tst.ustack25_pid.r.p
new file mode 100755
index 00000000..c0110e00
--- /dev/null
+++ b/test/unittest/printf/tst.ustack25_pid.r.p
@@ -0,0 +1,37 @@
+#!/bin/bash
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
+missing_caller=1
+if [ $(uname -m) == "x86_64" ]; then
+        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+        if [ $MAJOR -ge 6 ]; then
+                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
+                        missing_caller=0
+                fi
+        fi
+fi
+
+if [ $missing_caller -eq 1 ]; then
+        # Add the missing caller function after the current function.
+        awk '{ print }
+             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'
+else
+        # The .r results file has an extra frame at the end in case
+        # the caller frame is missing and the 25-frame limit goes
+        # "too far."  If the caller is not missing, fake that extra frame.
+        awk '{ print }
+             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'
+fi
-- 
2.43.5

