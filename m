Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C83202F70
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913587; cv=fail; b=hm6+4GMI+u7VBHO7aeslDWcBBGtipkOf+7BBzbdzKp3SP21XHTJkL4onyaKA9GhJ++KoX/8Ln3BQbX7fkajByVwVZqQCpwUY/P+qJSFszjmgFEKfSMpg8pUZptinEDDR0na0bHpOi0OnurQ00Dr57U+SAeWBnD4Eqw4oHpvHqZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913587; c=relaxed/simple;
	bh=WD83KMHfHj3qpxZb8ZSvBdUaCN6MZdBdUtkoMlOEdoA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dPoQt/x6tKcr5yhYtheLmngN6g/F6rFDOKX+ettuDj2p12QKY9nit5yYdIp9AHtdaiChyk9cmj1ZmjSPOVoPlybuPE5srJTtQcxr2Mdww8d2mO8QLG3UInr9UDjy+ShyfvT+9hvZvgL+ZTJcR+uEXVEpltLpjAz2gDwuIdOHzGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n7E5Nvik; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IGaunT1S; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n7E5Nvik";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IGaunT1S"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMrcI025201
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BNRmR779gUIKJoQnHh
	HKwfAOlnCtOcoRg9og7JU7FN8=; b=n7E5NvikwuZmWfDtuWMYSnVIcK1Li6WIN8
	fymrKV5skrNYgn2pLJoGTteJz9ixgOOEPlaJ1tg/Uw4y0WkJnJu5cfl7bbrNqNlt
	2FuFEy/qW2cGemcUhzVfoZoNqHzMFAREysT1s2bCSWkbeSnbdgkhSZC+MxUnCaeV
	1bkGa42l7UHVEbgAmOr2nRLLDad7f+7xtYyfmIq5ZKiwpI4yCbL/dgQaClOpkFkj
	jfIcZUzxSKPg9T2+ZhdKyMBfKCxsVXIpOGI2+W5Zdo8rTx0IxjJ82yy99BkVmiF6
	YcnBicMVGWeo82bqO9LFADhlmZdL6Y8Y0OldQzDigWO351kpRR7w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dygc04b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QHrj3P020763
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:24 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xnvu-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq76JGA4L5SLPCJ5mqHaNy/A5NtN59d1ow9mJydJg4N1ni6NqqWuVYza+Genn+11CwHdJdM8HBCHy/3iyXvthgYkdCVpqz8rBjD3jR6CkFii8QL1EYkS5vD45AZUYucL/fAvSEstvM+F8WCJ3hZ8NozcPawlQikJCNIY32EXWxFLA9gE500TCiJcb36vT21SyCNZoNR3st/HziWiiJeQCaUWXO+/2psVOa1tjTbX7+gujpu2Viq3Mgg3cZyVeCS8V2R1KnVwMeVoPJU2r/ltKyn13fKdRoIEaTXsmjGESoGbruu8wiV07u41ufGUrD0SuKZ7PMJUQk0qLRJpmZWhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNRmR779gUIKJoQnHhHKwfAOlnCtOcoRg9og7JU7FN8=;
 b=uNhLkLpAtpV/se3A0SvAr0hMI/7zEr3DSiFU0Urto6Arx+ZClq00BqrUrZkgUN9TvyXn5XyVWlU1WM+CARyHd/0HQhODOE4PX+Fo2tHYBVKi0+2Xz1rocb4Fr6ospifgxOqIOOc/ftY1+E7FweqPEZcMDxyykZYouqfssjIGXDHTs0G72fM5TqWeBU1D4uIBzeHXc94578B+dmfiK7Npqc9Wf5/iI7BmWr1xkQXK0WuT6CvHeM7N7bQW4m8JhzQ2wyYlK/KVW7JlIaj+s4g0pdJcQ8eAC/UgBGF16T5vks/iFiJkYqCd89nGDbKWPNDfGbPSZvPswlnGlkjqZ2L57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNRmR779gUIKJoQnHhHKwfAOlnCtOcoRg9og7JU7FN8=;
 b=IGaunT1S/pLYmaNAbrVIpcIqZbzyGx5ThQOjaDGqPRoJOyhS+pdgcCwnOFbhtKyMoWsoQbg1oXJwaE1WKts533bH31kL/5BUvZ/MvKl7IbLbaU0jLtiddP8tmLb2b3bKuduxcco9VKL4Cjp9SAejRNAMAnrb/pRsHMcCEa+/6s4=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:20 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/20] doc: Link to "Character Escape Sequences" table
