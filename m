Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1722A1D4
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721846; cv=fail; b=bUV/jLpMQEtVUQdZWGPM3hZ+USRckqMT5AoJzUqiOAoTfQTPQUTmY2Sk3F7pHS6O4lEdD5h1yFCxuSDbIabWWq0jD18ndMrE62IFWFIkIBatoDQI4XNyJ9XSlpPtQusXE7nbP/heLcLAiSI2VhzVl6Dd8PFe4qaURlvUT6flXb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721846; c=relaxed/simple;
	bh=jiaIDyEwKnp8p8VRRhrIM5VCcbFtdz5PHgAWZLnMoAw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=c/XmPXyv9SWgVJE1pyEMU++Flb4J5wg8mVdAE9iTPtT+SmzR2Hs+X322pAZOXGiOM6b+VmBVf85ilMfe/bWH4k4QOXJ4yJYgAE+VRCzLr1s1uL9s37ykJEgc1JsACT9trH8+ViDpQiCCOmEDErxGXfudlWnfjvNqZ/e4laBhm1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bdDpMMYE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tY0taDro; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bdDpMMYE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tY0taDro"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NLfnlA030759
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=/Ts+QU+dofeZDqkvHgfE7ssIKDuRvxf3qt3x0t2aIb0=; b=
	bdDpMMYE5xeEXCKG92qcg0rwiCK/NeARpD2i1IpY4d8t2EuhKQ/SogFc2tpMONJu
	uY5lHc1cqRYVjtf1DYVUX3Vkt5TbGNemPAyY1yOlM6pFijOrAD0c8kfQOB+MR7fI
	AE0hS/5ZjGqMpsy0XRCn5NJ/oe492/nsaAeu0swbka94+S+5IOx+VTn9x7RJgxsV
	j6nwQbdaKO7G+02uFgN76uDt8k9P5YsbeyGsv+h8q5IHD0R2fbCRPV0zYGzJvUWs
	2B/VjEJ4vdtUQbnJNR4cg2viESUAYCn2yN0MFqBinvV+/Fxk3by/agoq2GXQitEQ
	YHQck/Smg15EzZTLmxfzfw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8muvx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKp9xp002086
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpceyw9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVoHcFW8dd16g8LPTOFvhpdapAWbbibQTM+UPREbq1ftbdsJgh0EOhmWaZlnqRw96e6M/kf/69eTf9D7jKGIilCuBGCJYf4CfM8EQI+Jc84FxQCSy5cwi+btz3WNsGH07AeGnLVut+ATu2ySH1Z+b1Jo4fskJ8+JSEknNeSlcvITGFBsoc9xrktb1we5NTXiInVmg/DHt1JO0TlLuDcmrCKj9liEU05UGzi6zNTwasEfKB+NWRrGIaMQsM0hsoUAhMENnNknuJ7bTvjdlCX/5mllimQaRloY1hIr8Vw8Ge0u9K0fZkxLh5R5xlULbqOA7BH9xiLzQyeU6kVDZ4m6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ts+QU+dofeZDqkvHgfE7ssIKDuRvxf3qt3x0t2aIb0=;
 b=GJ/EjTNuPRRIM9ZG2QN7gCc9+1O95zBuROdBw9Tbivpc8viq0iNv9mna3zQ+LaFcCuOGLjS2kvVIJq08m4FB+pjTrGb8n8yhlJAIXvGBglfwHtfzA2NUGj0yJW1hoqihYJuIOlTEFtHRGjyFJywJqLaMvZ2LhPy9TpXblvGRsI6n+fplvPKEKI0kBNHFzGLO+txQb2VzUKA8qU9utdngvPKkEwDLSWpd/X2pcHyP9KmzQWT6fIQGd/u5ij7S6t0UI4QlFQJsIT1sLr9Q1sBHVFxckmtuQ67NMaUDZXahL1cLnazhPmxWm4LorX4/rteGiEyD5/BOcaIeoSU1Xgs4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ts+QU+dofeZDqkvHgfE7ssIKDuRvxf3qt3x0t2aIb0=;
 b=tY0taDro1eD2SvncfuZ4Gn/1yD2IwsspAK/2AKWLrD/T7XJEzUpGjgDPXnb2w57le9k0LC/QPM9WltJ2+6CrnsajqwFNI2ClTVM2Hz8UIw2amNFTPb7j7OfYlFzWAA3Hok3R5PUTnSX2CB5M+vkug/xqv36AcJJxeF0Zb77CQX4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4872.namprd10.prod.outlook.com (2603:10b6:408:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 23:37:19 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:37:19 +0000
Date: Mon, 23 Jun 2025 19:37:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] options: add -xbtfpath option
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56727ED82C9679D8556E1820C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de8e660-9530-4dbd-50b8-08ddb2aee4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S18Yasp+wB35KUeNe8hiyP8t8tjNOI0k0YKLuHs32IZL/mNZdljgZ1ruEpwc?=
 =?us-ascii?Q?WTyBtTn79Ye60dSmunIC7r+Ldb6lpImjqKxJgzXdoBoGzzKvqV1TYw0tpakn?=
 =?us-ascii?Q?JD+E5UsW5qP7xlMoBMaeX3VJYnCc7pzZUChA7GZ+oMnsFAm9KoFUflks8Sxi?=
 =?us-ascii?Q?yz4I+7Ks4Y7rNKttQ72YmelbOVnqWuAk4u/AuwlulVH2nbyq4uSEFG8IKFSK?=
 =?us-ascii?Q?7LkyVrQ0WHXATnHAVpmtKFXVvEm+gHINyYkNChrWMuGFUvcTaAFryqNqKXKF?=
 =?us-ascii?Q?/bS36RUUqjxGupJgmaHh4chxVWgVXgoB2Pv+hE7+1olgVp09+TlqbgFHQhwp?=
 =?us-ascii?Q?ik0FmU9EHnu8SUrM9fnmo2ar9CdR832ypbOknWgNJ7MzJRxLbMtcs1Dzmz45?=
 =?us-ascii?Q?JqI0tFCa00mSgZ1Gco0S//SIkvmtv11FDeqZl2aR10k3bdC6P1COAHJxfuZs?=
 =?us-ascii?Q?tDEVI+EaQ3SZMbH9PHzIpwMJxM9MLxC47UI11wMfsn73MoPWeoiwiVFlp59K?=
 =?us-ascii?Q?fNMsKLLw+36aEpIygaMslXCevVbED+0jhKXUaluLmxmQ74d9L6y0Rpe9XCdh?=
 =?us-ascii?Q?AlkrFIc3vmtfdC8TLVkQAL2DaLIdXEIw1OernDFdiCfwzsD68DukUAnyksSa?=
 =?us-ascii?Q?IvEJTn4BM237siba8XvGtOb9nvgUMXfe5aYt1qN8U/NgnJSWyf/wZWK+N3pS?=
 =?us-ascii?Q?fFv0hLz9xgGiZC8wfzZ9dvQTodpZ1ge3AeJoIxj6TMIh/kJP9k0tK7kein2L?=
 =?us-ascii?Q?1mqsBuryb8zXXC/8cF8ujOgubX7tXjJP6aofe07ddWVMjaUkkJqV9P6tsOh1?=
 =?us-ascii?Q?s6zH/S8zNlWSA3nh9Rie4Mbh61SS7BPn1AmWdzrPWi8bemb32D+GqY/J+3dx?=
 =?us-ascii?Q?UGdu14n3bFrpINlakEHZ+630dG1Z97ruOiqSXY7G3S70VCMsnNjw7GNHorkP?=
 =?us-ascii?Q?4Wk+YtsXhTGxSqpDIL1V6HarFZkMe8Wcsc5EwHzX9imZDxREnhUYMy6lV8UA?=
 =?us-ascii?Q?gh64bwchlsd5hPy6M2a8IAiU6dEw1s0Hol86q87p0i9iTiS5H+9/8JnCuyAT?=
 =?us-ascii?Q?jkZVdwP46vyXZOZc2RU2jFikLHfYX51zHtWBE16FLGlO+j+2NO7NYgKVVqLM?=
 =?us-ascii?Q?TK184RPccFKtU7ZjdO3ehsjd+ZF1yGFg8eZIc0hpyMNOsEEnqzoMXKTQcUoU?=
 =?us-ascii?Q?OmYJmJouSWmHrxZkZtuBbYTimHCIFxJujTT04Ev3SOHdMcKFXRNJyE6JD1XD?=
 =?us-ascii?Q?qsyDpzWe/m/NXR/NgHCXQ2NpMbYWdOiXrqHjwAt3Urm4zCm1kBMeTiPizVTN?=
 =?us-ascii?Q?e6RTD8nugs1SBatphIWw3e44zOq05DG7LZynizi/58vbDTKPhaJ3d84nsWin?=
 =?us-ascii?Q?oNiYgwYTUtNLPPW2Nam2O2l5oX3KRtRBAhoGD3smKG0q/NElyETLlKpU5o27?=
 =?us-ascii?Q?Sf9AJF1F1kI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O99HB4HFKESEAh+qmXEdL/8iK8jPwtTXLGqLXrLmci15nNgi+Ohxke2VK7qC?=
 =?us-ascii?Q?1pYhe3aJzgjMsA2MIEA+ZGHZzK6I73DccdagXStwac2w8PEP2P9H3E4QA4L1?=
 =?us-ascii?Q?Go6nysznGcRv7oFSW1R8f9MDWGd6bx75drnH+C8v3iGXSTrEEaGjxsrVmc1H?=
 =?us-ascii?Q?ZfmKtkugUE6+vFVb5SWh/VoI5VEAfPxqEoSCIJaOu0BAGOtSNIaPVKYOfWNn?=
 =?us-ascii?Q?Ij32qIWg5b74Ugs7kVxFDYk0HnpwdxWzdw86568sMpdlofRMZrjwKMO122iG?=
 =?us-ascii?Q?3ezdztUFiaygqwqGLMWFbQTm7JEJh9cx3+7AikptAe6yh/yzIB1jiYr7aR7l?=
 =?us-ascii?Q?jym7bYgeP0i2fzb3+4xam4sHcc2dyCwJzozxuLikxEJB9uOOpnVD08P22vWr?=
 =?us-ascii?Q?tWkCnE/MR/L7l5zpxCERGPkHgJhf9LzfheJ6BJ3W0tbhuWK0hSdpGg1F1L+M?=
 =?us-ascii?Q?W/yt0LK31E3hTxLKKGlPm3q6wD+oXIwuO+JrJW2/KAPtfCIbp9ShPrjj+upa?=
 =?us-ascii?Q?BwHS8yLVdGugCsFdowqMsQ/d9v2/Nu/xfNDBltXDYtHd0klkg2lrNZFIJIpZ?=
 =?us-ascii?Q?B4eivJJQh21WsTbg1vilpgbwCP1Zpp27n3AskzSX90tTzZ1aEw+86rQCunxb?=
 =?us-ascii?Q?3YVqxHFsejbjRWIqKXpynQoyWDigGa9AR8J+qVXlKhRRTd81OUwg+m7QD4XI?=
 =?us-ascii?Q?MuxP1IGa9SzGRD6+7GA2xlhY7jSqbke+xVzwgI6Qj0oFmpuYyfPo3rWRSMWG?=
 =?us-ascii?Q?Jy6ST4HeXmWg1iVc5LWs6fBRP4OKvhxBwai8NM4XE+15wYzMSSQVBv+Md3gN?=
 =?us-ascii?Q?aUbsVn6hNUWysAWAelY+zijx2bgg3GMcmPAnW0ICxLGuvzapHcQZuaO1Lrqf?=
 =?us-ascii?Q?3MO1sycmW+clDToCdw3l6YulrOY7ZmSysrSJMMxk/7U8xs7liSdiFoEVVfT6?=
 =?us-ascii?Q?YFOxOM0nRJt+sb9YepALcXOITDY9nKFZ0uRlXexLEz+HWlAQk0U12njEmbKU?=
 =?us-ascii?Q?qsBsHr+qbrL+uBPYjQEMH1NmdN8J9k/AiQY9VnMRl4AW61yyr4IiCdp79jrz?=
 =?us-ascii?Q?+e+rKviZfV0VCAE61wIu7mcxjZaRTTdVtMSnI5fyeqHrCHgT51962OE0s29u?=
 =?us-ascii?Q?6dRadfQhS28yy97hbNlMQltzAV9ynI6V0UzH+yN1OXoIbFuvGCiyot8OlZBs?=
 =?us-ascii?Q?37DLP84P6NkPWg2+ewoFA2HpjD9NqwJfNvxr6ZuZFaSdnn+rXibw4WP8/90C?=
 =?us-ascii?Q?+f+t3wnAWRxWVzBAwsx2JzlaVYgOaCsG4YYmTwBKyLk6aXtBJMGB2flCxPfp?=
 =?us-ascii?Q?ArzeGNolAN0UdJngloTPx6eMwevCx6sLctcun02FNpauPkRYljgMwqohiabg?=
 =?us-ascii?Q?J5YpFDR0c7ENTfn2F2w9NZkx2+lWnwCx+31WuIDp1y1Wm58oKaMklIDx1Nnk?=
 =?us-ascii?Q?+O43AiC8SoyB5HRxDBdjoezdIvMq4k/4rHY9Gm9mPjJdUOHtRYUgPEBmIxZ8?=
 =?us-ascii?Q?k4QPNCYYJP5lSwMLScGwgl3fnnQ4GjqUflQ2/y5xQdj+SneRRawXm+MLizms?=
 =?us-ascii?Q?/LSq8r7bGHg46g5Y1EXOlfUfgHkcvzKHXeNVTiYAuqrCizcRY9YJRzP2JxR0?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3aO4I+s4W/7POI6DSdpfT9Ggo/Tf7GnUykL2I+wLR5TWJO4cGdcTxi1rLmZ0rt9zsTTNI0cKac4ZlsYoycX925NkSKkMQYMkURkVF1JR3SAZ0Ef4ILdJg5t8irvQZpSieUb/quF295n/0MoBEUaCV0/I9AsIfaBIfB3s0dbcVbfCTqPDefGyB+YyTEEUiQZjOoVEMXMAafN7ec48E5kEp6b4TnhDZ1IRvWTkMVG7o63A/37ZZbmDXTfUZFmXJV101aRAUPzR3JkE9kcwESTkgU9f8+2jmNpt1gbWlWcosgT8Tl/aWfHRy9bkOqdrNoVtP2k+lHku1N6pLwwOMCFLq6qNXsDfJCgjNQlKsh4lqIzxbw9yErbvZr6Sc8Afncpuv5+bxUgw0IqAlzwL8gGcA+IIq4hdybDpt+xJ1Y10M/r1I3+F5Pe9q04ROC6VqboGTTGSdh71WRre2VcTgS1Orrr/alAsy+JxNCZX1Qb7XYOXgCJJQXgJpVYfE/cfUpvlCJV59Xkp3gTXqKyaaJ48EJgaPJjxccJUmckUN75+qK4HwcoKR1C+zET6ZzWoIvRevG3+OJMC9I6kfFzchjZzMjixG49hvLdKxyfsDRI+6wQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de8e660-9530-4dbd-50b8-08ddb2aee4cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:37:19.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU3LgXd4xmGpavmFPPmDqiHZa78DNV9arXSAZDck3zHNayQxKDMs8WKSVfo9A8pARH5InsThI4ylODj+9aVzWxr/twwJo6ynQm04hZqW6SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230163
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=6859e533 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jR1aEolzt13P8Zorm5MA:9
X-Proofpoint-ORIG-GUID: ySO9UrYgluEEF7KJhW2fooWH_GoWnuHI
X-Proofpoint-GUID: ySO9UrYgluEEF7KJhW2fooWH_GoWnuHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NCBTYWx0ZWRfX0yadObhMgxSJ V6LLzMxpHGUYN0guYfZU08wGZt/1SbhkHbTPAymuameNA8o2HuhgYA07MsJmaKeoS0P8pd71ROx 4fMIliw0Aw6rLjysU0rQzy4yHohFULDwyKksrQEHRML7x5cNcSpC2Kb5EmChztGUgY+p7ZoDYLj
 q1f9ZR5EjRpSU3/VAgSI5svQosaILndjrO05LckL2IkTW5MSxIjXfcYJom03E0EEd3aigpcBI2Y xYHDKCmdeAib0KFxcp1MLx28EyoZeOaFWuu4G1gBoS5sm+R2qBFCmlBoxwt5rxxp0t8V37Pm8Jo Oi7FDT1uh2YIwu5G15OPX+UhFqE/odcq86DCRAC00XcnAwEoaxJUKBYrvuTsDOjas4K3dEZrwYb
 Az36BvAUQLGhINr5OkgJh9I6f+r9xDjC56VHZGr3JkZkkjG/NEv0ZbQJ5VGv+2Qmm8KrEhrv

