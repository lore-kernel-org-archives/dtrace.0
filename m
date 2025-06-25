Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F1307490
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825295; cv=fail; b=iMUyGszcYjCMwRm+BQ1EahxAccjjkj8XOWqhCZmBbnP1b+yTDttzYMzWn9vsQtd8b9DdZvtI5Dj4bwND2guQM6MLy0emAtu4cDb863LGHtn7h9XqScR/BsqhFvRw7ZP4SNQ1YcREQ20F7BWpZaeE2Rwf6WEtWURaZWhoKM8GVjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825295; c=relaxed/simple;
	bh=N/L5OpbHbdFSHpuk5uZQJfsSK/Fx13bp3HBuQ/asELE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QNFMRtL9UyiM56o5ASReo6VLjc282Dcan66uJS5sXLFjLlabMfgvihTFEE1HpS6NjRu4byLYptSUzRFA1OrBbZLh4TzrHZShr/yUjm47xARhcXtJpTAHN22k9PfPb2V76KTFu81wFUr/TL9vFGbTg0M8k1gNFu1wxmVf7aRBJdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H7B6GLPN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PKmlKs4X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H7B6GLPN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PKmlKs4X"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMie8a029818
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VZPEh4v9kAmlFhIRIL
	iBURw4DyhwuxhsyD4G3k6tJag=; b=H7B6GLPN+TNqrAueT+PY7gw43pddszefVJ
	1+5dmptU+28zWeKPH2zdCNpvxZ3DYBYA+tMT9t7eC8VbJ5nY1iGZdwKsvRYpkn/Q
	fcTVKBCOB95Z1xz/6W2G316kpZidxKVnvBMOl+obkhEw4ukEF4zy9Dh+ZvV2vLKi
	rEJd21x/YCLH1P3z+ZndvjznGiSSMdPPhCts1lDtkr6UxSpo+qoQ6UeibxkhalOx
	l/+hCMyLcoLXCThm9HZ7c8Qlc5L/FlyDIM63Q00KJ12aqOEiz3AJHd4H1JnNL2i1
	LsOBNvSnAZlHAYtWPv50GLwLkUsIArYnOT/iLHueOeCChzA3xgyg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y6h0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1wdX3005009
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hm0h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgfL8HeSsjU3Mur8wQbIUFL8ZwZLpHJ7ugZCWGOQErgBboQIzjSESTEbGAYYUiMj4mU19NI0B0ISw5UWRFHg2STjbazlyPGys+PnOVtTUTebwVGW4vV9ZJh91I45FZ0GMLCZqF5gQQZklYnIW2zE6+fUvBkZFgbvCU/+K2Mqs+1PkB/1aj0H8uJnDUgYi3v1MEfNISgnaoSIM70qdbY7HG0f9VXcJiHYOdQyrYg8WLpEgGu+fV0PZ4V5NiTV/90Agv7pEHlKDqwr0TBwt/g7iQ6nn/atnhI3eIMrSFsgfauHCEFcOLvekkxQwLPL7uZ1dNjF5ZZrIegK3kp4paBFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZPEh4v9kAmlFhIRILiBURw4DyhwuxhsyD4G3k6tJag=;
 b=i9k6cyRi5NEvl66ktaXBOfBeqWhhfkhG1api0n+W+gs7vGUs7whyK7pe6mlLQkyr1UWYioiXcrqM6jwmNN1r9cHRGU/4kZzXCaIcte98h/egiSVoEAb+1FLnfZZ2w9bLT/QYED2BNYdKnerhqun0ksjvMDvVSSnSs8WJvQoGYvEGSOZBswckuQtyEN+b/S+Pt9/VuGHvMr+iiiq6wOktQsrctU0iGvq62hl672aElyi6lGVALEatHdcejhEeThe9GfA9cyA/rFwX7VIlV1Ctd5xo/KC+n1J6MQDEKl5Nn55YuutabB8u3JgZSGjUuUsNXHv1yssExpN2ZdtOJ8CALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZPEh4v9kAmlFhIRILiBURw4DyhwuxhsyD4G3k6tJag=;
 b=PKmlKs4X9IjQIMGTk1HI2HQpsYa+2enYzjXg6O1S6WwaGGg4k8D9Gxb865z25ompZyGXnrf0zq6Iom5Qejd354mwodAWrz2UlNVqWn9/uzhHITmSWrjaVR/uIrk6GRQqQYJnZ/5j97NJO0mO6GZnSY3p1Q5YwOdw2EH6ds5Ax4M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:21:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 10/14] test: caller and stackdepth tests for sched provider