Date: Fri, 26 Sep 2025 15:05:51 -0400
Message-Id: <20250926190557.8485-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 25254234-d007-4bbf-9456-08ddfd2fc722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?prapsBCwpZtErE/rrzHrCPZsvn0iUD5EmFZqsVbH6YNayUCrwDTADFeIslEj?=
 =?us-ascii?Q?Uljwl/uFaYt38UUtx5S2d+Hzf9TktokxY7t2/lQHQ2aqSBbDNKu5kBtg7SQU?=
 =?us-ascii?Q?7n2/uJlW/1TDSgWrPbL5lJNus+yGg5X5PkDAab4K85qtuNlvi5AY1lUsWDvX?=
 =?us-ascii?Q?FjZB/qUExuDmlU07p7GD+jjif/fNUUebw315KoZiBXi7ZZuFsV777sShydDZ?=
 =?us-ascii?Q?utjQUcuCWt7FBIKiCAZZisGWa+6ZlSyaCyCo+tCPLf8Jh8iSZBzbrAf+Bfkf?=
 =?us-ascii?Q?iSPbN44eBNnDIfA3NavMxzNU0SMCThtVOU5fyNbEAlhZnyjs6K2lu0mHlhM9?=
 =?us-ascii?Q?VaEL6xDySeLxgpPc03vnew3x/gu95Zp6CZf3fAJNzgJyTpK1RKESEPrt9Axc?=
 =?us-ascii?Q?u2ion3tkpBlfY4jrYqqF27oI1LWOInah+YXiN6nyzgF8wLP9r1k4d/80b0Cj?=
 =?us-ascii?Q?W/5sNXrAzVf/dSCSmFJCrlx7iuhdvB0UWghXnBaQW/9jHueyMzua4fQdI6ZE?=
 =?us-ascii?Q?IoopSVSh5P/Fj6tzaKGAOl2et8P4eTHhwhoXQoU2a7SdYLSvokDAvLXb4/ip?=
 =?us-ascii?Q?ndqQr4RNOAHxdeIxC/kr0ZQGI25t4mk6zsYxt0iSSfyLa+vF6HIj+nuaKqgm?=
 =?us-ascii?Q?bFbW5t/x/vywibq4TZANWbqAUZNrNSi5Fd7JNVYyjQ/RJMARuTxjyBiBi7XW?=
 =?us-ascii?Q?JDJrVMyvnCTZygmgVYtfSbVo3oWWNUA7W2fLQPPxcD+DXpaBSwGhbiFpkEPr?=
 =?us-ascii?Q?Lr5qF/g82ILsd/1Ok51H9u31WFrC3ukxvvj8LnaA1LbvUFZ1h4RpQj2o/hev?=
 =?us-ascii?Q?eugwS9lAA6daaSbheEaXW31nJcQWRD9v9a+s01mTXfbC2fFtzbpOlXLc36yG?=
 =?us-ascii?Q?HVdLrlQGyI5q67KmC372Tgw9oeBLFKUd3FZdqYrF/Ov7uIiSplO7ONn/YJ5g?=
 =?us-ascii?Q?I1X4q0M9q5HoMU+Aayon3p0qmfhe7tgq0OgY92Hje10RahvGsVIrZIQLlVlT?=
 =?us-ascii?Q?jYwkoBiN7G0E5Sw2R+iT9+xh5hHJT9UA7YwV+csEoSYzC1yv2ozr8OOnLaIC?=
 =?us-ascii?Q?jVijRHwMPaGWV3sSQMiKl3wk2kCUCmzSfHgJuTJM4icfFECJNju4GNaLW4Rg?=
 =?us-ascii?Q?2+yH9D6uRfKiPQSnBifCte6c4n8YRfJGuo9GyaQFMoFeqtdumEt0ew0piCZm?=
 =?us-ascii?Q?/WE49kB92QZ6rSmzAITK5FkvCod3dwsVqL/fo7DhVr4XEp0NmUGStevQ+Xr/?=
 =?us-ascii?Q?x/OH3VKGhRkc1EdHAjqsxFj4Pwn3jc8mYXr/lo/fjy+2O/Cfal4xRNSLvRyN?=
 =?us-ascii?Q?l9bnIsec4VG/9dmE86DAQgw+AY2RcwGsUCJohX1VxmKFPHevL4LRfRCUooaT?=
 =?us-ascii?Q?k23djvIZu8KMKcbbImyVqhTC3uWCnIzmqQQiAV+RDutAsvcGEiPN3oTXKgSZ?=
 =?us-ascii?Q?VcSpRqGnuUxDK0yYHnOSXoo4Xg4nLYxH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/zGwtQtmLtEyODFiCfssAsC+wslxwtPIBjnWjj5gtMGNqPrNfiqENnWEAvl/?=
 =?us-ascii?Q?hzwD3qFpmB4qzrwshJQAcz3l61JIsV3ytGPP0YipQkn3V2nUcVUmIbtzOtDL?=
 =?us-ascii?Q?nSUg9Hm1EkBFwIPXVV0BGIaACWv9QjwOFbx+ufWR74OxL6Rq+G+Fk1wYRr1u?=
 =?us-ascii?Q?yGpsAzeQAmVFFt9J7zbJ1eQONV0kDzHeZB7Ht8z2TiLmIttvbsrrJP0/8PmR?=
 =?us-ascii?Q?BhfgsT6v0cAA6HC2J4GnC2cw24EpMU+XUOo8yfbWiyWD49HR028VMeC6p7sP?=
 =?us-ascii?Q?/m55dbwwYxnt249Tj2NSGtO66KlgHRXy9PpS9X/OuQ8reO3KbLgy06URuXqG?=
 =?us-ascii?Q?eOJxvIocG7a14c0xig4MFLfOBr1d7G07RV1z75BWBlGYp41KJDocpzG6Jdf6?=
 =?us-ascii?Q?rx5SsjNqMidnQHu7fvUnVYUQyg+N7ZtNFwndoGMw+oGn0Vb9kjadj0dwQBPI?=
 =?us-ascii?Q?RmYvQYBTDUf/lPuUwczQQlBQ59F5YviKERhlWYYeOQ7tTiWoVGW+XUCndRZa?=
 =?us-ascii?Q?8nq0X0EzIG2ezxyLG4t1rZNPpmsoieBG2FpdTQnq0k0C1drfzICCNEi41jbW?=
 =?us-ascii?Q?4USPuss5XYsqgBni8YwDRqKE4v+y3FAZD4lgWG90XZfgxbUhHTylnEjzxA7a?=
 =?us-ascii?Q?jkdFkn1SFFHHszvN+v5qrYU6VHq2HPMdyrfke8YJW9woBsYfGdFavfmUTgPe?=
 =?us-ascii?Q?v4C7+MV+Uqxr4pCmmZindpr804KNoZn4M26CMFqS18DLQ508eh7vyIQaZRaG?=
 =?us-ascii?Q?3xrBOJ7gcaj+1iB/DsiQQ7w3fLg12WekYQmB/PJZf+wXbB++gxh1BaYdvO+d?=
 =?us-ascii?Q?Z+FUbdkVO1t3EEW707GRYsNJZ71DlJE7CUxEOVnHcxjSlkYljauK+nsoq+Ps?=
 =?us-ascii?Q?dTkNCXxFSEEWKX1fBizreP7BiSXCqanTDXU3pDGSJaA7dzLiTX/xuGOkFfTi?=
 =?us-ascii?Q?Yjqv82qgMEH0nUwfppT/ckm/fUbs9dqy/71LCQCcr5hiWyZeZSa0LEvOLXcc?=
 =?us-ascii?Q?lbuFlrUnbhlu+5KledHGMxewEXM4Oa0eXqaiwHebf+AxUyxNFnAXP+ScBXRE?=
 =?us-ascii?Q?Kf/0vxVxKN90GmH+DRJ202bWyOHOq4MEfAbaXwcSev8rj63yudENjqGV6NBy?=
 =?us-ascii?Q?SN0ATbasUKl8o+vHLrQU+YK0mdFShMuj0I7DGt5GGc6Qtve+YCIv9JXq7FEo?=
 =?us-ascii?Q?g7Mayi5++OzHWREX2YzqbvUSJzEjvZdwfrmB45aXj6HKOUWVMVyGjwyRITYX?=
 =?us-ascii?Q?Unp7xP5BRS22aQjgSJOS5Bfqi1F2zjGBajM+FwpCue/8jPEH2PGNiwOlBC3d?=
 =?us-ascii?Q?EQyrwKJBhAf/tenM4X/KLIigpP+vcYum8z4WoNTamva8iu0ppQRAHaerzAGU?=
 =?us-ascii?Q?Dg4se1RRIGDWd4kQmOg6AoN3cuyyDDJtqx7wDJsPFNwieM/dGYSQFUHswfnh?=
 =?us-ascii?Q?rBB5QWpJ1CM04rqWyJs5oLu72u8d/yrPb3scKTIVCCyWywQ2DRuouNo3C6Wl?=
 =?us-ascii?Q?3eGR8ycHOZQGMyKlosZj7rrg3gkTFLu49PdYfasVAj8Hs2uzco/CtUqksV6l?=
 =?us-ascii?Q?/ki85UxPQbiv2aisrfn77Bl83uTseawlAfeer5DR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9l9VLOJWq+a9BRD+mboo9Tz6Ie94AVO74mGQAcdKbrX6sOo7zgz6mtZ98quYj5R4N06Wi7/EKLUA/ta51YpFxsfPP5eegjWWMioLKF9sRafGnf4gwzKvHSW1CpU8WPOQTYL39DfJ2I83rvCuJNb1hsOxMjvoCmpYt9NEKqUwlYnTvBsRVD87Dg1U+gIuGb7eEYvsHVq5dIbMIRxTSHCxhJ3B+nSbB/UfHfupYrAcMHpUiUwvCdM/pscPNuuLA0eA5gjMCDaHdnzYedzS42V/9w6PApPdUIOS0f1O9imZ/O/JsAq+9Mg176izviedKpsnn8Z4/FBMH/wRPR0g81xnnOcxNUviDDvs98SVEiV3DNNAGZ73Hzcpvn9UrLV7HNHuKDAnJoRwAsNZEFKGjUC1zijethGrhb+G7VwQ+1AJv3avamo3waCb7aqFppSxnOhSod6lqPOGLtdHHFSRr/VApTrafaNj9gcC/Q+HLIcEaKhtjXlxMy88A9DNaSKb4sI8t82b+j0dj4O3ghpiw7HNx05XFmFKCQ3Q4CNUeAOrBd+NMX7uwonoY78sb048Ix7jIsXLvLU86PvHBd5WNvj7zsXllMlUcX+Bx0YB7BKs2dQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25254234-d007-4bbf-9456-08ddfd2fc722
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:20.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFbV4b8JyjRCm1copLnvSniFInF9Cd+xAtrYc/dxObmQooCH3dmP54S0WpHFjAxHq60n/ig+l1piFqR5sdAIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: bD5YoVSqsKhPfMly6uPlw4GOatGxFnTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2MSBTYWx0ZWRfXwUcyHgE5RNiK
 s61v2pd9jGat0WHH0k0gG+11R6w907HAxIEnOvR2re2ZY1xJdIhCQm34DCl/4xXsTaE2hqnyb1H
 aAg0OBVX3a1NSebbK91bFZHGgPWGo8ARdUvBlHkVxxivSUR1UN8RHtR5YX252a+wz73N/hfqJOd
 XiOfwAKTnqcXz4ObhcKNfzHnwe9k/n9F1EPJKu6w1zTkuGIOgeLdDo71oxVRMoKDWzYbPxugefC
 OJ8atHMZxjwA3HuwWLfOuZC/IFk8qWNI0FC2mYEeU2Qfs3T2BpFm+3KvSQ3aa1FAW7q7i9vkTLH
 5P63X1fcEus/ey8bOf1JiXARvEQrLwLc7RPVIvsOAqhFqWrOQPFQHfZgl4AZ4jVqbXTS3fZ3IUl
 95E9jYU1Urw9zy6CJNz0bIpsuExDVQ==
