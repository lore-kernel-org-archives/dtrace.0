Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97C1E8824
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290382; cv=fail; b=TFmRV2OsbJshkuSAaqMTABpw2Ie1ZnqOCqoR7JZB3PN3ArXjR2m0UkmuZZhhQi7LphLPMenf4QycZGO7QmIu8z6cfgb1epx/LFHbzDEungWVz3sG1kspzMbmq+G+sUvMsNbJaNpBj3HNEAA9ykCkz8nO78VCuBUykeiRUmvw5bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290382; c=relaxed/simple;
	bh=iJlCw6/oE0TTjmI9WiQ80KlrG27OpNQPWo4S3rUHSw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUfGREvrjUE8deqtubNzN6TFcEgu3WlY0n4rmvGH/2fumbqe9aIfyRcCrLMeSLDvt0aVNoLiBoyaSlot8MwGtN+4Qx6wsX/wwxmD1wDN2a7aYm0+4xCk5WCUXWzgabYp21Bga5/e8SJRflTJgOrHXCwvk8h1NgRNEtZrC2ejeOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VreIATlx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FYPls2Cu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VreIATlx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FYPls2Cu"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1feAI012573
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=; b=
	VreIATlxM5Szr8CFVxe6LYq+IWweUh8QaE3tQTnIFmndTW9Cg8fMFcine6JghPsX
	oxE/XeHOwnzlDLsHduILRzDGEaHL/HK5AyQcH4gEIXzWyrIz7cNg7UMJ6ioR4VGP
	KAGafgI59pwm1BWkKH4s6YZ61pDaBNG/DMxyAKGkwJxZOdfGBoks0xJNweekCGed
	zjXxFSeSNcvojZfii/p/3STYvpFKzxiOij2Uri671+xMcd7mAmmH99MUJRFpifnj
	mF7SEWMccNzOVUQcn+XEYo88mFzTcTreia5e4WWhtutvWChjaG94fzobwTB9llTA
	ZsVmVwMwzqw3jveFVLkU5g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys7vd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UASfO7011166
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8y747j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB3SNsUCJ18fHdKJd+UTl3jbYaXZ4u36znlMfhNAgxiKrzBeZuTO+DPX8wKi01ZRsOJ3XaILKqxuydFPo2UqpCF78POG94U9WEGGWYn+DjfDvoMZX7J/1G/64YIK0MtomFyULijxfKcjqpZkdbcvRWgCJL36Z8YdJoDtBa79+PnvktR1g+Wq4AZGw3uNqWR+M/s3q38Kwnq4VjWo4sPUOJu/nKPURCsC7YsA3kDrpHjM04KEcO/AVG2wlCjXKOVpD2qE+Krr2nuTs3OTwpwJ2RjoUALRvKosbpU71oge+U/MfwOZobn0TF7D43/UIzfAP8ZhOW3ZaxSdAMJBkFm+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=;
 b=UgL9H5l00pSgDmOLmUSkxc8gPH5HtcR0EKgBGtp+XbS/1jxAlyyRMwVQPhce8zRcU9BtQYVtIE1PV+oK+YUjJxwfiTCYlyquq8CgOZGzkMXPy8vNbn3EpEy4QXnRELXRnMt7tmquWX7xjF3vhoZUuIYIUPgQGN2ANNULVFh24bl8MkWG6/W4wqsVQ2YRlrIxCNQlmeA0DMVgt4rT1Vv7knA54Xdghe56y7SRTTSP/nbDn++WeMOuDB0dFXy1BJZEipta0uW7FLRMTPVaQBTBrXcmbYqW0U3JX13hwYcK1fibu3+st39otg+fqv5y+8XrQCUSEhMptXsPZGPeS/n6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4nADZ1XQG7X04pqN1jXT4D1fsIn1voE+ohWI0Xpojg=;
 b=FYPls2Cuu6plOiugp0xCfQ2bFTqkjrcw5M2i5ozAUndE96iX6JZlaDbOVhuAHBbrNvbUrdpniHHa5l/zH83mki6O2sflnneqyvYHLQgXUCxv2Z44Blt/pIIWhObBd8RyTHWbRTPvW3eP1ujwRbw2VL5BPt7TZd8gsM0kGvsXRz4=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:56 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 07/14] man: the synopsis is ended with .YS, not .SY
