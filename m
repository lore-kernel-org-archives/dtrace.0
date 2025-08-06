Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2741FBEA8
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754506164; cv=fail; b=AlYONNVK2pgTDgy97kdk7HWEUxBpfa6IHqfko8wlucB+oCN07OqbI9yEmN4HaVRwm7AfyOGnmNkPomtIGEywxhwdad+Nm9attZ7puOMKTEhfpD7RIi+pteqcBcT/rrdiCgreZjig8gHT0VyhFhKBk91Vq7QzO+0tMFEoiviskzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754506164; c=relaxed/simple;
	bh=xKhb7HwD5GXOQrhF0r0tlsEcmTbSlyOYkClP3eOmZBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UAoxL0CXWZmScOnMtOa998yUN3Fyo9EngIFImSgIWoAi04MIzqpwopYzsM8QgH4eaMdojoWc9FDJyBL8NT6HKvvew5Py0Yl+9H5nWW0MOOtMYW1iEuEo8q7lO+uHb9o1yQ4y7TZmZ67F92MbSCze1G7MVQBZJtTnNRuf7fOVodM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z/AVarMb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B5aaHTxP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z/AVarMb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B5aaHTxP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRQf3013521
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iR4m5Va9vUBG1rScu2
	OJVTBE9Q240/5AVT5u1ONixR0=; b=Z/AVarMbn6Je/p+Ycda+IzasuTIHE2lemv
	YhdWz4awmgw3Q6bI3SswE0aRtVQspWdoIOzGoWqnHmluWKX1I0TfsEdaGodCc4SB
	S2Fb60s6ASaAuyVbwghwpTkm9diWBUfT3INNXiD/KDTiXKYnrReH2B8CKOaAumKb
	8r7eSuU+awMolcpkr106IJyxflZIKbLpGoel1Ch2QLvh+q1Vk5m7EsqQWhXmLS5i
	nsSYXCy5+ujnn1bnVK+G86kqQ9M2rd8Yy8F2fMA9h63RM8VW6Ad3QAmZOO8ItNGo
	zY9nyDCtxhOTOl2+2s+j3uhqLw3WiamFZ66kiJcgOIygyccXhGPw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvjtbn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:49:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576IPuun027065
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:49:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwnddq3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tI5+8oUpQYXuGMdD9sUeNdef2NbPKQUVeNszwqjS6MHqFsinLubiegYw3IpTg0+I4Tq3gru02qPn458t/FtBAJgZFn+ibSvbqfORC2eL4jXCROVMs9FUtyrRKb5Sva19QvA356Pw95SvGmJ0Fp+WEsRXbEqiULKYYrln/phkRKdMh1S+FR179bhbFFBYhJL/qxBm3WQAuXMXvByeigTsxADZ55t6Q3DUj/0hkVY11ZU+/5bC7ldn9UJh+Xw2YKvy/rCXRO1H9JKQ+jE4ztWeqNxsnkvZaFzneOaxDAUcDPeSEFiEybGhXzrzemqhXw0fhfqXGGY3d3SUNl8GM2S19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iR4m5Va9vUBG1rScu2OJVTBE9Q240/5AVT5u1ONixR0=;
 b=rdcWK24pHj9ZT0bAU3hVgQ48FlA6Qc0xrzEiKJpzkvzza26FvZZjN7jnEMEpMVOB7zaftOWiiwR3M489SkuGYWkePO3wiwm5PNSGMZXgq+fUwzPZcPWsK2DWph/lrDghQxSak3ep0vKUqHHOxKLyRITUGRLLbC+4RWZV7ZwEmRA9i23jNqNWA7Eg8ETczEbpqpznwKgCCyBbQBRciyjatD6uneidOfdm2/5VXwyzEs2ywUkyn7YMVqYYMRpMOlxIXQ+4Ovd1B5vKsU2caGCaQoucGRMI5IDcVBXc2dZcf3emVlmYvHg2W5BwDKkHdkzRohUkvA3YJrsdxdF+p/rglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR4m5Va9vUBG1rScu2OJVTBE9Q240/5AVT5u1ONixR0=;
 b=B5aaHTxP4b80Xr835GlV9HsgLc3c+ykbzTIheMlTZ62ZJSX9Uu6cfEb+KUvs7Fd0CUkBZnwWcaCBYWqBMO1vRqZtIu/ZKmk9p9xwugOPHLROm35bUhOhMH1AvEfH2+7rfH3I3VPUW5czPtZOnbt/V0609X0fjioQFWqLgG0k/N0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB4878.namprd10.prod.outlook.com (2603:10b6:5:3a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 18:49:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 18:49:18 +0000
Date: Wed, 6 Aug 2025 14:49:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] spec: drop special-casing for naming of OL10 BPF crosses
Message-ID: <aJOjq8/HKKFodt+P@oracle.com>
References: <20250806141036.2263-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806141036.2263-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: 4756e169-323b-4c75-a1a2-08ddd519f2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h7CM08bONxpsYB4DRm3PWWinoyHTfXTE9shDytSwZ7ba1WDGYgGFhWCJktoB?=
 =?us-ascii?Q?GhAAOzQzGWbgM51BGy9PLuIMgrD4NweYPln2LpdnYkam1khEdouDN2HWwKKz?=
 =?us-ascii?Q?PYCxYsQri/bYzxkwu1fYZQWQiNooXD+eraJh1C3jWwtiNaZxTFbx27nZpagP?=
 =?us-ascii?Q?GJro89EBwyHJJ5c8Js1ByVaJtG3Ep8X8RxJEZDyMHR3VZZhRfR9hiiGmHkDs?=
 =?us-ascii?Q?M7VNRPtoFEukAuGEyQssM8c1dkRX8V93c1qCKi0QflHlIYcb4I2N0vjqMlru?=
 =?us-ascii?Q?fQBElj+NVMU38z06T7L4f7KSoKmS3oeyrZpEOLgUUVGcl/fk9h7C4ue5MPD2?=
 =?us-ascii?Q?RBXNX+UkYBoUWOYVCgnn+Oq5p5ppvcn8IXZK2lkjXML0VI1wrzHfqvbySqeX?=
 =?us-ascii?Q?7Kh06O0E4benLEQOJ7hQL4iZrzmlqdDaTUamRJUiSRzpD0iKREzrrFa9YoHI?=
 =?us-ascii?Q?99nHHX+QZNawoHMNe8Rj4fko3ccwqP7PuOpF2dZEmaRW5YzWr9slrndyWDYC?=
 =?us-ascii?Q?b2XndBsxGX5KhTanf8uHjTrP8bQ/bsJyVtgb81RDZFiMtB+rfwp7W/wyjLCM?=
 =?us-ascii?Q?gHlaNBDBDtbJszxkagiWdjUnpZaAg7mFwyPKvfvcMCU1pbOAnV4tBznU8ulM?=
 =?us-ascii?Q?aABm7DagoSVk+JEhZMUVdekAYjwFEKJjBwxG5Z5HREF0ObHZmDQfjdoyQ0ir?=
 =?us-ascii?Q?f3P9BSoYSlFD5FTt/WulwRNMqu93rGhwlD4GKc7UXWfAfzpLE/QLPcbHnNxa?=
 =?us-ascii?Q?AVOPRfPMHwG9/O+VdTCFtKJXPuUMQzAbv7PlIS5IiaJZEzopdTUzC0jxhfj4?=
 =?us-ascii?Q?IqTn2QxQgH1vkbznieE0cTSznOQw6AXT+9xqpEgLDjLYVGdjVvYp4hbMEjZM?=
 =?us-ascii?Q?4yJ58McDMUcYfC9codcw3H3rodR6GDVK7q7oaiuMWlOPhpnyW0ofwp+Tcu30?=
 =?us-ascii?Q?lChI0TBCzuesCFaOdWwFxSl7fvgTIY8Uo+AbhPbWZ6cirN7AqiN94G8wXybQ?=
 =?us-ascii?Q?cd4xhadRcGdE71q7z4tAC3nvVnuhwBnEpNR0PEFOtYmv5wtGVxHpiJs63d+v?=
 =?us-ascii?Q?m+OVXM40eij54Bybh645qtWlshbFduPo/HmmmqScSy+zYiG01cTUAS9A0UGg?=
 =?us-ascii?Q?TEAEvhoE9zaYdwcHJ6k6VrcJGcX8MwTP4svhcnCwgglplG2oDTxl0QHOeDfF?=
 =?us-ascii?Q?qlBp5HDYmCJZckJwtEgHbJRWbRXSOqbqBbVnU5HEMEu+pKU577X5XpM0TQIL?=
 =?us-ascii?Q?pRgyg2XpdwYy43YSmJibX1u7zuGx/ZnOlzTrgbBeEK1Q1ydzXMKyWw3jV+fh?=
 =?us-ascii?Q?PjVFEprsBB+lxcVkXDWVjXhTPjftS8ASy+01Jh9xWZr1DZZM+/524cEcB3uy?=
 =?us-ascii?Q?AK5sxyGMNTmHaVZTwJFdk9rMYR6bcIe741lhhZzXCmyfHM6s3kbUpQewT4q/?=
 =?us-ascii?Q?P9DbWme3/Ss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gRahmU7GiRsBx4zfhqLIiGGeMcyTvXk4nfy0jrfgbmb4EhPxosd+RHR3sUW3?=
 =?us-ascii?Q?xIR0NaWzaDA/eLBcBlBzxlYCEgpXeqejldE/Z9bTH2IerajO3hcQoKkMWfgB?=
 =?us-ascii?Q?TeXJ/1S6YAKlfntBxOtdtD1c1xmQMUrlYJCSfFTHqYdMx+YpMjlPZoXioiVo?=
 =?us-ascii?Q?0IaVsnQswM02rMF+3UiclKkLlUzVjtcysv7BLfCagNKms6Qft8/wTDiE6GY/?=
 =?us-ascii?Q?x9bXQQlgqcx8SXkVq4yuh4/JoJn9WVAFRfGdKE1fM5zliqvNlG+2aMvIt4yO?=
 =?us-ascii?Q?x8tJl3+0a4+k/UvIVwVN+zH86ziQSe9a/wxQvLAx+eCSvpP+p07ZSax1Bax9?=
 =?us-ascii?Q?mhbwpUFcybSeWfymRXGV6guS/H4mWvnQ5DA9C2IMD+IYCBw5ij8twEWPmG8U?=
 =?us-ascii?Q?BjZA7GoIMvNpLC+qHB9Lau3t6z6+iD1YXJXNVRP0pgRsfZY3rJdFQaJFM47X?=
 =?us-ascii?Q?UsG6pleNJJdrHs2zt0NukGzybWOPJ4Ae1pfmpk0Q1Y1DyKvLneYZgBwPOjdw?=
 =?us-ascii?Q?V/ty8TUfc2WF558ktKQurmLCTe8xQB/v35XRr+e6Bm0u1T/gNMUuej5uTbtj?=
 =?us-ascii?Q?g0W7CMdwGyYyftWaMVp9GJ+iRH9uwkL2EXnILL3gMV4L1J0qP7c/OGb69C6+?=
 =?us-ascii?Q?krdlFWzmKoA2v2XfGRRWtsjdD9KpU+8r+8wKJvoK575B9YnRYFSnVbBhr0gY?=
 =?us-ascii?Q?B5Lyumhb7FTNZkr6magqyxoS6D+1HaObGcQzV6rK0YORi7gu8QpRfPPffxyE?=
 =?us-ascii?Q?bTi2LX8ZTRSEzGcgpu2wt/0QSFTPkf+o70+qcV1uR6UMfXtYSbWFOV6r2Ha5?=
 =?us-ascii?Q?fDWfDSKZetJnMzwFBAzQ2mLZudYmZFABoilf8M51ZcOsQkyciM14u8VXI+oP?=
 =?us-ascii?Q?d8bOcglTLeJTQYriw2BizLBEUByht7lDdvr5OZzuOchzB5i9arJMwd5rKcD4?=
 =?us-ascii?Q?Gr2sQkNboOHcsfNJh1Yvr8Iip3PR3FM9E8aQMkikHVsu2QZpMHyAKoYM1yti?=
 =?us-ascii?Q?wFZxj1i3U1zJQ1u4TF2s+Rt73bZ6JNo3hZu8JlPoIWy5mXZCe2JlXFG/xuwv?=
 =?us-ascii?Q?0SBCsjyedbpjBc2ICNKK0Er8ch5tDX2CgDmJbaZ5CRAscjG5Wdid8gpqYenE?=
 =?us-ascii?Q?S7nmcV+Nko3J4eSZU112vUu0LQ3FXhq6oca/7l/FCyTiv18oRB8bs9w4TUVy?=
 =?us-ascii?Q?DNMGJayY58RjVGWka4UHDe+0u0BR0uubPDuxeigIkFjzxgu0JwYGlXtXBMjW?=
 =?us-ascii?Q?WF1MrK1C5p3YS1A5tXOY0GBQbNjGqkU4z9Nh0wvBNhPHG/8TFzaG3YNFAdnf?=
 =?us-ascii?Q?P2irLl7XO/Y8c8DQwIOW8h8KV0VTFYDXC0SkittRATDULEuKuitlTnLWtspf?=
 =?us-ascii?Q?QywWNGk1+IOZS5gafOaNdestDB+5MJXSTBNWJgPhVzRTMG+ln1v1aIZpETdV?=
 =?us-ascii?Q?nEIjWM9GluAAqoOtBFrM+mtcBIMsG/bVC03644zC0XgA6N9KjZ4dmdzZyDim?=
 =?us-ascii?Q?i5fOSKN0tPR3kJGoHWbUVfodrhOxST2kJ1Mh6ey7s1Wqfi72B2oXS4pJuxjI?=
 =?us-ascii?Q?PCk4VIobdevvmbq96vaJp7Qaq5Z/2U8DC3p2CYPSrKxvHwgAFRhucijGKcc5?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rR28ICy6i2Kw9lB0XZaPdr54nb86pyzQ1NZMyYIEIRZ0sC0a8O38Eqpi0nodj6Re1wfhUHisUjvVJ9bBCzpClyTTjqPyYzrxkw4wwpF+5uk2QgjeRU3nWukPmlz2KWMQhdwiDoHb/aaddxntAe5otvpVdGaEtwju+zfE989t0BaTX+xZUjQXeZVjSnU7JTulRQNcvfXXSfIGmdMKrRfRBSaHNrYlt/slB+jc2DcujswACdVM0jHOHqJQN/+2kIerfnyA18oCyw6LUierLr2tvkv1SrIIc/F/Ei3oKbDVNGpDI10hZC+1aJq2Fnp8nM8Vapsz8xXiZwYMtnpfjvtc3/EpbUsLdR7XZ9NHR4eYW8O+r96p81GvwoM9ben+jE616Vlf4LiryRD2Hy9XbY5yPeHvS6DXcOlNKnffSVTCLjnwDIRtumzPlnGd/IMbpc2UJ97ny/qZSddIn83Z0qW7suOQBoMerVwkjmEDJks7bGDH57Y+P718fy+3C/mHtaD39EJFa3oGZrcvByK52nxU6p9enFEcwL0bOryg4omQvk7RpcY1v3hV+8HTJPShWMgcQg/9OVQPI/qddqH86AE8A5qshqfUU34BSUDKnHeawzE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4756e169-323b-4c75-a1a2-08ddd519f2a1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:49:18.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MINYRsVGnUytWi7miMnuGpP9w/YM+tiCNyfryKYDICPXR9LL6tCALQMg2ZN+PALn8/yCre2DbS9xo2/Lrqs9pofOKzOZ7Ravni9paKYAFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4878
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060125
X-Proofpoint-ORIG-GUID: nnAD3NK0kAs7fDNq63mA6Kvde0ffFEXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEyNCBTYWx0ZWRfX/nbTc6rkbDWb
 joZFmB9PbKSIUbUGQKx6GStCvPatNIqn8s+UNQgdq+6RXzD5tyMjK/OGz5jRPcXrfglEGeThpYG
 Tjk7pNb0NGwso/qthMalGArZE0egb8VBXKqVQkSqI6sW6Ydz4e5/qhTDreuAjlNuX12MpcXfVZq
 1ku+HUZyzT6MM45qKFp6CJEwovwQmUTU25714C/igiswq4ibnoIVIFbgr5lqYKqxQAjBCoHHFLo
 xKwKOG85JIFzZfW/4/3fYfogt8FWZJf3VwICvXB6+eXjWgcR4qtEHGyq5IcOwB4uTvs8gDocmrO
 5+qHm81ElNqdU8Mn/c7XmAP8W0f95aSZc2IkVDoHx9kLl0heDMMgOApGt9XEOqQDG5ofCjCaRm9
 g96NoNbw/nDSy9mUrsJX1t0LlDpzQHaPhAQTjIWKMu4UUBdBCtqiaQmykpKFtp96gUzFhMn/
