Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D143F20EC
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281345; cv=fail; b=iIIn9OTXlpdknWHzDalG2q63OermLSM3tXzrHKlTkjkn5JnXlnoai0bC1wqjIvRFfqYysaHXI923kPHl1vu9eZntb+tKrSwRC9tWScjP4FOiovMx9EqMJpVAshGNCHA88OMs25MCjIX+0P64ndBd0z5lAIy9nfYL4R07QaPMTC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281345; c=relaxed/simple;
	bh=0GDW+5+1S9vgrR0hRCKE7InMGRi+wC4Gm21BA5Kf1Gg=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=cU44ML61fj2CaPy1ISI0FBHUFYodChC20V4J00Jz5pg0WUhhytMhKslB4BYCpyOnldn+jEIqUboRJrE7ttOaq7iOHZ0aBicVAkz56SIM9ENWCO6fymNu/zTXQeiHOXEjJ65lVBdeE3zkMZNAOM96wrieLd4Zd6UKbTnc2Eca7rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ww99HqxN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wKpC80Dy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ww99HqxN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wKpC80Dy"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7Nktv1153367
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ScNi5GUJ3fyZ3IJvZEfEzQXQB/l/R6XRGc2fb1ViJRk=; b=
	Ww99HqxNQ+KeZcfODl5uOa74Md84fN3T33PG5E4plu0Yh6UKW26keClcEsYux+yq
	z+IwSTRXwbc/rYGJmjnoTOlVvZkH+2Oo3Wt167l2rIqop7g+msZ1nvfwNJeZeUxn
	TgSPMBeky28gnoLCI8ukzu5d0b87F9CuQ9Ncz/Ekd7lVsXpTcy4Lc0Qf/YtZ+pFM
	uvYdGsqsaQwH33pwFIPeiWTgrhUB103dMyIz1vkBCl1h8bEGzbC40rOwYbzzg2S3
	EdBBeXNFKRcVfbAGneL1xphw968uQ0nTbM0opdi+mOShnQ5SJ5J0JngDcPV+wWJg
	zTZ6Ke7CwvNJJ6TEvs6Ejw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe76u7xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGD69C014463
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:19 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh0u2q04-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqilD/kmLKThM55CWNxrhkZsmXxjTixDJMcd4EAx5qmYCQUgZ5PwXLR/IZR1CBnSyCIUjBd2utLlRCeenNDofeUDp2iosgFQx2J7sGazchV/d7z+Qnai9QiIUFdb/T80botCvq5oQiSNiOdB9JFO26AO+1JW7ZJlCv6FoRZ4FJR/oLFVM+tpPrtc7liZ8ldDkTFrnfIpJ0tTI8SEnya0YcxWKstsJInoKLZmnu61zGM6TpDXLdXfudki1T8AGKTerQ7N5tIrhDSIIXIHkoLo8bdpyVA7orGs0iNd3wk8sDPAHS9+ril0rpwy7z1F+nKdhiTDvJBbqk8ALJYzBtIT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScNi5GUJ3fyZ3IJvZEfEzQXQB/l/R6XRGc2fb1ViJRk=;
 b=KbnNtHEhON1B/w9DV0MRCVND3djzKkWwFLHR+jyPeGTIXGO5hdcLrAYkOQyGETVCvsN0x43uyP8zjGjCq0ZGH+8x8zhfXu00lrVyU7tM2tWYrmgwANKnpaOxgtFa1ECkO9AZnAa8z2giHnb5RYDYI9o1gVV3+C8NzrgzWduJURyuWetMcFXDvqHg0Q1+AX85R1P/jjQ2D9T4FbgFwAMpTuEPkbyCU+tDLQ+JoA/bqLhfPYDkxFTozof182nAfryz3VtnWpcSQHp86SNDPe/uE8BDqHSWuMA+BMg8H4N0EYIBCwT/aW2kxQN5O/bIEfOoqffI0fQc823XTONw+uw7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScNi5GUJ3fyZ3IJvZEfEzQXQB/l/R6XRGc2fb1ViJRk=;
 b=wKpC80DyYRF2VoUcthZ4ryfIjvQs1NA/malKETr9dLPTT54MAG/AH2q4zVbfMA5VmozJQnr/hsYIFtFR0ZSG3ft8gAl8qqwnRxa+k3qyP+xmC/ro3mtNt4t98qCy6U73JgVYsH5Ukzu6OWQmuNZvENY272RsdN4pzigMvu5hs70=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:22:15 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:22:15 +0000