X-Authority-Analysis: v=2.4 cv=N/Mk1m9B c=1 sm=1 tr=0 ts=68d6e430 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=a_TFRBTOahvqAc-rapMA:9
 a=U77HkuAljo0A-2yr:21
X-Proofpoint-ORIG-GUID: bD5YoVSqsKhPfMly6uPlw4GOatGxFnTL

From: Eugene Loh <eugene.loh@oracle.com>

A link to this table did not work since it referenced an ID that did not
exist.  Add an anchor ID by the table and use it.

While we're at it, convert the table from HTML to Markdown and break up
some longer lines, improving readability and maintainability of the
Markdown source file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 ...dtrace-ref-TypesOperatorsandExpressions.md | 139 ++----------------
 .../dtrace_builtin_variable_reference.md      |  10 +-
 2 files changed, 20 insertions(+), 129 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 2d7172366..05d772c7c 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -474,135 +474,18 @@ D type
 </td></tr><tbody></table>
 Character constants are written as a single character or escape sequence that's inside a pair of single quotes \(`'a'`\). Character constants are assigned the `int` type rather than `char` and are equivalent to an integer constant with a value that's determined by that character's value in the ASCII character set. See the `ascii(7)` manual page for a list of characters and their values. You can also use any of the special escape sequences that are listed in the following table. D uses the same escape sequences as those found in ANSI C.
 