Date: Wed, 25 Jun 2025 00:21:03 -0400
Message-Id: <20250625042107.13571-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebba319-c85c-4144-0307-08ddb39fbf3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6QYhj8roEYjssP95kNUD9mxq7eWcX9qA15ZE6vcor/Np/Np6povUaimUnF1S?=
 =?us-ascii?Q?9bSGz4tzAqVdozMAkqD5/92N1gwmI4sOgaRhJYxCEsAy+j6qorBqHXWooFLf?=
 =?us-ascii?Q?yml4jPKo9IHqCy3oSxtjn1nyZ37jeTf7sl2YpGJEBWbe82pULyQ7tDO5YzeM?=
 =?us-ascii?Q?mqtOt3h8ZnrE13RSp7dg4hja3jCoNbbr/VK/19KR3+YxLp0MEgYPSUK4dnNX?=
 =?us-ascii?Q?W4orXJKXN7Rcuzx+MOAyvVNMc0HgC8nPxwWLgUxvEmXI/xm94D+IcJiayu62?=
 =?us-ascii?Q?wyfvT/nWKDKMi6DK3xvdc5AO0ZCfcAy9j3x6tHVEzACUjdZQK0Ft5FZuQ5Ry?=
 =?us-ascii?Q?bmjx85rPnM2+mkPx2vm8lARtkBEiQN/bhU19ItKjZFvtSCq13eOtJowZkxBs?=
 =?us-ascii?Q?Q4RJkcLTHpIo0Rm2Z5QLGYESRgGV/aDxwfDydDV3NO5oG0xcaZds7AP2ziqp?=
 =?us-ascii?Q?OFNHKju43nk1GFnuGNf6B7qkZqnfp+wTxMfwyLBBGIfezEbOJ0mxralDuXmC?=
 =?us-ascii?Q?cVsNdqgbLkMO8y/2+6HsHRWIzkxKJpHgq8kCpOiGe3psvteLNIfUXeLl7z+P?=
 =?us-ascii?Q?2t4HnwiXfEJ/1XCq9D5bVQ/72xIGKIfEAxxje6zh4pC1DS1VCAKw40Me6Pdx?=
 =?us-ascii?Q?nNBSXkXPN+UMKXw8jF0JyNeNFhx7/tBvLA3VzJrTxgvaSCgFugINYRFRKI4G?=
 =?us-ascii?Q?YVIGkmnG4C7x/fwt2HfoQ3rbn6OuETtb4G3lFRDiBoDPohfAiTUyzTcdHwGC?=
 =?us-ascii?Q?9DjxMCdsbmg10tbN7xE9zd9GbcmJf4M+jQYvs/8JkMlEQF/fexSh+3YdObwc?=
 =?us-ascii?Q?FRYrhfXO9Gv2usR+hhXugMQqOOIelo9eMAT05Mb9BYUvsFzqGMkJdQLSVIHT?=
 =?us-ascii?Q?/Nd1phWb3ZaSiyGmVttafKr26MinLbtE8en8iEVAYBW8R2AJh36AuRuPAQZN?=
 =?us-ascii?Q?2obw/vhFQDg/7CGWAQVmwuEnpTGVTsu5M21a/vSpOerURVJ3Gs/F0FntDeOD?=
 =?us-ascii?Q?26LOcrw306H9XrbsxAKgBc4rkh+Uz/wllaR5LD/XcLLVM5FkIjw8SvF0HaKf?=
 =?us-ascii?Q?yRZtskgLx/Bms+6Q1E2zddK2kRhJuNuz5LH0oxDKiYj94p6jMPdVbrwI/CBZ?=
 =?us-ascii?Q?XD8e9LvTRTPjiR2no0lyU0uUc/w/rJePpaqGj2QHz9MvTRwe97FbNLRs9v8d?=
 =?us-ascii?Q?xowefv38NRuo5ss8t+V0mGGMIEFGz5iAm5Hbfw21Sq3LAhgWiq/v6I9r+O4K?=
 =?us-ascii?Q?t+aHy1nMhMMCcrif+a6w+LkFrnjvYzisicqH1hIJ8KugL/rKuxk4qlugxc0a?=
 =?us-ascii?Q?Fbtzha8k9nJZa9870NkEI1Xjl60CC2O0ac4ptMcjuKoc9jmEnW1pMZ1CDw5M?=
 =?us-ascii?Q?jW1cJXEGZ0fWwxCrJgx973OIoH5EKTHovCb8f9BiAiRC9lq19dNINBtWYKjT?=
 =?us-ascii?Q?Gd6Zs+cgoWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WpoYHsP5vgXZ+qU6MXZXcfjwhoMAJDRRrhAujvEAuQGaepd8A6SfIc4PVyo4?=
 =?us-ascii?Q?Hu0/Qp3/lAINRMnEYW7OzXpdGLo8+3slFVwtzlVAvvKGRlazNVQEt7HuoTQ2?=
 =?us-ascii?Q?5F72i54xm8Uklq0EAJA1b7vLqNZy/BUvgYsBbZTiyNBD+t35WR0zfv+QtHq1?=
 =?us-ascii?Q?OlqJANj20KRBXC+UmsAKGHwBz+DWwTMT4+o1U+x4Y5hs2tXQT1IaVwS793ic?=
 =?us-ascii?Q?4lHCBCWvTuDAYLw0HmMA4KTH22e14wUofnN9y/WNpp28pynm4H+NQjDwhL3+?=
 =?us-ascii?Q?KBR/dWZQtT+cpEaUIgBZN6NKYxeFwFEH03GuDdMsJKpHev5AtqKXnD02a+kM?=
 =?us-ascii?Q?Ys4jOHQk/9MLynSMhfhgOLM+QJCRp7+m+5HT2rCOm0ye2O1MJoRnbQLmFts3?=
 =?us-ascii?Q?hLwYnBvctgqrsC8N2cJG8mAOjyyWX9OqCN8lMV1ESQZcc7nUNdYSnclPZj2Z?=
 =?us-ascii?Q?IXUKULnokm07GVD+Wsqf+CI9iHTA1MsV+LrfMY6wZamOLK0E8N/cDuFu6M5e?=
 =?us-ascii?Q?JDaLpyzyrt0Q8OanCbMVPs+EtbXmYcd8iFpD2vhhlz63PMAWCooqIv1W+ttl?=
 =?us-ascii?Q?6yLTg1wLC3/JkIyH+Oz1+72y7oILFEQIyHjZzLMCb6SVxGhfl6SgMe4a+6xi?=
 =?us-ascii?Q?G8FtMz0wUHBaeN+E4I2nmyUUzf/wL8PUKes3DPkbc/qnhjzytp2v5SNQ0Pet?=
 =?us-ascii?Q?FDgt82IQO+I7GWSwYZZsxLg5/sbwttZY21Lb4XsJHJZSsXz+X/BlutR2oM4N?=
 =?us-ascii?Q?s1kns7Hy9/M+w8KjELpBM8U+Wz2uY69+Fl3T/tODYeEpGGYwFHDEdeNLgGRR?=
 =?us-ascii?Q?metQT3nkaL6tOLBcPLNFwOBWfCFN+RTCrJgSJ/sqsjcWHgPnQKqnMLhuZTDP?=
 =?us-ascii?Q?MYCTUC+u2s76izbAtW0MS48fSyS+y4oOvsFpSSZuIA8Zsf+0iq+C0qHHgAOe?=
 =?us-ascii?Q?Xm2dGX1/6XF1lt30dCt3xv41ifIaloxVOIZhVK+Uj8dvEZoMChw1OePTKZ66?=
 =?us-ascii?Q?/NgNSo84VF7mlK0IVnQ5cbwuPjanMjAaFEiMmrrudgVW1XpDNPi9i4ldlFJH?=
 =?us-ascii?Q?ebX/Zk3rNKZA37D38W+Nv8uuqE7HmIkY3z+gi5pV9JOFhinvsdSBrCoT2Mzp?=
 =?us-ascii?Q?g3IFZax48A5ZDlUdnGp5MknMrP5BtN5SBxEBFTa5wI/CaCzJePgX/YRwyHOG?=
 =?us-ascii?Q?FjaCb+Td3XulKsQTtcx6TBQ8IOHW3xJCVFcxQykOhcKigZbRHn2xO2Jrw6Pu?=
 =?us-ascii?Q?NRIqTVA1Q2DMHT1Ujn+fJTybrUEOV7s6+QBWGrHEHAOvndCMmhVWqoQ+I28B?=
 =?us-ascii?Q?tYrgJXvm75Pn/R3rk/rFfJkjvKP60mfeKtR/ozcz5WshGGGY6aWE5GSCMRx5?=
 =?us-ascii?Q?pM6vEfKtVKqdqfP+5zQrwygLPVF5Xew/33fD3JkXrkarBdG96cZGRiXIqb+b?=
 =?us-ascii?Q?BRomDiZMIVKtn8dj+x6pt2u6roY+N49Ins0DuRjnRbKYG5hGkXLBbTIf8O14?=
 =?us-ascii?Q?s5RMuAwLCWWqMz2DFffskowzucH8ENyt5pxr/T6xkxAVzctPiafQLrKcZU8W?=
 =?us-ascii?Q?4h3/0a3o41zvGKxnSGs4SIxa2N78t+eT+VO69ZQd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	70LrCfaJKcZlhckM4LeKcu1BnSyiho21zZpQBBiGxFmlQdF4j+0UgkVb2WS78t7kfBHAj7cghkobvIyN3EA/NeFMqX55Gfmi6x6v2iIjdh1zYLUc3TRtOhgrKRKYolgrW0GyvRVXtaggvjtHpOhtDajEq/7vvLiGf6waN+dYMdts+7T6m4EArWULusFvIyM7NDKr8oAWOCT+KvtcyKQ/OaIBtmWsWELj5Or9mnKsdCizig53VTkRZPy1t8Fpg9g9vvEfTVkoY+fZp3URUP2FL44bIX7nQg6VC/Xu37lbN/y6CFWnShTvbwEOiCT46TEsMHzGy0e0968UZpdDFxSUP4pQ0LtnPJ+lJ/SL2fe1VN7WGbnoaWI9MsdWuGNTMEWcUmQ9XPz0m6WovWRn6hAnW88tyLGVckkxpBIH5tkuhrsmgT+Jv/0y/etvgr0xSygxlygp576bc05WoKcGOVj/tO94mvN+I/dFCdjCdPLuIcbBMhA9DhHCc5SKL+UcETa3y/FYT89tYjoHzrkEkmX5A41ZYWe9KfFBp+JdeX7UxZiAjsg2c62X5ljLUK0DpxCjhvBAYKQQyQY+7Lh6V/71ig0PAf0HOJIYBCUzV19AgC4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebba319-c85c-4144-0307-08ddb39fbf3c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:24.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHThbvrHJUXdmc5bCKT98D4SizetGX1/jTYBJuYZRIwkYOV8rPyIa2Ea99natXikqZokfcn84CKljIUK/EDRaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-ORIG-GUID: txQUrsj2hxJ9iTRnPxs_5bKqZ1u6koZw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX5ysGATbeSBH/ Rex1meWtk63baRxNA4uybBPKdWspZGRCdhxrqysmtXMyxyFWDLo9HTLGaezysEf6y5d0PR/0kLu 7h5GXawhjz6AbsggbJ0+eVH2S0SmI3+aXkOVi3nb9gBMuXiRs3pbv0YGxqmTPuE6xOybJNx/mKt
 +UhGqJXuSPhKwC0cfq/7SFACtDQ6ZBRq8CBdRHRKQ1tTVkc9hYhJ24uOQpFxigKykqw6awIwTgN sME/8twyCqj8iyxIbH5eNArf5Tq3GcECkOUyRZaF6YtDyk9jty/nexRqo0T//9Xvng3ANFLQJYG qRs+RrQ4lXzWbC4G5PneVN8Kcl75iFeMZR/Yx4u6XWCx734/H7FOtw0F7Bo2kObWoP7NezX/sI4
 ugpDHP2SoohyCX6cFAGGTyUZAwHiILgW8y6K8L0uYYWJp7TYs9Yl6ST+guF4fnZh60lj8OwM
