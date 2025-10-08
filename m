Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C41A3166
	for <dtrace@lists.linux.dev>; Wed,  8 Oct 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759940120; cv=fail; b=C047jxdzkvb4dJbHb5fmSQ7GLYLLXOHoL8iE57xEFZ/0EQ94QN8OnGupBP2VdhEKnl26mpHUOOhjD5CpDfBHzKZ1zfkw5A8sKQt4Vl2kwCvNmVKf0xunCnPWbwOiFeA1EFhQG4Ff4KJ7CLTF4BgNqXOnqBA7T7w+wcQdLe3ZJuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759940120; c=relaxed/simple;
	bh=kNqDsZWNeUrTVzNWXufMqMGu+oQxzTfzwaremx9y+Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hij4p/Zzov5sJgxnscmmGTp9Ey97fuforHj8mF2+aBz+rOlrClvH+E8Xb9uVIwwTIxI0x0GchoJhETzJPS9NWvLZYGpZdRF2PdX4Vu+bTN+TM1iytWHJKJpc1AL5LcXbz7vld74aZukXv/d6dsTiSA+M7fCCVXLkgoR16efDFxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r4kyW/Oc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HtcY6frv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r4kyW/Oc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HtcY6frv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598GBo63002872
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 16:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=f96x662ln2ePNzuHxF
	RUtd3gm3WG39WUoUMnznj5Vgs=; b=r4kyW/OcMoS+BxnItnSEYwgwFm7WXfFX7D
	Z7mxY9JLjjFvl5UYh9B4sjQHGkAdh5cpjlKFbdc637CGwnE6i6m6ABztFmut8Cbo
	vQ8aYblnMpKKPbSYc96ccNELrbO5JhYUcWiH8rmjaAN+3OdjokLtdJnVODhyT6ep
	zE871LOTJCJYd/0z5ZWwQcWjJ3AoOjHGnKhmVXN9zxAoTVNeSYVcP8X8RNXcF/qV
	GXmxn15SOspSGwS6InCZZBG2bU+UKepgKQ3v7JSq0xTDZYFn4Abrn4MMTgcUyr4e
	ldvbxQwNpykm0iXsIQIz+wogoZLfmXVdRc9NBEJFgokTUULGe4qg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nm93rw65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 16:15:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 598Fcn8s004418
	for <dtrace@lists.linux.dev>; Wed, 8 Oct 2025 16:15:16 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nqd9syn2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Oct 2025 16:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD/md1+2XvXwf79pVYoOLOxdRDzIKlABdnV9CsztxxgwlDV0yF4SWXRzEZQbA/Wz2W3hLrwsmr5YjihSpCwb9FAwWitL/KU59/scEKezIcJq7aQR+WCSpgPrGhYOKcfiIHL+kLqw+Nr8XHHq212ehO6uDt2yxtRMeAg/K8HEfktwkQN7BDJO7z+YNOlAZfBPW5pV5LJ6HUxSFXXjf5XOGXA2ZVlV8lo36BCspdfANaaeI0W6yzrv3SVdN/zlJJY96xNrMgJVIR4oOrN2/82yt1AIyFoidRfjIFMDOKOkCWu7nYiMXJcvmhRziM7SmTj++pG6qFzlNd5UV91RrrwMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f96x662ln2ePNzuHxFRUtd3gm3WG39WUoUMnznj5Vgs=;
 b=OQ5BP1eVacn9KaVnLnVT9X1NVi6cVnF7JMjIm03g4Nctg8L4eTyYE316iSu7fCHYHgPvpCiDUjmuiobzS1gL3x35AM4TDAzXR3XEhjwaCRwVK+o21IKH6JaCJXomS90Uq90roRM5cYwtSAQ27BbPcOwfNdek7Ks0Byr93Wu/WWd8G1qendBW4SOiaO6Nw9A6pXLhWvLNmizMse4I15koRod9xtnbos/0x33Rj2H52ULElYth5Ce1TBtfI5kEfwOkO2DZoBx30iMJMlX/HS1FrU1RMFPR4PcG2dluXgule17jnE4l0Uqa1uTAVjcRifImw51JdLDdV5cd3/AoBa0ZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f96x662ln2ePNzuHxFRUtd3gm3WG39WUoUMnznj5Vgs=;
 b=HtcY6frv4Lwv8LP5ZNnWTitcrx/I0a6TlH3wMH6UYg8lpMSVDKSYSRLQM7KmfPHt+LtOSkhokiezbRmLA+SudoKacoFHNsgV8USx/T/v5+AIq5N4DBWYT+q4wV84meUh9wT3YFTnAfWS5Fan4iqYVTklpXjR98iuoPm514DDiAU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BL3PR10MB6113.namprd10.prod.outlook.com (2603:10b6:208:3b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 16:15:09 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 16:15:09 +0000
Date: Wed, 8 Oct 2025 12:15:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/5] test: fbt return0: work on quiet systems
Message-ID: <aOaOCtgFER7kUTdq@oracle.com>
References: <aOPpuSFUk1GWVokj@oracle.com>
 <20251008111642.422592-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008111642.422592-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BL3PR10MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: f722a92d-4ac2-40c5-85b6-08de0685da38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hZYOBzpkb1PdP++hXeI6b3qLtB7fs3LfZ1IpOOoKyhZ2fQ+SrMdWdH2I63Fh?=
 =?us-ascii?Q?rr8x8FOzGmFPInB3zjC2vrOz9XMSD/6TbPD8RKFwI0TtdwAC60+aq5K9aewk?=
 =?us-ascii?Q?oztw0R6+AfyxREc9X+2Jpt08456J3JPdrkfvrDk24ckRnjL+cEpO3S1Pygur?=
 =?us-ascii?Q?W8UTJPI72oHx8a8Afvk5pzHK5dwK/tPjMmmFylXu+Mwr8/M6d1CV1rlwRF9H?=
 =?us-ascii?Q?fRUNt4s7JZweDBTAgSPlFu5RtuzZTVuzpSj6kHM2m0QI1Gvr3CF3J+gddPTw?=
 =?us-ascii?Q?GIQmT23tpz9DEWxFXPRyCxui1qJ+BeNcGT2mLhpO+uvMu8Sti6kA/yR2E0F4?=
 =?us-ascii?Q?dXNZw9ULi8xr+MmySssWfLdqlDnAPLxBNJu3GoMVFcmtyvrR4Hw2jrDBJzEp?=
 =?us-ascii?Q?2s3f3aSpK/ntZQ44RHVMTeLmUWnNPkM8gBsoZbvH+/rEjbksHVEyq6Kn+bpV?=
 =?us-ascii?Q?NiLd4Oq7FVGlw8AJM03J3qeF+qS8LqSO8nVEidbu1VI1YOjySDmr5euCdoFu?=
 =?us-ascii?Q?M0Wge6ZxMfrQB6+rSD3zDCrUe1A7hshsL+KwT5XYUHf+nAUcTSUKEpvO1LQB?=
 =?us-ascii?Q?WirrxNSUbeDyFftvjAmz7ssbz8vF58Cz6Z8x/qMVYZHhOpQqIyTpVjoPkn46?=
 =?us-ascii?Q?yERLxbECIksnyl6piG112jdBNNxvt/LK0eX7+9M+sRMVJcxs7EqUNQRpIjRV?=
 =?us-ascii?Q?5c3oDqEsDC029KWF3n8PpeFK8RR565hFa9AgSei9oK5/mefVm2BTwFErGMQv?=
 =?us-ascii?Q?wc3rIA50JJ5W1OIktViwtT/5NYrV9jh0cLqGC1pBLQtmlNI13oZi2pdtNVyF?=
 =?us-ascii?Q?RWrDU4OZ9J5FnhrmkDSiFSkG+ldI786ZzoAARBsG+go+39lGhYHb69t4Jv9G?=
 =?us-ascii?Q?ZLrfrVuoHF9meWcLRG0tae2G4OL7E7O7DqBNEJY/8H0JYMyYAqYEzcLeWW41?=
 =?us-ascii?Q?oWRJAD8DKN+Ux/2Td3d+i1nAClrkx0nXSiAUCzUdrwz8Z62Zzgt6zPb8NCX5?=
 =?us-ascii?Q?09SOG3y8os4tr0kq7QwCluRRZ945V5h5cYnCM7v2FV7bpi0fB6wrkgo/1ZkA?=
 =?us-ascii?Q?m5RST3mrXClqFKvy18yrssHwPqYJHTJnqRVGTtrY1GI72rDXO4b4Bxc61Kcj?=
 =?us-ascii?Q?iPL4S5FxIfbKbKIKpKjLpZn+9zXtTutxZaMSWl2RGTczb2Q9HMtIZwrn0uYZ?=
 =?us-ascii?Q?cRsHHyHrASlZ4RzXXRIMWUoR7HDSBuAScKzOiwAS+o7pkupL8zpbCjYGy6ob?=
 =?us-ascii?Q?PYMNJWQWCjs/kCTOkrRCyKMiTHAvOwrUDhVNScqZJN7Su4hRi/2S2UStdPjH?=
 =?us-ascii?Q?XQql5wX94iXd2aI1VAgGSKmkUS2YaAgKExLzo85wnnb5VNIx/M3oEY7mH5Kz?=
 =?us-ascii?Q?1lVjZTaygnimwaRlqXPcxIQ6ay0CXc6Mx5Zx4dfVJPsczhZ6bHJJF0E5c0mm?=
 =?us-ascii?Q?kMQRAbrncTl/eMfbDORG5z4XKLgIJlVt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BO3Rl+PR268WQsL7XwUl0+hSrZF2Po4Fr6V+i4d/Ik39gjIvea3cD8F/iCKO?=
 =?us-ascii?Q?jvwP37L6yFv8Kxq3qmzRAGuJvq7tgKSnyFWAmE5qa0qO9G25hZJpPPgrMISY?=
 =?us-ascii?Q?0y5Ql8uQ0So4DBlppzcAbv0iWZ8Z/lkrhG1zoQ+mXJB+1+mS3P6V4EMeBXiF?=
 =?us-ascii?Q?xz3PJEZn00NOET/S+P/OZEPXDp+pqHABL2jiY8czOIYsrp0PiwgscXH9XCbc?=
 =?us-ascii?Q?KKGqpKFKHgzfYdgjv5TU3hyVzMD4Fn8F+r4ISK1XrCMcTGkmkVnG711NH/4H?=
 =?us-ascii?Q?9wyQNUgOnff/g7ICNDp9+DNBjwqs/wDVAF6eNqfZeZFkuCBxSDUbAhjrr26+?=
 =?us-ascii?Q?E5qwWw4SEeMNcxd9zrAIGwOP2hka/f7AjTnTIj11qKsTCk2bf1KG+EZZYNFp?=
 =?us-ascii?Q?mWYRnAMxAmlVGeESlZV68/Xfsge2QAXHtJwAR+eQNRcMdt4qzLRI24pf1OtN?=
 =?us-ascii?Q?1RL29vxgc4VNqgS6oe6PZ6UcnxDGnKzTw/a24qabhpqXtylLuta1+ygxp3V/?=
 =?us-ascii?Q?YU0tqMBHeQz/AKTXlmdZwtT9uBo0GNlN53q+DSmKwIGXDljZCJDn9jmyE6NO?=
 =?us-ascii?Q?CdN/N2PEXQttVxCWIsZAD0cfzl4I7gLr1GC5y7kxjfYJ++/q9AIT1p7N1wET?=
 =?us-ascii?Q?3jNxOUWG0y9m/MCUBeqS1tjBK7tJ7S1IRnD4W0uiQVHKlVI97FBPt9CRkd+l?=
 =?us-ascii?Q?aWJLz69QNyrhQpW91HjLHOIFLWgvPxbl6bIb58owPyst4PZXbFxEd5VgpAjU?=
 =?us-ascii?Q?v0IcOn0dV2fIjt+EtVESp6YJXz1nUFtEY58wDyQLav54+mZ1tmD3f+ch+08E?=
 =?us-ascii?Q?Uc+/OnqFotPtnMfgfyXvOCNJMb+AuiFPLSTf/dBAd72OmBzSLUc86Uw4eDXX?=
 =?us-ascii?Q?eQdPgCXPH4I7uvThsR2VJ+blkeDcSN1TGZe7gUjddVqzsw/Vcb6MW+AqUDAa?=
 =?us-ascii?Q?qHt44sqZuDt9f5WirnCmHxfNvg5MEOjaOtLLuaGS54VbRgarPTlL1jj/gsDb?=
 =?us-ascii?Q?syObxrJS1aGYwE8OJX8MKoAGGuIRHwo0djuCGNFvqpyvclByZ6fX7OVzv3l4?=
 =?us-ascii?Q?gtQY2W/v7UQSi3oGTbiPJzOGJi1sqUgqPj2TQqDVwFYFdUS01Ar+Uw51lhAu?=
 =?us-ascii?Q?F/IMjZjsUnyoj4yhpXAHaw1qPOuWqJXJ0JhgVkE/HN/rT60orPOvugEyS2E2?=
 =?us-ascii?Q?kod6b6T72HZnaJlzpWDdroxidtr9PfgDmPJI08CH+xfzFuDF6q44no/1HMm7?=
 =?us-ascii?Q?UF3mse9SLuGmD12RDp+YG69nWpHRvxr2G+bQlW05owIKLsoPR9O/JNYvDhFP?=
 =?us-ascii?Q?nc6tJ6e+ZHaWCA2QpKtsNoNqKoD/1qCY9O3p2vC2nmsa/glzR5WOJYUrZ9d4?=
 =?us-ascii?Q?0bzxpHgFyzTw+05qoyNEdEIxNzfIT2ev2edycRv6gy3mnVYcJZANBYBHHuHC?=
 =?us-ascii?Q?X5r4+lJ9fTzU1OeJb7zIwYtXbgnnN2tmpLm/tVKM1u1sp7Ui2LS8roQb7o/M?=
 =?us-ascii?Q?qF996XV7mxPaXr0nu/vAtAfg+exaELONtd1QmU0hv/mKSqzNTexyUWKuGIqB?=
 =?us-ascii?Q?EugQ4cTKVfJAjzo/kVRvF1+mLXrgkBC5LzgYX8zG3IyBEZwPKwJkC/MPSN5D?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KVG0wYBgKHD0rk2jqN8QwU3TCeJPVUPHgroWebqlM1v7oDCeXjXpVC+1Nv+KWxzH8uskc/HbWZP0hQGqe4fTgRYiNyqss8OerUmC7/rJKPLIsXE5o9NOw66mRVzH+fsTSyXpyeu+o3pnDuVdu3zSjOs4iNSDo7leXXssSK3uNV52ZYgyuzz9e/Ef8gxBXle0xDloGuL55RJTt6RHwFo+3AFrZyYcc+cjkmkViZfHFNnrdYhw7jemMMcHQF9CkjqCSJRgBb2sZ6k6ao1lG8j3CzL2KK0VYHk0Kb0a/3u5FXA5lrXsxa5b+o0dfupOMtfKmfyQ7ZO9o5VJIcsmSRBSWYNeEzt0v43SGCJclFKj0l91ng5Kujs2yWp13zd9UiTpmfgQ3ScO08V+o6hII3oC2SdqSJ2Lbc+hnXEXfgMwwmGx5LOicuvuWqgcsLzztrzkYFcErT9/u/CHxsqIMC5q19od766e8kzV0MAbbXBLlUUalcuo/wVxkIghrur56ctxP0zfsfGyxogVBSxLgL8/F+dvgWx3XtBhHU209VkLijfjR+/4pBhM7W9l5o7ysgPrCf+lDKrG6dWLyvI4SOj5WmnDOinijFQMkvmEzs35GCg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f722a92d-4ac2-40c5-85b6-08de0685da38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:15:09.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ik2OpgjGXvmHfxwdEAdxno87hW/CBmXI8cHbcDrKIf0kD5GynlTrXR9rnIjOA8q5CkKdvr2ixhXGuyW3lBxqsQY3zYe2l6RioZKJ0bvCci4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510080114
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA1NSBTYWx0ZWRfX5k4VEN+9IMVI
 t4CqOY9rnoWtUVT61fu0nExwWqvPqgBaQI0KT/kHzHF+b3TPU9SlUxdO7NJfKglX+2qCUkIo6M5
 YvKgcjtaQey6xROcT2Z6zJf2PYm0YTAipgSswscGNpcFKgul3XkEKtssBAWyO2DvUoQQjdhN5Ny
 8pKNENeegfIxJxY2GCSW4vJ+3vn3jt2bkhIEN6QEeWW/ZE2NTzXQ62mEkTyIgPXGw05yKrzv6fI
 QXRPNMsNV4WSSW2jf2VSCmhNBApeQbb97+z+P3Il+SxD5z8RebMNmjNk7pKgh401aXzHZZ8tZCw
 7LBOzboN5UVWZ55rgY6gsPvEhwdnm9V75JN5ElJO54uXJeMpdMYRwCEMSuGK4vwzHkEZRoC1+tU
 k9aMgnKNCWqCJRqnphnj5bMt8MIEqQ==