Date: Fri, 12 Jun 2026 16:22:12 +0000
Message-ID: <3d00e8f823076a7190b21c2167fac9ab@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] dtprobed: harden helper ioctl validation
Content-Type: text/plain
X-ClientProxiedBy: DS1PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:8:243::11) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: c99823fc-090e-4ab7-032d-08dec89ec440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	oQq/h8CSlqQtgErhLAjSUmuLg6BOb0kybVixSmhKDsU7OErYAdDxtHe4jpYbuLd6I7/y0swH+gffSjzSOnH9B6m+fBAZqkum4tcpUuQJZpcxx2PltCFkioJVmGgqXv07Wr/oy5Jqf1uTtCXPTTA8A/RyRega+x6jUOevJYShQcrCKiVjrt5XReO7SmgaStxedzk7jqGuWJsh3wSFQeKDAZA7PkXbp31WAFBP29AhlAyWux/CT2Nj27mmNoDpauvSQ7gbwz5kJV4sE8Sez5RxkHAxn4wG/eS2xZMGl79+7EX2/BCz/aIvTotf3AXHU70iYEAx39uRcMSaU7TMrjTuvU2rJJB0LaWPFFWxaAZO6EO86RDiAwPovpxGMPZDiG1sh8B0JTmMEaYfeY7X9aMGQhO/UoMm7cnpV+lSVyctZMaDSO1j2Ff7j2bktLw+zY8oHeS/sdhWviw0U6MImS3heoObdmjFnsFZcM4MYFJvFrOn+LHR1r5usTtBKUeKefnoDJystwbJr2iy50zTVPItQr3nFIc4qBM0LbuUZWxT1YLImbk011tCM9x64qfszD8qO5fABPnoar76Eu00jP1+odBn50HmHq0ZCh16gIelVTMKLnzHb2L6+4+B4pbeuSd1bfQjh01U9C14XSWXBjR+hIMSecDxYZLRiYpxJIXoxxMfVByIEy/qR2T5GEVUme92
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nkSQ3UCAjwqgYxFCiDCpLC/3WT+GRRccBEWJVvARDY65siCkMwO9kr7PysGm?=
 =?us-ascii?Q?xzgkWnB6zuec3Y3OeYuUd90nzE1qSz7b9YUYe1qYLD2ZY54iUMpX4TvacdtF?=
 =?us-ascii?Q?O4LuLl6NdwjLr/CrC9aH83xEnFGTGEhuX3e8qTecPEyoSCgPZw8wu8lnOEAX?=
 =?us-ascii?Q?6RBGxfVuW4cFpF7pEgg7wCXHHXvxRifqNsgXPaq4r5CzqkOvlmOjlcDhS2lZ?=
 =?us-ascii?Q?cTf8nYIvSE8e6QnkiPpJtIIQrVtqeujyer+K3oCFaPSXSH7eeRT0FYwktUr9?=
 =?us-ascii?Q?ivC1gQZLxcI8of3Zqraqv0GbOWNbFbMxi5FljkFEcdPumb44Cl//tZMcruL7?=
 =?us-ascii?Q?DyM1QbLykYOorfBv5pZ1d0SeSl0F4F1vdeigNm5m7CO/HyobVD30xpwHcMDs?=
 =?us-ascii?Q?PdeIaAwXtAexgjrDNYRhUULQ0Vug+DQX5sfuYpMRLGlhW8W58ri9XdBWIAlA?=
 =?us-ascii?Q?RT5odtJablaUy3AuXKluSigqg3IO33Par/TQRiua+xTC8jMoqnj1me6TsQOj?=
 =?us-ascii?Q?XY1QxE6NaQ2HEhIvqZ8wvZyKW7XXC6Osv9sX33xTNh0XTYvLoPyBfKrpP0Vs?=
 =?us-ascii?Q?4DF0LlI1VGMKSY5RDuQlJrBSAYHB6IO6ZcYgP/lnE1isjJHY0itAbvZ+2dPQ?=
 =?us-ascii?Q?xeP0iLiy8XbLKWFLL1zGoBjduJlvyhCtBfRsGmy32VYKlPrzKXWx2T0aNHEe?=
 =?us-ascii?Q?0NO5ARWuEstJ5wiAYBp/ydEHMzFVL71bXWaBq4vPg3ucXBEvNdEv9rNIj9Yb?=
 =?us-ascii?Q?o71PnEDnMbID8q4KzmzfXd2wVFcmOy/vCsByp668xDa+v7G8R1eTJ8ifYLq5?=
 =?us-ascii?Q?eMgm66RnYVLqk6ouSIFJZv16g67K9B/em+cSYBrsF8VHdSLi1QgptKy/jk/+?=
 =?us-ascii?Q?MR3nC8ruUG3MZiOOKDRCOk3vD81j1ygI1kMTAQm+9M2792HYf8G8uwxH2hHc?=
 =?us-ascii?Q?yZMY4q2LPlFF3pC9fKzY5aORYIOzf1D5c/sVCmBUkfU4mlKXtPmquWIarGod?=
 =?us-ascii?Q?ddejrfvOabdQkeh5RancrthZnA/xD45nWO+MxVBedPCw7cVNGG9T7C7p+CTk?=
 =?us-ascii?Q?TPFsV9mGGgfJzdHG0M1UeMNoAYsn/hGw6HQxrnoqO/rCLU1go7amr++EesXl?=
 =?us-ascii?Q?t0NQC54BYmsWRW40xx0IT8+rQYJdR1Apskmc0u9kBYfKAXoIBbqPTNq6I+Jn?=
 =?us-ascii?Q?jE18tDikTho89izdSLrvQdtXd3HqnKiBvms9/lZJFbBrpw2/rz6yQdI2Ln8f?=
 =?us-ascii?Q?VpieMkouloIzRM0lttBu4lT7MdIuo6h7wDnyL5tXXcMzswiWpJOVBAoUixaE?=
 =?us-ascii?Q?TO27ltUgY2xRYXfCGLH3KodFAPivbedPvDkQi4bvrgtaRXAEQSfhSBH9OsOa?=
 =?us-ascii?Q?m5jIrVOy1TJayhkIlekp7CnU50uSPa7Xh3xzNWg5BvYplW6Yn1aXD7xCvsri?=
 =?us-ascii?Q?V25gd/9y5P3rEvO199vw+bFfIWKTr7IN1fmtO68oKqvP5eWOTyRWAv/M9R9s?=
 =?us-ascii?Q?jdOo48OyRUWekr4Ftd1Rf09tFeZf7x0zKIotg0GQA+Y0bjFlZ2q4mzx0CbMj?=
 =?us-ascii?Q?rOnZnJH6kdb8EtP7aK/wG1fKV3+erL5xvUaP0upx+lAw/TluUCavEeplJCoh?=
 =?us-ascii?Q?v+QG9D42iRSq3Xq+6sklblzpHL/zkxtP646bz1rP/IkDivPNHOSk3l7GHll9?=
 =?us-ascii?Q?0K4TMbWcHdRDOVVeTPqYKiP9GVZseOR7Y81sGB+u25zz4DPM92gBLLYGvcIm?=
 =?us-ascii?Q?K+WNVrSojrQNTcDqHks2G42SyRjGtxY=3D?=
