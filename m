Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA55C35771D
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483894; cv=fail; b=FjFbfGvQ77HtJcH7RrTsTN5upqlDnyKttOQJDI60KSobQ3g/SibY7ZGxpdWBWinZUYP68liwvB6VjU5iE+uWeWcF1QNMuMQxL9DY8v6NfPUM/E+0D59r56mnH5evAd/n5Z47yuKsRLqKrrKzPIaGDkFggbSKnfRnzPyAFDNdS2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483894; c=relaxed/simple;
	bh=DCL+rxoOJagzALHKmYwuAD1CTZMxu5CuKaxgsYep2Ok=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Y9dfTwlt6AgFNUzjrNnG7vT2lR+DKTn18f960AmOrfrGfsRp2lUU/eY62h7qlVi1NZPVIrNSKsgbxY6vNo4UUTN3vY2MU0dqNhIhvnZQBwyc+AKRtJFxGyXXQXAnwifxHim+yQJdZA8s2/FbchtGiDiAbwhdJh19S2NyCF8PPp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DuOd9uX6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=veKjeHsA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DuOd9uX6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="veKjeHsA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDRocX019598
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=lR66+97grMPLgec5CV7rBf6xHdibX+GG2vYJXXYjAFY=; b=
	DuOd9uX6XO0hDbjPs2v/J2NbrGM6KVYHqbGT0NYlGXTXJ4QJ5i+C8Up+z2AMs+dk
	YWaLIJeU4N7+1hcak9rFeQ15J7doiu+iUta77FKsgU/ocHC9PmPKPEjeGyMBHM4i
	HbgjmGSYm1CvW+XADhb5AWbqCOKy/ksy4HS4DCveGwyP/BtkzOti07UiFXfeT6Uu
	O2pwGcJf/RjIq3AI2yUEDP48JYFEacVlvBkHCDNnJEKiz3zyx2adso/8PVCRb7dS
	nHzzB4hSch5nREjl2yGAPLL5Aam9xJPlueFoH1oud81I6R2SYBFIKoEHFVQicvhV
	t/YmoP4p1HTMClRNQCA3Uw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbun4tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIFXDSq039958
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykpgqx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUTaHkd+y/xIoIctABWg6hfiYaJ6o0UUZQt+oV7owWdlcNiZBLbNupQPH7oVCegKAwvTY4F4dNy1CoFHcSvnx0NDSjD9Uboj7WmNnw62y4a+pC9v6qvoffS8J/4Yl9UJYVnx3M/CytkiP61VLzFXcnxx9A1oSQ6dogcZ1p7HLf+EQmhCh1+XUQDNEBUPZoM0waqIu5i63LUj+/m3JDMRzir6RNlVpiZrODG9fb/rsNjnOIzMMGQWpVwIU6JoH6NID5x9aUb2dB65nsxwcw02tm2rNVmS8hhUtq06bCC0lyVeGHvocjGMqt/7H/IeStxn4sbzhdXjUztFQj+fGnL/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR66+97grMPLgec5CV7rBf6xHdibX+GG2vYJXXYjAFY=;
 b=Nz4aWxQLo1g4/7K7vn/qiw4wu+/abP8EP+Xx+AMvu0GWTEJcPSSEzvQJBslcqodqaefUW9mKmA8YA2rGqmkrW++CF4pFY2JSCQ4pVzPZ8sCwVYI7gz1k6peUSy2TgAmp5AnHEVsnQ1Bijm/sIYWj0lQP6FJK1eCYPaX7xvnf5D7HfE/HIZuzX7LKUe/c8aFrGQh6lkophsoHAAoV5g8vuwHITfs8nN2o6syYkEjw89ugr7L2Z25y/8dYhzUDzX1UAnZsISZypaQV5DKYQsQWDAMQoKjm1xLB/uA+d4ymUbXe2B0BnKK8u9/bF5oy8ZqgwmrZkB3rm9OfgIuEh6ggGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR66+97grMPLgec5CV7rBf6xHdibX+GG2vYJXXYjAFY=;
 b=veKjeHsAM0OIUV2BuUi1x02Tog1LkPUIItsc8jHCf+uDuiIEzXv1h275X133F9P/62h8AcY8F5M1AdvkNod3t7nyda6q4200cfgg1JcRybI/kuo7uT0Cra96jG+/H9L83srB58sCEoMySOOJwVL7nW/pCVlUsArUtRno3humWco=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 16:38:06 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:06 +0000