X-Authority-Analysis: v=2.4 cv=dobbC0g4 c=1 sm=1 tr=0 ts=6893a3b1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BzIkwe5c8Ps58LbRqToA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: nnAD3NK0kAs7fDNq63mA6Kvde0ffFEXB

On Wed, Aug 06, 2025 at 03:10:36PM +0100, Nick Alcock wrote:
> Since 14.1.1-1.0.1.1 in June 2025, these have had the same name as
> everywhere else: no numeric suffix.

I checked with Jose and the BPF crosses are not available unless you use
'scl enable gcc-toolset-14-cross-{binutils,gcc}' so this patch is not
sufficient for building in OL environments in general.

> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtrace.spec | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 115cea60ec98b..2345ace1bc522 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -17,15 +17,6 @@
>  %define with_libctf 0
>  %endif
>  
> -# OL10 requires an explicit BPF toolset version.
> -%if "%{?dist}" == ".el10"
> -%define bpfv -14
> -%define bpfc BPFC=bpf-unknown-none-gcc-14
> -%else
> -%define bpfv %{nil}
> -%define bpfc %{nil}
> -%endif
> -
>  # By default, do not build with 32-on-64 support.
>  %define glibc32 %{nil}
>  
> @@ -58,7 +49,7 @@ BuildRequires: fuse3-devel >= 3.2.0
>  %define maybe_use_fuse2 %{nil}
>  %endif
>  %{?systemd_requires}
> -BuildRequires: gcc-bpf-unknown-none%{bpfv}
> +BuildRequires: gcc-bpf-unknown-none
>  BuildRequires: binutils-bpf-unknown-none
>  %ifnarch aarch64
>  Requires:     binutils
> @@ -132,7 +123,7 @@ it always tests the installed DTrace.
>  
>  %build
>  make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
> -	%{bpfc} %{maybe_use_fuse2}
> +	%{maybe_use_fuse2}
>  
>  # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
>  # and the testsuite requires debuginfo for proper operation.
> 
> base-commit: b420f057c85b0a57bc31e106aa2440b2ada3a4ea
> -- 
> 2.48.1.283.g18c60a128c
> 