-<table><thead><tr><th>
-
-Escape Sequence
-
-</th><th>
-
-Represents
-
-</th><th>
-
-Escape Sequence
-
-</th><th>
-
-Represents
-
-</th></tr></thead><tbody><tr><td>
-
-`\a`
-
-</td><td>
-
-alert
-
-</td><td>
-
-`\\`
-
-</td><td>
-
-backslash
-
-</td></tr><tr><td>
-
-`\b`
-
-</td><td>
-
-backspace
-
-</td><td>
-
-`\?`
-
-</td><td>
-
-question mark
-
-</td></tr><tr><td>
-
-`\f`
-
-</td><td>
-
-form feed
-
-</td><td>
-
-`\'`
-
-</td><td>
-
-single quote
-
-</td></tr><tr><td>
-
-`\n`
-
-</td><td>
-
-newline
-
-</td><td>
-
-`\"`
-
-</td><td>
-
-double quote
-
-</td></tr><tr><td>
-
-`\r`
-
-</td><td>
-
-carriage return
-
-</td><td>
-
-`\0*oo*`
-
-</td><td>
-
-octal value 0*oo*
-
-</td></tr><tr><td>
-
-`\t`
-
-</td><td>
-
-horizontal tab
-
-</td><td>
-
-`\x*hh*`
-
-</td><td>
-
-hexadecimal value 0x*hh*
-
-</td></tr><tr><td>
-
-`\v`
-
-</td><td>
-
-vertical tab
-
-</td><td>
-
-`\0`
-
-</td><td>
-
-null character
+**Table:**  Character Escape Sequences<a id="char_esc_seqs">
+
+| Escape Sequence | Represents      |     | Escape Sequence | Represents               |
+| :---            | :---            | --- | :---            | :---                     |
+| `\a`            | alert           |     | `\\`            | backslash                |
+| `\b`            | backspace       |     | `\?`            | question mark            |
+| `\f`            | form feed       |     | `\'`            | single quote             |
+| `\n`            | newline         |     | `\"`            | double quote             |
+| `\r`            | carriage return |     | `\0`*oo*        | octal value 0*oo*        |
+| `\t`            | horizontal tab  |     | `\x`*hh*        | hexadecimal value 0x*hh* |
+| `\v`            | vertical tab    |     | `\0`            | null character           |
 