X-Proofpoint-GUID: txQUrsj2hxJ9iTRnPxs_5bKqZ1u6koZw
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685b794c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../variables/bvar/tst.caller-sched.d         | 32 +++++++++++++++++
 .../variables/bvar/tst.caller-sched.r         |  1 +
 .../variables/bvar/tst.caller-sched.r.p       |  1 +
 .../variables/bvar/tst.stackdepth-sched.d     | 34 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-sched.r     |  1 +
 .../variables/bvar/tst.stackdepth-sched.r.p   |  1 +
 6 files changed, 70 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-sched.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-sched.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-sched.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-sched.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-sched.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-sched.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-sched.d b/test/unittest/variables/bvar/tst.caller-sched.d
new file mode 100644
index 000000000..bf73608ff
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+sched:::dequeue,
+sched:::enqueue,
+sched:::tick
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-sched.r b/test/unittest/variables/bvar/tst.caller-sched.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-sched.r.p b/test/unittest/variables/bvar/tst.caller-sched.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.d b/test/unittest/variables/bvar/tst.stackdepth-sched.d
new file mode 100644
index 000000000..05be31721
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.d
@@ -0,0 +1,34 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+sched:::dequeue,
+sched:::enqueue,
+sched:::tick
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.r b/test/unittest/variables/bvar/tst.stackdepth-sched.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.r.p b/test/unittest/variables/bvar/tst.stackdepth-sched.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