Date: Tue, 18 Nov 2025 11:38:05 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/7] module: fixing missing } when not using libctf
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987A5627BFEC1D992207967C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ba8714-d9f2-40b6-2304-08de26c0da00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZKYzfZRddERqUeS+nYsE06+HI8MfWpT4QLR3yelIRWqn7v7eXtgFs4jpDWBc?=
 =?us-ascii?Q?3Xbs1Oq4xHyra76pAud0fDPOa8cW7J7yWoQIKOE+CWYzO8rHpP4SPqsq1rM1?=
 =?us-ascii?Q?Mu4EaNDSCUufcUg/k5jsKUgAG/3z2DAFL41S87IQfhkLuX0eYO8OGuAz+GOQ?=
 =?us-ascii?Q?c27xNzZozhEgGSy2G9r2esMmSyMypZqCExn0Zhj/82kwij5jbOZt067WxDnF?=
 =?us-ascii?Q?wjpxrU5zb5pQZFxgOSWTuvkKkAcFKoHvKxw30YbwHp1F6y9hYkkXM8NUzOe1?=
 =?us-ascii?Q?XMa9pFtmpfFxss1Ik+byS+cLp3y6YlesriJpP+3/UT6+Ml8jDqaJDxqI2gTX?=
 =?us-ascii?Q?G3Gv4PWU6Z/TS3aVzwIa2DK6NgN/Fk98jbZ/LjxIx9VBV8/qfKhhrOELFpTY?=
 =?us-ascii?Q?PyEq2U/R6Szc5D+5uBkEs8Qp0DOTS9z3RHb9her+0jCmrRC48WB/hlsVv3uC?=
 =?us-ascii?Q?yZvzlkMS7NiQNnJMfnzQgsMVuHWataCSNXJ6pOwRlmESjNOpU6ypzzIVoVI+?=
 =?us-ascii?Q?kngoJCMRUkckWW3FLhJwO7WGwhbOhFdK4TZzPfk1fvNl3iwcnT4NxHBr6R7a?=
 =?us-ascii?Q?OFYLSwVCqSxKNqe7G9JlNe12D6oMha1Sojj3qie3KxpjIhingN+3QxGsZF1b?=
 =?us-ascii?Q?lAquA4s3ndH1fmowYsVd3kBkhMTG6aHJeO1w0ZQ2Dh2eeZb9pmGTohKfhN5n?=
 =?us-ascii?Q?CFYj4zfSOIQ3yeTU2Gr8WXIGwPG3Cu5hiX/0yB4tRSC8ujxRZ4x6UACQW8JK?=
 =?us-ascii?Q?/UCinJMvxLfSry7nSoALyLoBh6fyGcPXX9j/glP3HEzM+/S24Dw6kRGI8GD0?=
 =?us-ascii?Q?jvj1bpWWu6VuoER+KbrWWXxpP9xx6e/Un8BH2rMUg4NTeS40IKw9S6xqjVuE?=
 =?us-ascii?Q?G08AvrUkZwjKHJ3jjtlquJBgEhf2XfR4/u1hfXvhYghrT1LYyu6B3fkLcDT3?=
 =?us-ascii?Q?V7XkwFWugrhhzorGf2cJRYGT63d0AZrOt5O/xXuDOLqLdNrpuv1EXVBJLMHy?=
 =?us-ascii?Q?vIJI7hUJZOqV4LoaDQm7uEzICPtkylzvHQkoSTSk4fa9WtdST0Qon4fy1O+2?=
 =?us-ascii?Q?IEBPLqmMiLTD6DANIwL2yN95RYfxs1ANHuXWZ1x9rjcBLuLRfLBOrwqWxuf8?=
 =?us-ascii?Q?w6f3AgXkOpG23BlN/OqysI4AY925E5dyGrhdYo61fNLC33ZtwrLRmtEVa4zG?=
 =?us-ascii?Q?stIpvR2EF5bah4i/JcWHoGbIDtygzfta0w0KBUFO26EvGiWEjZtOUnUsnWvV?=
 =?us-ascii?Q?NpjpjalhSHYi6NHSaVM2AhIT7rA8jg2yjY5Tk4NfhwL56NjWfjqbmTou21NX?=
 =?us-ascii?Q?yubwPRKyBGUCKR0yPUpZ+RMFSz6nJG6s4DtWiBZJYh1V6CIeGZGHE1x2ldq4?=
 =?us-ascii?Q?Vr/YKWcSNXgxZrk2GEvPT5WrvGmbR4lLRVuV0tNmoswKWmZ4JD1uAbA0gShm?=
 =?us-ascii?Q?NS4rYgl5kJJX/efO4UfCaDVawfWs/2Qw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FRrIv3IW1kmXm2Sup5fK4LcFc6l6VLn3wMG47sfJxplgsfDWrRs3IwSR1Es1?=
 =?us-ascii?Q?nQcap/kPvSbuwbK80BpY12ONJYwLPjqPITRqn3cH9UpmIF38JiMujw8CbZIv?=
 =?us-ascii?Q?k+RCEMkEhyHWwLIVBOp5S4aLqeom9oV9U29tdYp+ctocdq5i7RyUJJIc82FU?=
 =?us-ascii?Q?VCcQviLaHHa2mKlA9CttxBSm5zVvjVZwzpFQSLFuIN+jqICzh9ZZjIVr5s99?=
 =?us-ascii?Q?OTan6dpu85kUbgVTedlm00QN3lM42EoeTAm4NL6PpfK4Yw05JWbZbbwP2iyo?=
 =?us-ascii?Q?0/v+hBaVtmJb6LyWIRBvq1Tk/H3XJ8Cts3k6MACGD582DFczdUGvohlcfdWG?=
 =?us-ascii?Q?G7itRgjrh/RWdsvjU4AqBDscDJ1zRSOTWWc2ZIbAcKIclJt55V8CyARKZnnu?=
 =?us-ascii?Q?ECvTxmWVhLgyYZyy4bfPRSOkUiE3NtUJb28EALCGV3+SPSLvnVe2dpoggM/W?=
 =?us-ascii?Q?SIHpwhpEvel/n7+0Y/+Y+bMBHVA4BM0f9jjhBUCm8EwBEV28swwJQM95yoIA?=
 =?us-ascii?Q?pXIIeKzUDTt+pNmmlgTXlinTXYEN75hDiZPN2sPQzpsGKMduoXhKbMqqmdV2?=
 =?us-ascii?Q?R1SZLmKj107pQZrptQAn9gU4Q7Y0VzmVkeU0mLXT9cecT9D8L4rsC6dcb3x9?=
 =?us-ascii?Q?IDL38qcCNoqN0MpULq+1L8qPx9Gmx9astdXVGcpswM1vIIyBm99pWOda4nfu?=
 =?us-ascii?Q?DlewgLDkAbHuQ7wA5pJ075OJH7pdekczxT1Gb9oD0YyZB1MoXk7S3U+lYuZV?=
 =?us-ascii?Q?A5UcxEgydluMqOyymY80J37K+LwuOulGr6e5VwJW199fPxesbsOzMH+5dnbD?=
 =?us-ascii?Q?K7VUg39ctpRb5zYdunu02kuPG7bLVui4UuvfrpXRGZ1A47/8Gw3IbY895Ce5?=
 =?us-ascii?Q?03HT2dfAPR6nxuKFisKhCggTrTc5Ibz/CClhMGosZofGBJTkMFV47ab0hSSE?=
 =?us-ascii?Q?owICqPfTQBTnbx5qNzXcq66TlGS+ZlakP0B41ekD+ezjDxHqq67OzM2wVQxY?=
 =?us-ascii?Q?HkH37i3sa+XgUL4jjhqSFeWEvfTeifQegKqSkSCc7jATw2xMiSLoObABlx8c?=
 =?us-ascii?Q?kX7JY/Xx4JelMdcSWh8HuBaTWEFRBEMF0f7rBPGc6WbLgUWnjDpAuT/0ZQNx?=
 =?us-ascii?Q?JzcTVEqSkEhsrq5ggfOuTaeq/zaAKjHXOpZCLRhMptP/5ii35IoUx1GkZOgM?=
 =?us-ascii?Q?S4n9iCand4py69dj1j3htTMy1+dQBQz3HFFyL6uC0oVQCOGCAudNng/xY6Gb?=
 =?us-ascii?Q?TRWym7LUhPRTkf1N26Pdy5dwlAgB5A/2HRb50KDPJoM9xA12y64zNE+FUAZQ?=
 =?us-ascii?Q?J+Gltiq0hEjsX/yiG7VZAEr/yyBqekX7mPLPsftloAstRkZbKm5Xs9cm/3F4?=
 =?us-ascii?Q?d64aFgzUR7QhmrDQD7zaWNwrXo8HTlQHVURAdzOc8JFQU+oYClTjrIHsp5yp?=
 =?us-ascii?Q?7hqF+QH19/FRdTT6m40PB5RX74xubNgx2lsJjMknWC6MNUpRk/ZjQ3omrl/n?=
 =?us-ascii?Q?7H1AesvwHk3RJqDKK3IsnXGt3bYpWgAuTpp+Rf9PGJjnxy5xXp32OdONP5p3?=
 =?us-ascii?Q?HOT6PYiN99IWUWgwTyTkaYzC1n9pOBWjxrs4t3BxJmAEWPdcZhWAG/a728aL?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AiY8ffEI75CYC/c3ZWCLSd/BT+L0EsCyNYipBLjzVjpcRD9BtmvoOI+jByJAnVlY9TDa3sgwO+RiKyA4XYbb6HrT5HZJ9M3g9GW+vqPYqD6pEqWu0h+HC4AriNVDfp48+CGKYG8fkHFB+Iw1TDC4U7/EMBdY7z2W5sZE6qYleB8W5ShcxyyJ5il6rvMjpeb1xVCwzAUcW+Cuhh3zYiKqKd2H5zOE4OXRUJA1+7gcf+9yIcrpTCv4EU8MDtSSqYJsfBmaHtDfVR0jiI42w00R/FjifgoQ8C1YvbyCFNXM+fc8nGteRGDFrgavT+MkwOJyUQqfqgcd/ym2dsMHrYvCdRvceCMTrkxALx+UshDH4KIu9M1UtMQgppPyGkk5q4Xcu51X5MBMCP7KoxW8fPRBUPgRx30PJacMUlrcGdvrtr0x8di0gorY0gDXjw/5ZZBirE5mw/nh/K8pzhJ4NXnDreQh6Czu584T4/hQ4kGolJDhmStn+3W52woyGUJnMIEWkgr7UX6lP3ZmH8AI5jiOJHcqzoCl6hEbtu+p6S0Mtp2MTbYEMBN9CZSvRcio7HIGJlWOcW0Fc13oKYQXWiBCQqz4hOvnLPrZKM40cKVwGcU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ba8714-d9f2-40b6-2304-08de26c0da00
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:06.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb84OMCPTd8PjGcc6jrHEf6B344TFmD8f7xaZ727sq4U2Mv4c0//0jvvDJ8Pph/3ZQcqi7+z08v6fHOhxiThb/1bvGMwSYcdJb+5oPLp1Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXxGIai5Vq2aIx
 5MmTkWXWCXMiywxWDtdvcUdvmDitnMxQ85KBIIRzL7Fri5tntBiRWeJEDKBa/ss2ggwvdEfo9qw
 bTGgo/ANdvX/VWKeo9N8za0MOVytFD82C8SCKpenR2B/jM7J/AAMXC8QGgYb+RPdUIzDwXDuiaa
 vJN70qYmPl8h/ZSg0deZNJK4S5juzBf5qRhO54mWR3nYByQAC+IQmcNhtqSbCdJjaag469TrT/F
 OPhAF3MiDyW9trK4rS7UgB53y8a79uLbnp7E7pSsR9uloTcfwKpH4ND+teofqFRAzYKiK9JbkPl
 Vz/u8gOp4FMHgXOj/SkUWJ5OeHEt6piSaaSAytGW7mKlsR76tD7zcSR3NpmqONYMMHTa9W0mDRM
 yGFQ/+50iuPfbdplggC6d1/zP3RaLGCa6oZI2DHKQUG/pwbtiyQ=
X-Proofpoint-GUID: ifqh5dvIl_XbzQlyIniJ0XJMYrDtBvrn
X-Proofpoint-ORIG-GUID: ifqh5dvIl_XbzQlyIniJ0XJMYrDtBvrn
X-Authority-Analysis: v=2.4 cv=Rdydyltv c=1 sm=1 tr=0 ts=691ca0f4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=XCOi083qJoPexqs9X3IA:9 a=QvpIdDIA2L8A:10 cc=ntf awl=host:12099

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index e7d212e4..7ec1b550 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1031,6 +1031,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		dt_dprintf("No BTF data for %s; "
 			   "looking for in-module CTF instead.\n",
 			   dmp->dm_name);
+#else
+	}
 #endif
 
 	/*
-- 
2.43.5

