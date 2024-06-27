Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C61C6B7
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466795; cv=fail; b=JK46wXPz3Z7Mk5HTBpn5YohqWOHWY95L3saFjv+GYXxsLuMjSyGK5fN5OCOqqglU3ZSoBX5nmn3UFHHtEfaIP6hY8WHp1Vrtvw5OOUbWMda9usUsef+L455H/GXLYOd4s4JaKc8hGFuTrKlN4/yh+OS7IRDZiSv/bFXlu4OSpnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466795; c=relaxed/simple;
	bh=dchxMP6jgwjLaNGTBIh7AvOe7qjiRr8gCrrpfL7mLUU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VGNIzyNvIj1Za1Wlo3ZHmc+ZkGRzgg6SwVO40yuG4QbBdGRn9sqs/u5HrthTclG9v3qEHjZp+CAYs3ryRCNAKWT+TSWFs0AHnrUxre2SiBehsO/1QTuCiWiRpUZtkfhE2MlfhMvmmW407o5S0le/0K3r43tN5bCQ5hFV0X9o/OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hnea954j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ndCktCUV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hnea954j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ndCktCUV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMW5u030890
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=7/6yOMmqfh4BBo
	s3oRjaQLTAdaEQTmZ2TqyMv86+wVA=; b=Hnea954j2CQRQYTTOs4XgAoBjK1gHH
	cw0Xe6JRB5fBQQ9JkBFiV6/1MiGpRTveue6W0z8/flyeOckJ9qDRuxRBQGOV5HFU
	Ff5gkecO0c0Vc5Ivr/sN3AP65ejMcn4pstXmclnlBw8fY5X7DUKDJEaxP8Q51cNS
	PsB2DO6TIvJJ1xrHiD7InAGaRhSGIvBwueoWvPfiWBF/IMhdOYK+VwLMrZfgKz6r
	L7dnbxXBLcSRFax4AlwiqI27IuOTzBo+zDz6gTMnWyrW7jDJ1z3Y2aFHSW5us8Ih
	qOqoPRxHrOf3U2fVPZk4cUigtUBQj3hSOYL5b4VrE4G9uqej7+1zrCvg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5GWLk037097
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afhsn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp3FLTRrvp9dpCT/eycRZSdEliKtewaqTW+BsihBI+F3kZ67ScmG3MXCH6GXPR/n/D7RORfxuJ0XMqixJw6onZCaouNq47oRKakSqvlKx5zYbffgb6xU8htwqn/5lWbDnn9JuymWaiLTM3dk8L9cgid2xAa0P27fVoAnWGZUxmGwPZANxVBMGDslw8Cgp7EX391x6hjtvyrI6k53iKopSCHTpqE7LNf6veiy0R/vDBGQlkxKVmgiFzlwvO1jVFfPc+XNhm+pla8vKetKohwilzLIY5tY9yHoakPj2wI7OE2V2xMtHQkCveC3ie/eJqR0aYDfzPR7bMk/TK/HapMRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/6yOMmqfh4BBos3oRjaQLTAdaEQTmZ2TqyMv86+wVA=;
 b=dI8vx1pux5403MWPmcQiRwa5Ex8yCsPCA60Iktu3g1Q6341skRg9rZSKBtPuM0w0aS0bBB6/8IciM5EioqvmOq9NTPl2E4lSSTP4JC1ah61TLgJ7JR1iXCDaBj+v+Rwod9QmR1uH4wXZ4LyNOeS8Sh3yZ1zyMnfUn3s3zlcJNmUmHuKGM5fw0iya0GVi4O0fgcDbDzK7deh5RaovxLp37WycdmEoSXyI6TNcEjWsC1kOxqjbF4/mSEo5Y063kqJc6lP1cG3LgZIpMXtL2mJGuWPf6lyXbmsPUd53WPPKN+Nd2x7Qals9Cu5nQmj2/f/zwFZNr7KbV9Y51y03Ik+SUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/6yOMmqfh4BBos3oRjaQLTAdaEQTmZ2TqyMv86+wVA=;
 b=ndCktCUVu586PPfHNh1tO18RBqBgOlSDSQ0aMAEj7Civ746XjjNFA6N/M0h4F4P741HwhnGspB2PEDIyr6PcaPcq65fPpl1+SuFfYvVZyve9rKxkusscyXJCpu+Edh1d+5R8Uvs+g7wWaMSW3nQOkVw/i0kWevG+rT9gOo3s7SM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:50 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 37/38] Fix some dctx->mst->specsize comments