X-Exchange-RoutingPolicyChecked:
	PFshf7TJrpmNqFxhGAJR2KNNQHeh1auEUUT0OOpAuCXztTg40K/5dVEzEhjJPa5iYEm663HhsXfcDYJWiLtVLW+H5LEW0iWBXaZwfzOYpRskSrPriveEMEVEV41O/Y03ouqFiMTsmHjUEsH6iNmaM4kTO0o1j9zs3T9khCyVLP2eBti0XDh5X04RtxL35/FD0ZDntS5cF7WOhJAKx6OreYXmVU2XuCtdxVpLd+Ql5W0SpiGFHujpYYajyMrSPZxrUYGN2AVjkfpW0bN84TC3JXJo+9hkg1zLY5iXFnBJ3Sxs+yaAqpkH4kCRZNaaB9o1JQA+Ko4aEI+oLBmDL4b8EA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pWURWE/ePhynbU+dsu78Y4oyq5A1GH0mWt7YhBM+WcmkejH2f/c07/s0/1sz05dduaVCQ+Vop7f+odOplNsoJMFVnMJqD9sAq6oWtCzklrIK/QX47bAvlX/6LczjfQdms/yfwjHOMMJogt2EcQGt+KKIiGOlebTnOF5+2AOSH5ZqQOrkNbWwa2Y7UF8S/ImvcD7He6AWe2hiYwujDo/5Ob1GLrACaAEB7GhXqr7sFpOwAKMsGSm+QU3jBVMmyT8+fsBl2PsxyxXi5/i8ZqAqkA3hKjqjbRe3mw2bY7kVpXgjSSdB+tWml7iZPPMgdAEfrO1SUihHGOAvbSepefzMenN2b4om0nuaPv5Bd+sErqkqxbJNhtAU9GDfYcWUqMRjvFR7Q+PNGQrOKvKDsTH73zuAeXaW7bCnVahMUbK25LxxUGSz9MkvtoxjG7zohZy2423lX+SZG9J03XNF9k0XHSW8hvX7f7OQnZhk/TYGg+VLEOf97ua5OUzZpawhO9y5JOq4jDEVkB5mFYKvJRQJRF8goRf2UJveoEl661hfkY2al13EYWCyNcg917K1gYKOEhQkUfeUYAVgEo7dALCzCqAcRPUDAGsSCmbD3iTQy+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99823fc-090e-4ab7-032d-08dec89ec440
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:22:15.7073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTsSa+TzyQDLJ2FX2iyufnuYKV4JUPdE1SUde1B7hTu6k2u9RyyFTIfCBUt/vYvSaKQJHngvnXQctHVlm7+IG90S7rAoxPoyIrZoiUFsX2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120150
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfXzp7xLuVlU1xH
 mwKSRLPwPPD4H1pDzgKFlUVgiy0W6N5LFnvcW9eC/y1IcCcx2Yqd9Ru6GZEOCPyRgU1HsF1lxA/
 RjnwsUepiuvs2XMorODnGLlZL412ddBojK0/uiEnZMkr+22c/gkw