X-Proofpoint-GUID: OEbL77IajHeqyemteL283CFZxnrPhqM3
X-Proofpoint-ORIG-GUID: OEbL77IajHeqyemteL283CFZxnrPhqM3
X-Authority-Analysis: v=2.4 cv=I+xohdgg c=1 sm=1 tr=0 ts=68e68e15 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=sryLCrZOGSY_B2-DygQA:9
 a=CjuIK1q_8ugA:10

On Wed, Oct 08, 2025 at 12:16:42PM +0100, Nick Alcock wrote:
> These two tests probe on sys_poll and just hope something calls it.
> On sufficiently quiet systems, nothing does.
> 
> Use hrtimer_nanosleep instead.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/fbtprovider/tst.return0.d      | 4 +++-
>  test/unittest/fbtprovider/tst.return0.r      | 2 +-
>  test/unittest/providers/rawfbt/tst.return0.d | 4 +++-
>  test/unittest/providers/rawfbt/tst.return0.r | 2 +-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/fbtprovider/tst.return0.d b/test/unittest/fbtprovider/tst.return0.d
> index 0b7091b320904..f06120a55e5d0 100644
> --- a/test/unittest/fbtprovider/tst.return0.d
> +++ b/test/unittest/fbtprovider/tst.return0.d
> @@ -11,10 +11,12 @@
>   * SECTION: FBT Provider/Probe arguments
>   */
>  
> +/* @@trigger: periodic_output */
> +
>  #pragma D option quiet
>  #pragma D option statusrate=10ms
>  
> -fbt::do_sys_poll:return
> +fbt:vmlinux:hrtimer_nanosleep:return
>  /arg1 == 0/
>  {
>  	printf("%s %x returned 0", probefunc, arg0);
> diff --git a/test/unittest/fbtprovider/tst.return0.r b/test/unittest/fbtprovider/tst.return0.r
> index 53308c30f27ab..e4065e20062e0 100644
> --- a/test/unittest/fbtprovider/tst.return0.r
> +++ b/test/unittest/fbtprovider/tst.return0.r
> @@ -1 +1 @@
> -do_sys_poll ffffffffffffffff returned 0
> +hrtimer_nanosleep ffffffffffffffff returned 0
> diff --git a/test/unittest/providers/rawfbt/tst.return0.d b/test/unittest/providers/rawfbt/tst.return0.d
> index 0146d684f1033..3a39740071c49 100644
> --- a/test/unittest/providers/rawfbt/tst.return0.d
> +++ b/test/unittest/providers/rawfbt/tst.return0.d
> @@ -9,10 +9,12 @@
>   * ASSERTION: simple rawfbt provider arg0 and probefunc print test.
>   */
>  
> +/* @@trigger: periodic_output */
> +
>  #pragma D option quiet
>  #pragma D option statusrate=10ms
>  
> -rawfbt::do_sys_poll:return
> +fbt:vmlinux:hrtimer_nanosleep:return
>  /arg1 == 0/
>  {
>  	printf("%s %x returned 0", probefunc, arg0);
> diff --git a/test/unittest/providers/rawfbt/tst.return0.r b/test/unittest/providers/rawfbt/tst.return0.r
> index 53308c30f27ab..e4065e20062e0 100644
> --- a/test/unittest/providers/rawfbt/tst.return0.r
> +++ b/test/unittest/providers/rawfbt/tst.return0.r
> @@ -1 +1 @@
> -do_sys_poll ffffffffffffffff returned 0
> +hrtimer_nanosleep ffffffffffffffff returned 0
> 
> base-commit: 877fcdeb25b370be182d51f27fb4bd8e4f739fb1
> -- 
> 2.51.0.284.g117bcb8de7
> 