-</td></tr><tbody></table>
 You can include more than one character specifier inside single quotes to create integers with individual bytes that are initialized according to the corresponding character specifiers. The bytes are read left-to-right from a character constant and assigned to the resulting integer in the order corresponding to the native endianness of the operating environment. Up to eight character specifiers can be included in a single character constant.
 
 Strings constants of any length can be composed by enclosing them in a pair of double quotes \(`"hello"`\). A string constant can't contain a literal newline character. To create strings containing newlines, use the `\n` escape sequence instead of a literal newline. String constants can contain any of the special character escape sequences that are shown for character constants before. Similar to ANSI C, strings are represented as arrays of characters that end with a null character \(`\0`\) that's implicitly added to each string constant you declare. String constants are assigned the special D type `string`. The D compiler provides a set of special features for comparing and tracing character arrays that are declared as strings.
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index fd1af0f75..1132a041a 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -221,7 +221,15 @@ The macro argument values must match the form of an integer, identifier, or stri
 sudo ./foo '"a string argument"'
 ```
 
-If you want D macro arguments to be interpreted as string tokens, even if they match the form of an integer or identifier, prefix the macro variable or argument name with two leading dollar signs, for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes. All the usual D string escape sequences, per [Table 5](dtrace-ref-TypesOperatorsandExpressions.md#dt_t6_dlang), are expanded inside any string macro arguments, regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro. If the `defaultargs` option is set, unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
+If you want D macro arguments to be interpreted as string tokens,
+even if they match the form of an integer or identifier,
+prefix the macro variable or argument name with two leading dollar signs,
+for example, `$$1`, which forces the D compiler to interpret the argument value as if it were a string surrounded by double quotes.
+All the usual D string escape sequences, in the table of [Character Escape Sequences](dtrace-ref-TypesOperatorsandExpressions.md#char_esc_seqs),
+are expanded inside any string macro arguments,
+regardless of whether they're referenced by using the `$arg` or `$$arg` form of the macro.
+If the `defaultargs` option is set,
+unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
 
 ### Target Process ID
 
-- 
2.47.3