X-Proofpoint-GUID: HtFrWiy1v2ABrwdq2g1JUHw6diwZhnIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX/qSImmyn4Nyk
 qBNJ1Wk6zJpd+CrIYpMBQBro5GlKpLo+rkznCk8farRZ7tM+wrz0Y1huwIdHZaUsgz1MQBTgfPn
 EoGvFiZgfneGHmYdKWykoz/dBbhpXp74K4K/s6yhdsusb/YrbyHpPMIr04BNqK+SP0f5i/wmz2p
 rqYmo5PfZv82ukcHxsGmWL0XBqcD8HGaPlL6m6DyP1lByglGKxTtnX5WdGcSxIEkIU4btDVc8hZ
 dGyP/PkWZ1LMmbBCIkE2Ja7EGyMCKgSHRGBzQLC24AQiG1p9XCP3uVGj1CHpnWIq+1pWRT861Ec
 F84hp/hTTC+fcZNspsZHjco1pAGDo9CR8FCSHU866+fnC5aLpWENIjCyWB53f18NUtX/rfeXCh9
 4IudYw2rMain9mXhjrW+0lGdgkv+aXt6H/SKNyDV5RE9zORnlCEd4LyT+gvijN/CGyBzYbF/EU8
 Nd+C8YL8XGntOZk3LZA==
X-Proofpoint-ORIG-GUID: HtFrWiy1v2ABrwdq2g1JUHw6diwZhnIN
X-Authority-Analysis: v=2.4 cv=dtTrzVg4 c=1 sm=1 tr=0 ts=6a2c323b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=rZkm9kGGNdRJZiFjjp0A:9

Reject unterminated fixed-size module names and module names that would
be unsafe as pathname components before using helper data.  Reuse the same
component-safety predicate used when composing probe specs, and handle
userdata allocation failure before dereferencing it.