Date: Wed, 30 Oct 2024 12:12:29 +0000
Message-ID: <20241030121236.257803-8-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0478.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::34) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: b0006f53-bbd9-4a79-8358-08dcf8dc2feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Od4CtjDtG4YaVUFawYRXLvv86i3YqjIqflICtYRn5NKgrj3kkcDmB9cjTrzp?=
 =?us-ascii?Q?dIUgECAtcgsv9TwR0MIOh3XWQMqPoJbLliBYSdDpadLACwW/fiyf8/Y3sOGx?=
 =?us-ascii?Q?JAzGwamlBe3UjvyTzYpKWUJ8s6XOHxghdVQyHV1D/93EYNJ2YlV9sP+u0gis?=
 =?us-ascii?Q?gNs913ymGbPuSCoUumH7ydTVnivrh3r/t+OY5uVic2fqCBmMVd+orauneMh5?=
 =?us-ascii?Q?Wya051i+I8+Xh6Jl4DJeaOC6A7//tkN9mf0pVvcBBuKS2G1LSusyba/SesEY?=
 =?us-ascii?Q?gWzGysPR1pAW/b7eMUeNRbgjw2tUSuEbnMADECyYcMick8wPbT+zkgblK7rJ?=
 =?us-ascii?Q?50W+5A7eRrefCBJvdjAIYFXdfKUFzUYTs6tWTyG0he1ZR9jjI/NCxSqIKhrb?=
 =?us-ascii?Q?zTzmWGR81K6Orln/rph8mqhVKhIm5ZbmvryJQsKEYPT4AN7cRyFc4+pWow8l?=
 =?us-ascii?Q?U3onDIhdNRcHQar3Jt35WT0CbhQ8NFQYwabRLwKVVExYHUVbHGDdbtObzV28?=
 =?us-ascii?Q?mIX2zagMV5Y19Ja+oId8tfhJ8BI8uTdq2BpjBbVeL/YZLvOQbPxMOK4WJueZ?=
 =?us-ascii?Q?nNek8RjUkDNk0DZZGEAxSNs4S/ZUmsobhnMJSATHtlwIWqTEKLVuSH8tE4sl?=
 =?us-ascii?Q?OULoKOZbmqL2CF2WM+yE9LTrfl9VCOJa1kNoNwlxPDTw9IbU5EULRM+8IXny?=
 =?us-ascii?Q?io+yu+pXhCgZOzWVe7qba+TTC0PmdJ+hzTPOf4y4mCVoHJoek1SnEWYgpPpA?=
 =?us-ascii?Q?tbRT2Rb1QkDPJENDA7hJYO5dwou41nnjOIlQRfk7JO7efIE5e4lvIwwfSI8C?=
 =?us-ascii?Q?CQX4l+SZOaPWJ0CEL22glht9YYCtt30bSiaZQ0G39z+VZFFvIEtgUtsWE1xi?=
 =?us-ascii?Q?rO4EYK1BN1Dcuf+BChJMEWhKYkh83rx+NhzA2ip+dNpMl3GQGCmjfwBeMlVQ?=
 =?us-ascii?Q?3GliTidre5uH4bvKMjUBPPYdKUxHzOBsKVR/1yEjkoDVGcDKxhNzpR9r3PAv?=
 =?us-ascii?Q?yoNIs71jU7Eh3eghZM+Ry4dX5NCdrwNVZfzvDtKVIGtaSJLM6599qhGlNjCW?=
 =?us-ascii?Q?W5aSlheuS1jx0tMnnedVwX0DA/4Zi/QWEPuMcSacYG2AFqT2B1CFu3RSn8pC?=
 =?us-ascii?Q?2jKnTMdqFnmH/dYFJuTsWIeZ/zYeoWv7DsGvGJEiLTWwxuxaZq7NbVoeICr7?=
 =?us-ascii?Q?mXBBgysPhIyaNpZNv9DTOFNVboM68b/1hJkBdsiLDCtP4X8q53xI09W4HCbB?=
 =?us-ascii?Q?/AOL7OVI8fv92mNybxODm9gq74kGL+yc3Jglcet1BFNwIoAMQi/sYEU5D+FG?=
 =?us-ascii?Q?Xy0f9IYQ0JfIP95E1b5wj2Pg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?164lQNoSCwTaJdgQxR+CRpIQGJ2RYxAflyTpUSTVnDCrcR6BO4s5GwzKSZE5?=
 =?us-ascii?Q?04aUUfgfqZI49xISX2HHnCYwsA3EIPFhbimgitP5QLY9szylnCDqu8i06xCb?=
 =?us-ascii?Q?7gdI8HpLfnjYRmQiCnrgXQHwjx34KxmYWaoQHAwbL0qTTTRBKKEOdILIJlJY?=
 =?us-ascii?Q?qGVa8oINlB3vomWtIPMiSJYUl9JPUEE2JoHkpSNQ1/zovuheqHTQe/8TTIKv?=
 =?us-ascii?Q?lLA7CpfJAgt1q7reUhIjP38v9JBJV72sqYlqT7weQoGpQCIcBnigxVLe5GGH?=
 =?us-ascii?Q?VdUiZ2fUbWcdzZwXi6DV2SOmeOAMJ/++6B9RLx3HXvX0EsQYWx+dQwyA85ru?=
 =?us-ascii?Q?D4CE9rkYs0M9J+5bHXBOUIGA7fyKIPuUlNQ2QybkSDCk1MQfZ28wZU/aU6he?=
 =?us-ascii?Q?vbMXChYvLpCjqs1aOJ+WfUEgRp1j8GR/ddiN7Q8X+pAsT4hROAaBmsDa/Txo?=
 =?us-ascii?Q?I1zlx39ucR1ONl4q3REhKZaW6bEjR20JAVEUMu7tfYu8wufuY6BRdllFM6YM?=
 =?us-ascii?Q?5TSfcXpgWY1/ew59zwNwo5XPuos+F5YrdtZaMK1Oaalgg039DPk1uiS8c08F?=
 =?us-ascii?Q?cTxj/XViiT9kHq2EMrclxgmuZmLjbdmq7CB2lC5pGdl5zJumVmC3eHix3+ME?=
 =?us-ascii?Q?iYvkV6Q66TW+fL6CfKpYoDXj0hYn+AMxogvE5NEq8OU14DEFz7ixfyZz8Ehj?=
 =?us-ascii?Q?/zLJOGXFGkwiNnbxMIv0EnQu4mnDzxSMbMM0KmBFjQzExfrdcuXvbX57hEnU?=
 =?us-ascii?Q?p1sB2lSnAFh0LJYHX/87EVyuH+vJaoOwoi17gf3SbA8BYFrSV7RJjaPaD1AD?=
 =?us-ascii?Q?6yp9gQdUfPHh5w4IiZKrHKldPymBSpuRrKhhOLmg6LCdfCEYrUIrJ3VfEtQJ?=
 =?us-ascii?Q?dfFX5EGOe1xCvzgk8RIHYQYJXYH+1F66WWLNAmS1bjd+jQh5iE2hzsVthiaw?=
 =?us-ascii?Q?Lnqybo/1l6OTYTEwYo6jZau/xgURTHyPUYzUG5ur4tK6nPnR6C4SMDfvFyFg?=
 =?us-ascii?Q?T+Poo4j69FeC8TWgHwjMTjJlNJlUgbRdh17Ni4HFfQvSeK721m2FezwnaYd6?=
 =?us-ascii?Q?oe1Dr/n/UTW2rsOjT15z9QE9wY3Wic5/F4j3+lNwK3/fApmgM3fiNKa3ZHPU?=
 =?us-ascii?Q?+f+Oj4pnEZcqqK1sDq6OTZ0BGbExkr8w3WQPffZr46j7WHg8GTF3EAyxPpwU?=
 =?us-ascii?Q?kW4p7XhTkobIE4+fbtKZ1fPiz3H+eUU/YXUSQAmvuXqrDQbjCxf4oNTOS37v?=
 =?us-ascii?Q?nVu8LYWLvrm26fusKQSjAwdfQWb7FpYRfdibx8VLRFmxzlJ1R4A4CRp3Ke6P?=
 =?us-ascii?Q?YOhCzBr9BiQQEVvCyygFDkVLsuoLW7IugClPDhG9Y7yFTANaHg26UeMJ0Ndy?=
 =?us-ascii?Q?jP9XkqctfJJgnrdr6SkBLcOnJjYs6WaxLkGVjN4NrAfXHK35/zhtyNyLadTB?=
 =?us-ascii?Q?fuuHBRXLFVOemzfef6R+hBf1lobh2Uu9d/XSJGbFe8VPLYUfn7R5a4phPKLk?=
 =?us-ascii?Q?Ly9/z0jjUSxVElfMJiGuFanqlxUAY+EPVQ1vDVPeFY8LegenJInE14gIhYXc?=
 =?us-ascii?Q?8eSUp0OavixT9Hb7sflYwBnh0jCpEwGRMOpEkxuQ1gUzGGE9hA7CRHMc3+o8?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hw7HxponqkC8UKFjbLNV6pSmNkFFrXrrTvIsDeDatYWrDGjBshxSCNQS8PhVAGtYwOZ3fLinxhwr2EzTsnmNyzXP5fK/zDp0yIK7dsUEc05FN62gYy1+G0RvtbZ4mEa+e+KA4uiSOeWAaKvRUwMkGssBCR5wpgVzBhyhatiXNjwBivaDeYOzXXduxBA7yxr2tyoBTZrzB4pkbNGLC4C6sya/LRIbfmE6iSjpcv8aM3+ck+dtbXhAK13N6IcO2KkYzKnWnM7tvY5stqlkqOptxwMeSS/ogd6frNPEkHtaELr+oov8Cncb6gmlW1/hzKanI+jHgDfAyDYPO02aVVxaXYhhVbKm2jZbrnfrvGIvj8zptczEyNQMR72tHIXg7qZxn5xb+dOvsEAI+cLBfsPTmf42mD+5CHDEkjq9S9Bnrcg+CQ6aEszh00nvsuduZRiFq7UHUlY9glYp1Zlxj0Ecl1SIGCtfiR1JF97iJgwclg3p8CVSo35EIv7GpRJPY/itA9kSwpu/ATRIoX9xEEK3xKsJ12UfZuF6YTUBSdqg09sR7oIjpld/Pf2feYvc0I8YIcwUixr9VEBwm2PukVlx+yNsgwgBT2FJM17BlxOhEXc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0006f53-bbd9-4a79-8358-08dcf8dc2feb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:56.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umdiFlqXT+kLbiitciZR3s76Ep2es0qrKxFIAdfFyQ6m9LdX9rDo+BKp558Hs+8rmC8v3tVsCXHQkt8sffwq0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: 8oHxL9ScEEGgmUIAx2m-0_5mPs2e0ud9
X-Proofpoint-GUID: 8oHxL9ScEEGgmUIAx2m-0_5mPs2e0ud9

.SY *starts* the synopsis.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0a1a15304aa1..940ddfc65d1a 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -33,8 +33,8 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .OP \-n [[[provider:]\ module:]\ function:]name\ [[predicate]\ action]
 .br
 .OP \-i probe-id\ [[predicate]\ action]
-.SY
-
+.YS
+.
 .SH DESCRIPTION
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
-- 
2.46.0.278.g36e3a12567