Date: Thu, 27 Jun 2024 01:39:03 -0400
Message-Id: <20240627053904.21996-18-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: a815697c-b0ce-4604-77b2-08dc966b9036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OwlLJyI+vqQwQDkMFt1tNvJU7vc3UoFyZfBXdDpEFuhup2XFTlv8fmvCdDJd?=
 =?us-ascii?Q?6aBjoPBc0YIy7O5oOhW2ku1xjobDn2S5sBsq6nXSPgbExzKlZ/+57UPnx7yU?=
 =?us-ascii?Q?/+cjgk3zzUWhawkxmoWDQs4uOOna+MCoduZXdElUXVVoUvupdeo0k3EMq6ul?=
 =?us-ascii?Q?1jR18NwVqdFhMKgUuDfDNJsXPebCfv4MpJTSmo9I5ZqkTkYgEw6Am2Pw23Jf?=
 =?us-ascii?Q?fA2DXWgVQodfyQfYFapY1EZFaS57DiP+Wp5RVUOXHMA+DFDZIwe/G1FEQi7E?=
 =?us-ascii?Q?agU3IrikugP5fdQeGDheqsL+vim98qX8I0UJcFsvRCGjSwXPD9XdRCl+vxgC?=
 =?us-ascii?Q?Zpx3R/CI8ixLVV68hEmKRF9GWa1DK6xZ6zZgvCXKDLu5JSjIb61CO7iahM7v?=
 =?us-ascii?Q?QrD2FsAFoQvc5LgvgCYkwSpk1SLgMSDkbprH29J2HwpaLqCe/MPfGVaUd+Jm?=
 =?us-ascii?Q?jL9ar7tPiurP4hjvTTrSJiIazDyL0KVD9cifE7Z7BAXhv8MG706GmouIsXXt?=
 =?us-ascii?Q?ia1WAtSXvSDWfM567/CvgmkIHdiU4SdKViQRrQQYKCKeY14aM1XPqBAx7yox?=
 =?us-ascii?Q?312/ChSialGZDCJEg5/8zs7TQNWrcSdUyzAs9UTfKQaSySxn9sNkf2RybIHj?=
 =?us-ascii?Q?BjJ2XuMJpNFEB4rWo/CGNb1tGTljVst9DZdkwPb5sLxVESPhhB4MNoHsMxWX?=
 =?us-ascii?Q?tBzUTsZw8ljjikCs6bPWl8JF356um3SAEb3UgfRV7923GdHFJlkDkHuAyhtt?=
 =?us-ascii?Q?mwu3K5gMIHU/7e33NsjP+OtvES7orEon+hwto8BDJOCVQ32KCFVGEJ1cC+Bq?=
 =?us-ascii?Q?9TkQ8F7hHyQrKhTgeOGOo2ynYZuNp2xYmVUMsly2xz82U+7UbGVMgrdQ9QqJ?=
 =?us-ascii?Q?g8ZZD5EVsewZiKqCvc43ji+R7mIlOLoeTH3n64HLcPEe+xDt1oata+k54ZCB?=
 =?us-ascii?Q?QciBp9ID1ZmyTJYEytgBIWGR2SotRSqca8sGRbkcfmwmXYNwfYnLD6YaUwf0?=
 =?us-ascii?Q?0qIc+wubXZv+78+2CgMH64+QjGZkuw3/NXH/pZdlmyHVvVc5h0TQo+G/9u9W?=
 =?us-ascii?Q?vQL8i/2E91peWHveOcKqWP5naf0aZWEiG9k9JPqKuQFKn4lmuY0P4gpoMxWN?=
 =?us-ascii?Q?TkAkeAZnmdbiDwRaRI4lF9uzeXVkKTw9QPnDJc9NjsiF6gmpgJWn2ubZlbvn?=
 =?us-ascii?Q?z/i+aI2IFFDokA7zHAgKBd7wLOKXlWvx/7+yHk8rxgama8yzmp3vcTcgJCab?=
 =?us-ascii?Q?AaemMZ/Mxx/wkgANhNe5xC0u70eu8U0+UUx/ywJiCvz9v/YTKnKa+TGUUB0U?=
 =?us-ascii?Q?tITf3YlcM6ad5k0fCN7HwHvrLhgQei+ceBdKEKrdKGkp3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s8HwE6lrJNnG1QsWhul15s9lAqp0rP/LrHsSUc5RP1SgCV2Pd8yejLMMcCDm?=
 =?us-ascii?Q?LtVQHssMSnFLmjn/E3rz/2OpHFhBnCtM3SsT5/UDKSv4w9kneFJoeeksCzei?=
 =?us-ascii?Q?3WRJZ8p1B0wIGrJ7oD+cUw68QQnbvdWfJ3mLtJ8FMz/uQtkE2XutLGlRCLq7?=
 =?us-ascii?Q?HGQaS+NmcWtzrtrPdsQHLmV937T1ru1NAFbS4o/4QSPaHY27Euzm3PCl7sys?=
 =?us-ascii?Q?8JUYSwR/uMaJZYuMFfQwlFMkUFwTCeJWkYtA6GgheCoDgyjhzkF4oj83Sf1D?=
 =?us-ascii?Q?Uvyu4W4cLm/Razha8xAI3O6/Doy3RTnxiKkPXLJih/Dv688bUc81DfFujIjq?=
 =?us-ascii?Q?WO2dSnHwpge3lWIL4i0xoZBgLB3eyuCo5CSD2BL3U5+uXGdfz+Jif4FwEE01?=
 =?us-ascii?Q?OGlbhMiZLk/rEgQGz5oOYudWVnH+H08wZ2kDAM6AMmCeVmi9xBig99JdKdLl?=
 =?us-ascii?Q?eWqZ7IHPn1Nc0ZBLaVI6TRCb+75EasOuOSMCdPhGvliSeezK6KYyEEEEH5tq?=
 =?us-ascii?Q?5J4eppSaJKqD0jDliduvAnO6u3z++h5CVLkdkYgp83cCos1ji+zNB0c/Bw2j?=
 =?us-ascii?Q?dUU5lRb+PiGZ3nFPeGhKMoLyjUy40nkhxq3gqcXyi2nwrw09atji7m4FUoAb?=
 =?us-ascii?Q?VMjnMDf8DNZC8usfgRiJs02liC2+VfQT80UpU5/m7Oi8XVEvCR0Y6VZNGqB6?=
 =?us-ascii?Q?BCXAWHIQUv3aYue1+IM6s5t1EG/2Ziz74PBdgI62i2NORvjmP22IsnXCTCgh?=
 =?us-ascii?Q?yifIzApl9fBJLy2aHPasCSZPuq9S+Ya4jvK9GtI1HTfHZ4Vv3MYUgSCz6LOJ?=
 =?us-ascii?Q?nO54iHZ5/PKOO05OMruIN0PrTpdFVHsamZUk2ffNBP4VzsbBoH/8J6oU2DFm?=
 =?us-ascii?Q?pNO8/8KQXLdXai9nvXFRUMspjCuvLuNWSY81Gjh9UsQ/AA5azhJDuUD79ZNw?=
 =?us-ascii?Q?8YBNI9PhKDLLp797EqrlPtHMkLKHlRIk3XLYWzVwj5yl8SUbdsso8t5PbPhO?=
 =?us-ascii?Q?uR9KZcwKZIb+/Wf+GcUJeNtWgSGeEzaOIyxYxdqJhLTb9VUMJu9LI8fbvw+n?=
 =?us-ascii?Q?iA0TU6QeM7Az3T718UhzRBORNL4/X73EeVAGCTM52tqjhf2Ju5rK1pEjEtBF?=
 =?us-ascii?Q?emYYm5j7wOFJUCDxdURSG5uGHfTPN+tPBDX7yhrBO3LXoYzSyLU92LsruPxj?=
 =?us-ascii?Q?qtQQQI4WUQAv8chFLEnQjJ+JvT0P9+l7cHD8Z4T6P5EyHD83YF3pOCr27PGh?=
 =?us-ascii?Q?zZZRlzUVgVu7AynSweRxttSSp+F47cNMFdUwQrIPbOff7Q7fvuX4pZ/2FGJ5?=
 =?us-ascii?Q?op4hdbWMSf7a3ipgYjJB7DIw00G3PUpAXsBpio5v4KN+ZZgUK8G6HwBB3hQi?=
 =?us-ascii?Q?Clrr2V9ggoFkr57CkgANELcEa4RDX1fL2VxMv7otAmopDJusMkjEFadKJaE8?=
 =?us-ascii?Q?zqkmc1MTgHfKgfKMsl4orCrO+Khfc04Uzy3nnI7bPkQtrDVaAbWo4cEpRD7z?=
 =?us-ascii?Q?9mI+gIh7OY/Blg57T9KUFVxOeQ0KC36L/PU7u3+HwQvQOx0oTyKrOooCtEcN?=
 =?us-ascii?Q?pFw/fI2K2ghxfVuEpvweHxSROJVhjYDA52C6Q7L7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cE6ak5DJM2sHU4JAYfQltrH6VrJAdoj8HHFQjWn77HWojfjosu56SPi7VenTTGyoVVWY+h5ZeiT0rccyeyFKdA/XvJPxYrDxItpBeecdpzITSQBZJKSoyCxFIl24tJiYChqMwFdbuBAQZL7CE/gin76NJGMoiZtmGqcyBG3hi1MeQ5wbsNiy06oMsFzNRED0Y5vm2tlq60Rg2ImOjOhfLbo835Xw/S7Mn9NRTWlzHPR58cYy3EofMpskI70TfaHioIp5x26TiWnTMyTp2PEV1L/bSDPds+cNb/uuxpU8zIB7iFxvOIdpVJkfvalLlObMWAYMjVHMidB8fROPVFeny98nRgcjjfo+glW4PvFQ4wfyv2I8QFEU4qfUnfD0nErV699ZKCY4oBtY4X6lDY2DmvQxaWmUql4j4lTYrkiicMGGbBN0jKmDuKU2uCWbP3DcK1o3x0dZjKlyBH441hS1T9K9UAZUeeyfp5IJ0iM6RuzF3lpl/aTfMAnmlbX6XZEki4igzk0kQxbFrn/hbXT9EUx4nhDLsTWYUVLSBNej28ARWtPmYWHBl8GY45r0vXRgBSwCqLafzU3XWfYnTSZK4cgCXgMETe2LjOdMDYDY53Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a815697c-b0ce-4604-77b2-08dc966b9036
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:50.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/SifLcGgdmKK/D4oEWWde4K4x501WNQHdQnEO1DbfdvtxcwV2zv5UyrmhIxXYa/bL2pHZHBBTiNdsdVq6BQ1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: Gp_dj_H9toNe3981XA0Gq8GA5a60560i
X-Proofpoint-ORIG-GUID: Gp_dj_H9toNe3981XA0Gq8GA5a60560i

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index d27a8cb2..1548d58f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1739,7 +1739,7 @@ ok:
 
 		/*
 		 * if (*((uint32_t *)&buf[DBUF_SPECID]) != 0) {
-		 *     if (dctx->dmst->specsize + off + size >
+		 *     if (dctx->mst->specsize + off + size >
 		 *	   dtp->dt_options[DTRACEOPT_SPECSIZE]) {
 		 *	   state[DT_STATE_SPEC_DROPS]++;
 		 *
@@ -2461,7 +2461,7 @@ dt_cg_act_setopt(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
  * back pending a commit() or discard() for the speculation with the given id.
  *
  * Updates the specid in the output buffer header, rather than emitting a new
- * record into it.  The dctx->dmst->specsize value is initialized with the size
+ * record into it.  The dctx->mst->specsize value is initialized with the size
  * of the data thus far recorded for this speculation.
  */
 static void
@@ -2491,7 +2491,7 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
 	 *		goto exit;
 	 *	*((uint32_t *)&buf[DBUF_SPECID]) = specid;
 	 *				// mov [%r9 + DBUF_SPECID], %dn_reg
-	 *	dctx->dmst->specsize = spec->size;
+	 *	dctx->mst->specsize = spec->size;
 	 *	exit:			// nop
 	 */
 
-- 
2.18.4