Also move the initialization of BPF and BTF to dtrace_init() to ensure
that the -xbtfpath= option is processed before we try to access BTF
data.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c     | 22 ++++++++++++++++++++--
 libdtrace/dt_impl.h    |  1 +
 libdtrace/dt_open.c    | 10 +++++++---
 libdtrace/dt_options.c | 21 +++++++++++++++++++++
 4 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index ad87bd83..e9ead435 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -337,6 +337,8 @@ dt_btf_load_file(dtrace_hdl_t *dtp, const char *fn)
 		return NULL;
 	}
 
+	dt_dprintf("BTF file %s: %d types\n", fn, btf->type_cnt);
+
 	return btf;
 }
 
@@ -765,14 +767,30 @@ out:
 dt_btf_t *
 dt_btf_load_module(dtrace_hdl_t *dtp, dt_module_t *dmp)
 {
-	char		fn[PATH_MAX + 1];
+	char		*fn = NULL;
+	int		rc = 0;
 	dt_btf_t	*btf;
 
 	if (dmp->dm_btf)
 		return dmp->dm_btf;
 
-	snprintf(fn, sizeof(fn), "/sys/kernel/btf/%s", dmp->dm_name);
+	/*
+	 * Default: /sys/kernel/btf/<module>
+	 * If "none", disable BTF.
+	 * Otherwise: <BTF path>/<module>
+	 */
+	if (dtp->dt_btf_path == NULL)
+		rc = asprintf(&fn, "/sys/kernel/btf/%s", dmp->dm_name);
+	else if (strcmp(dtp->dt_btf_path, "none") == 0)
+		return NULL;
+	else
+		rc = asprintf(&fn, "%s/%s", dtp->dt_btf_path, dmp->dm_name);
+
+	if (rc == -1)
+		return dt_btf_set_load_errno(dtp, ENOMEM);
+
 	btf = dt_btf_load_file(dtp, fn);
+	free(fn);
 
 	if (btf && !dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") == 0)
 		dtp->dt_shared_btf = btf;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 3bb7c344..2adc1252 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -301,6 +301,7 @@ struct dtrace_hdl {
 	dt_htab_t *dt_kernsyms; /* htab of kernel symbol names */
 	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
 	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
+	char *dt_btf_path;	/* path to vmlinux.btf */
 	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
 	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
 	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 01c36a76..c67455e7 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -910,6 +910,11 @@ dt_vopen(int version, int flags, int *errp,
 			return set_open_errno(dtp, errp, EDT_NOMEM);
 	}
 
+	/* If DTRACE_OPT_BTFPATH is set, use it.  */
+	dtp->dt_btf_path = getenv("DTRACE_OPT_BTFPATH");
+	if (dtp->dt_btf_path)
+		dtp->dt_btf_path = strdup(dtp->dt_btf_path);
+
 	/*
 	 * Update the module list and load the values for the macro variable
 	 * definitions according to the current process.
@@ -1146,9 +1151,6 @@ dt_vopen(int version, int flags, int *errp,
 	if (dtrace_setopt(dtp, "libdir", _dtrace_libdir) != 0)
 		return set_open_errno(dtp, errp, dtp->dt_errno);
 
-	dt_bpf_init(dtp);
-	dt_btf_get_module_ids(dtp);
-
 	return dtp;
 }
 
@@ -1181,6 +1183,8 @@ dtrace_init(dtrace_hdl_t *dtp)
 	/*
 	 * Initialize the BPF library handling.
 	 */
+	dt_bpf_init(dtp);
+	dt_btf_get_module_ids(dtp);
 	dt_dlib_init(dtp);
 
 	/*
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 377b396b..25e79979 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -303,6 +303,26 @@ dt_opt_ld_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 	return 0;
 }
 
+static int
+dt_opt_btf_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
+{
+	char *btf;
+
+	if (arg == NULL)
+		return dt_set_errno(dtp, EDT_BADOPTVAL);
+
+	if (dtp->dt_pcb != NULL)
+		return dt_set_errno(dtp, EDT_BADOPTCTX);
+
+	if ((btf = strdup(arg)) == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	free(dtp->dt_btf_path);
+	dtp->dt_btf_path = btf;
+
+	return 0;
+}
+
 static int
 dt_opt_ctfa_path(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
@@ -1067,6 +1087,7 @@ static const dt_option_t _dtrace_ctoptions[] = {
 	{ "aggpercpu", dt_opt_agg, DTRACE_A_PERCPU },
 	{ "amin", dt_opt_amin },
 	{ "argref", dt_opt_cflags, DTRACE_C_ARGREF },
+	{ "btfpath", dt_opt_btf_path },
 	{ "core", dt_opt_core },
 	{ "cpp", dt_opt_cflags, DTRACE_C_CPP },
 	{ "cppargs", dt_opt_cpp_args },
-- 
2.43.5