Orabug: 39374493
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 27 +++++++++++++++------------
 dtprobed/dof_stash.h |  2 ++
 dtprobed/dtprobed.c  | 22 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 4c7a95cd..891d7a69 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -230,6 +230,17 @@ make_provpid_name(const char *prov, pid_t pid)
 	return ret;
 }
 
+/*
+ * Ban "." and ".." as probe description components. Components are also not
+ * allowed to contain any '/' character.
+ */
+int
+is_component_unsafe(const char *s)
+{
+	return strcmp(s, ".") == 0 || strcmp(s, "..") == 0 ||
+	       strchr(s, '/') != NULL;
+}
+
 /*
  * Compose a full probespec's name from pieces.
  */
@@ -240,19 +251,11 @@ make_probespec_name(const char *prov, const char *mod, const char *fn,
 	char *ret;
 
 	/*
-	 * Ban "." and ".." as probe description components, as well as any
-	 * components with a '/' character.  Since the components are used in
-	 * the creation of paths that will be written to, any of these cases
-	 * can be unsafe.
+	 * Since probe description components are used in the creation of paths
+	 * that will be written to, make sure their content is safe.
 	 */
-	if (strcmp(prov, ".") == 0 || strcmp(prov, "..") == 0 ||
-	    strchr(prov, '/') != NULL ||
-	    strcmp(mod, ".") == 0 || strcmp(mod, "..") == 0 ||
-	    strchr(mod, '/') != NULL ||
-	    strcmp(fn, ".") == 0 || strcmp(fn, "..") == 0 ||
-	    strchr(fn, '/') != NULL ||
-	    strcmp(prb, ".") == 0 || strcmp(prb, "..") == 0 ||
-	    strchr(prb, '/') != NULL)
+	if (is_component_unsafe(prov) || is_component_unsafe(mod) ||
+	    is_component_unsafe(fn) || is_component_unsafe(prb))
 		return NULL;
 
 	if (asprintf(&ret, "%s:%s:%s:%s", prov, mod, fn, prb) < 0) {
diff --git a/dtprobed/dof_stash.h b/dtprobed/dof_stash.h
index 32b5eb52..e72671af 100644
--- a/dtprobed/dof_stash.h
+++ b/dtprobed/dof_stash.h
@@ -21,6 +21,8 @@ typedef struct dof_parsed_list {
 
 int dof_stash_init(const char *statedir);
 
+int is_component_unsafe(const char *s);
+
 int dof_stash_push_parsed(dt_list_t *accum, dof_parsed_t *parsed);
 int dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum);
 void dof_stash_free(dt_list_t *accum);
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 9ce941ee..c85a6617 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -668,6 +668,16 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 	int gen;
 	usdt_data_t data;
 
+	/* If userdata == NULL, we were not able to allocate memory for it. */
+	if (userdata == NULL) {
+		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
+				 "out of memory allocating userdata\n");
+		if (fuse_reply_err(req, ENOMEM) < 0)
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: %s\n", pid,
+				 "cannot send error to ioctl caller\n");
+		return;
+	}
+
 	/*
 	 * We can just ignore FUSE_IOCTL_COMPAT: the 32-bit and 64-bit versions
 	 * of the DOF structures are intentionally identical.
@@ -729,7 +739,19 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
 				 errmsg, sizeof(dof_helper_t), in_bufsz);
 			goto fuse_err;
 		}
+
 		memcpy(&userdata->dh, in_buf, sizeof(dof_helper_t));
+		if (memchr(userdata->dh.dofhp_mod, 0, DTRACE_MODNAMELEN) == NULL) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
+				 "unterminated module name\n", pid);
+			goto fuse_err;
+		}
+		if (is_component_unsafe(userdata->dh.dofhp_mod)) {
+			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: "
+				 "unsafe characters in module name %s\n",
+				 pid, userdata->dh.dofhp_mod);
+			goto fuse_err;
+		}
 
 		in.iov_base = (void *) userdata->dh.dofhp_dof;
 		in.iov_len = sizeof(dof_hdr_t);
-- 
2.47.3

