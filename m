Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBF314B6D
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016801; cv=fail; b=TVebfwePjXS7IurjeH2K2G299fikbLLC9Lk4i5KirhotD2D45x7clw/7XERrS/rG9OlaAmbN2Kuv75KgFAHCxKRlkVm0NbaCqfM051oNh7FV2WuxmR/Pti3/dLwH0KOJFSLu1ZLYoQl+ySPeO1YrMiilMnk764iwG9wIE7fXJ6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016801; c=relaxed/simple;
	bh=TE7Cj8oxFvA7f0WnJIEt49QfK0yv8iIF8q8fmEUJ2+Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iVJOlLtiLfCsR2xUERu9JuiLN58lpAUGzAVs1cfrDvDwea+XrF8zokLVXTNYgRNRvAHpEGKbhk2iQE0EQmTxEjGzLUd3jb5cHpntfL+R44P3UerRXAE8Da7Ewo41/J/GL9uXYOlbecDTEG3Fo4WhcNzyOWoqAuyv3QENWbaRn74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S9UVtM4n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FsAh+aqN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S9UVtM4n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FsAh+aqN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6937e2Eg640228
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NhxISvTdClQHcUxgkZ7Zu+N/jtdlSCSkipCTAvnWGgE=; b=
	S9UVtM4nc95FQXMm2FQKjAWFtcD0k4/Yfu0u4/XdWvMZ1QmnFtb7ncOnbCrzYH+0
	X5ryTUv1J0h+53CX5NAXu+4HeU1OBu6TOUoe5735lOK3wg/Hy14dExMW3O2nBz2t
	zMSsQSGr/7T+sE2gSWYOXFl90AaxnT3VXqO7pmVNl6TV/uudS9sWnVaiRniwMHU4
	DdwZMpziWUuDE3EepoN6usPtc7JsGlWn1WSVNO9N1S5Rpj1NZZduffwkSqNgWGPd
	6PJoVewBMHOLliklBlu4m8KKWzCW9fnKBLY4dmiddkCfpUIXSaT2cdziWESU/bqn
	D3nxE6AWaPWurk26ZJYdZg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2t8rr3ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:39:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938ZKpN020446
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:39:57 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r5kwwvu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:39:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW+TBBLQpKBujTxy3i9XYBFmh0lVjL2gTUhJSYmEc4VOk7W3QboSsIDUGOqx82cTVK1QRisfSPPmHIRzPTVLk/8DYVDD5EbaKwp0vVo6M/H10IKZVRJF6FcNitOxX5TbbvDh9C8a8yghrvI6zmOYgtX08Sjf1r409z8Os9ZlfzeZ7IQabLFE6JUN0FRnahASOwZP5YsasA5yYJO6wkEPlAH2xxIGBuduK4uVKHDxjAbQVOP3VsC28ZWekuRR9c0k5y2SxAZ/0KXY3yU87frpJYcKjolg3If0PFQs7l/9AZ9IE391WHbiNvTFS6mpgL4DH+ybr4zUmpwS4aBynkBsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhxISvTdClQHcUxgkZ7Zu+N/jtdlSCSkipCTAvnWGgE=;
 b=hr/Ey4h1KLimc8Z5IoH23GDXcJwNQ5fQQeEMWNh0BvaS3Ch9s5YDlpdVyScgkQMZ7xGpmWh5icZ0TcWrCplua6oXBrQNUXIcXxPg9KOSkQZQTOmAUCoRMPrrNDZXqzHMnIT9IRXpT0IpafPf/H/c/nV70T7t/aw9n21ctLOTje2N3FvPNwZAXouFzz2zful7h7ZCIChiz3FjqdjHS3l73NdldD0J3FYNXkU0zgLR183OgPohCMF+7jVtPRyFeafInj3yU+BbFC22+q5VVEhHATBrMjIIWHkS2NMe3z9ugjHsWsvvUCuOo4OM7DDnp4d/bIHWf25OzfuuTWo9kAQ6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhxISvTdClQHcUxgkZ7Zu+N/jtdlSCSkipCTAvnWGgE=;
 b=FsAh+aqNZCQn7I0eve1k8LYNLHp9f/C01xlWKncnz78LXy8avecR53b37fEJRYaXGpj08xwoYgDIfnURGZXsw3TMHz0eShTF8ikzy/hbbv8eqyXU6y6fQcXroUu191dOsXHZZWcHgrh5CnSTNyPl7Qoe6cs8wldRO3maz1Nh7oA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:39:54 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:39:54 +0000
Message-ID: <cdaeb4b8-27ae-4c2e-a48f-08a81f5a19d0@oracle.com>
Date: Sat, 3 Oct 2026 02:39:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 2/8] module: add support for user module
 search paths
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <f7fbd59eed1fa31f615291fdff3f57fb@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <f7fbd59eed1fa31f615291fdff3f57fb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0148.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::41) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb1563c-3214-45cc-04e5-08df2129e60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|5023799004|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mbxmdn2Smi4LA/31828JLAW3yyx/nmqXD6ywqP+uTCpWBWbaUtWw4W6fkRiz0+XC6X3NyEGn4C8UOgYOjaJVdxhiE8q5ZQ5VUkyc6sV4AizmuQDXiR29LzJDzGQWGm9d7x3CwGGZcEahAcLb7CpuzQ9GlCetmfCOBOmyJUm6vYHfx6yjHZaS0PATVE0iX7wKL+xQTUzRINjniBsNSCj0rnZ/+a5YgdEQ4Ys+B54vOkbtchZybreses7aoEHdAhO2Akzd/9rXQ+MLBX/GkVAThykImaPWvjNU5R0JP6ARz3bM71k6Od07dG80UKeKoyebW5nZObkHCAIwvFQ7JdJQdLCXsyp3toGmMpOLzBbc4dBJ/iaaWiVD+6EZHctXRF44zjAv3WLyhHuS9G/jVRk3HBLxW5gG2faEEgomIiqgSIH0MMYR7FJaEKkXuxng4pi5kt4pDHaNkBqV6k2TgdfbjlhKqzDLFl1xjkMYQEcT1cggvO9eEeJBbxpvt3RE2Z2H0UxC1+dIvKW8bsUwrV8axiyjqoTCR6ieiRB0OhudZbkyK1N7FdVZm3DO9XJEBYmeNw+/uui6fnwQtqSMEjXxyyp9K9qNsnW10PBHp2zqb02Mb/IIoukWdDdcJMzpzFXBvkH3CGIeMTRLXe+5/s1JKzcSgcbkcJeJV+XQ2F1ULqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBGZVMxS2s4Y240WjNpMVZ5U09ob3owRWp2WmdxOGkvb0NWSHRGMkRLVm5z?=
 =?utf-8?B?OTdvcUlPd0dCWXdNb1JHdEF0YW4rZEhZVmN4QkFJTnVWcHdwU3JGNkRadGxv?=
 =?utf-8?B?cTVmUnNvZ1ptQmlvRDFtUzZmTENWUXg1RUVFREx5SXVPaTBUUEJzWWZMelJS?=
 =?utf-8?B?RUxnVmd5RGMrQmZIZlJMYXRTZHJjV25abDRHcStXSDhvK09SUW51YUdwTGNE?=
 =?utf-8?B?YkFkRSt1eStkNlEzdWJ6YkpZKzdqSFJPT3FzbkoyVjllSTZ1Zm0zb0IvbnJQ?=
 =?utf-8?B?UFZjcER6VE03SEhGTk5FUm56bXU2TjVEQXcwNUtyL2RId3M2NzFBS0VIWEVI?=
 =?utf-8?B?Sm4wVTJWNW82TytGZWx0MUFGOUo5T294UjgxWUN1N3NMbDA4Wmk2RUM5Z0dQ?=
 =?utf-8?B?czVKSnc2aEhhWkpvNGhzL0ZESWFFYVk1ZHhHR3g3czhRM2JPUnFyeFRoandw?=
 =?utf-8?B?V0dxeStRYjVpbnBIblhTd2ZVektnQkwvSVgwK0FnOXVVU2tEL0tYQUNiVjF3?=
 =?utf-8?B?eXFUS0k1ZDVKeG1LQTQ3UWFKNVAyRkdrKy9GTlBoRUp0R3FSRm9TNVpIU2Uz?=
 =?utf-8?B?QkxLcWxzamdtTk9FWnpSUkREdjNEK2ZHNUxwd2tTeXhIMVd1K0xybG15bDkx?=
 =?utf-8?B?STR1RHR3YW10ZkFuanNpWXBKUW9PREtidWE5REYxUzI0UHlMVE0wd1h1ZmVx?=
 =?utf-8?B?Yyt4dmUyZUVXOVpiaHhmcE9yaXZXR1U0ZGQ0UXYvV3FJR0dqV0RrNHdjZXJw?=
 =?utf-8?B?eGVYQmpYTUlOUi9TbXRDckovNWxlUVpYSHkzTDVoWkxKU2ZLbU1lR3VwbFpJ?=
 =?utf-8?B?RS9zWlNOa0FnLzNVRXBabG5qSVd4eGZwWUh4SUVtZ1lQQ3NvWG1od05KRjkr?=
 =?utf-8?B?SU1XMlFick1hK2ZoVXN2SGUwV2VpUXZTeTVrT1E1K28yN2VlN2VscnFDQ3ZV?=
 =?utf-8?B?NWRuMTlTTWV3RDVrL3ZLMGlHMkZxVHhDWnFRMWZob2kyZjRJWlF4WmZWL1hJ?=
 =?utf-8?B?ZHNONTR1Y1pydlZOa25YWFlRNWgrMUp6aDYxbXpOTVFHdHJaV05xZ2RYbThq?=
 =?utf-8?B?SjhZaEdjUGM0UlNJWUNyQUdLN2JDMmZjRkhYSHlzSlNFL05VWnZQc1Bqb0U0?=
 =?utf-8?B?Y1RCdXk3N3F4UWJYSHBjbWZiRkM4M1ArTitDZ1JZSDVnSU8wc2pZeHcyNlZT?=
 =?utf-8?B?V2x4NDRLL0haSlE5eERYdFlRbDFZZTI1WlVvRVNhSjM2aDcrUWZIOGJBeGcr?=
 =?utf-8?B?M29td1RiMFRzMzdxa2s0eWFZQlpHNmwrOTNvcDN2dFQrUGNBNy9KdVNjM1RR?=
 =?utf-8?B?K1ZtM1J3RjR4dFdkS3JCVjBJb253TjNSdE9YWFdhdG5aQlNCUGE4MDkyY3hH?=
 =?utf-8?B?ZzRJWVlsOEQvbGNBajV5UGoxR0F4QUN1OGlXTlJrbkxDUUNCcnhIYlc0UlN5?=
 =?utf-8?B?MktYYk5kYWtlUGF5OHAxbHMxMjU3bXZ5VDkwOEhvalMrMm1sbE9pTjkwSjNs?=
 =?utf-8?B?SWxXK25CNUNRSHllM0Y5QXZ3RTRYSXo2YzQ1blBNcFc0dHArNHF1YThIdDIy?=
 =?utf-8?B?S0ZzanF1L2RpbHRkMzFoSHpkblZSRTA1RE1nVE5LZjVZVUxKdlU4UDRpYmdZ?=
 =?utf-8?B?VDlQTDZxUjNYZDg2YTljd1ZEZExrL1dZTjlQTGZlYzQzSm9SOU44c1NZc0dj?=
 =?utf-8?B?ZjZnZ3JkUXZJTWl2L2NiZEJRQnZWcmZDQVl0MDRPL1FqZFNWMHF1Z0x5cjI2?=
 =?utf-8?B?YzJXU3RCVjZWTlprd0l4V1Q2M1NHTEwvT3U2N21TbXk3OXVYZVl2T21JZ1Fv?=
 =?utf-8?B?Q2ExTmlCVzdKSXAwRzZZZ1grdENIMnRGMVNGZ1FhSk9rSS9BU2NvZ1pWblBG?=
 =?utf-8?B?aE0vdFVRcUowZG12SXU3cUUyZG5zc0pJMFJrUXl5T0FZYVZsd3hxMTVRZlMy?=
 =?utf-8?B?STlpQWlYVFJpMmRKT01HQ1NUYW1JMmRJQmZ3dGtPNFp3cGlWUlZIM1F3ankz?=
 =?utf-8?B?MmtGK2tPRUV4RjZNYTBGYWVockpUQU9mYmluTTdUYWVGN1Z6eWg2WWNWYWdt?=
 =?utf-8?B?clB6Z3R2SWFvTnptSHhDMUZyOHpKNEtneWY2K2w3bzZIWTJ6M3JuZE1BNCt3?=
 =?utf-8?B?MGRBRHgwekV6ZFREQmwyS25MbktlcEl3NVR0ekdtVHB1T0tJRk9sYTRaUjYw?=
 =?utf-8?B?aCtqK2VFdktEVjJOZXRoMytZQXdZaFUrYmxmbmJiUGtnY0EyRk1hc2pTZEVx?=
 =?utf-8?B?UTVTMVRtS2ErQS93ZTBJTHp5YW9DL0lObmJUTHdCWEhIUGkzM2JERWNLTy9V?=
 =?utf-8?B?SGhuWm54U1Z5V1FyWWJENUc4MFZaaFhNZFRSWWhKNWRUVnAzTlNrWENFd1R4?=
 =?utf-8?Q?HyHSmrwwd9f4RScc=3D?=
X-Exchange-RoutingPolicyChecked:
	E9DUCnmovLw7pp3dltF/HTayzXvnIXG2IW8srkGABwpHuqoiPqP++WKQyveYgIHld03nh9kkkKYPnJ9qYKBIdYY7gdm9kFDrL9Cuvf/ffxNofw0uWgUu+NQzUCpMhdgjD6SIAeBIPaVO2Noe9Wej/vWrwqEifIYHtUCavAoZ3RgxioZNdY7lsSRCd2pGOygjn9rA0GrFIimYFgmWMeT/66iw1te+boz25XXZmECWuEi0RFofVZlb+I87t9pM/TlYf0wMVBqMAF2gYgmN4XFf0UHl3tUayW/Q5ztQZp5jbXJ0Ii4OkgE3p9j3sfdkVeMZGB/tr+M+ZFJmk92qILis5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WiSShn5mIqk57DzjgYTEG6SUB90gktt8oMVaSGTPp8AvqPHhYJbcpftB1X4xHjM+V5I9OOF58aSJZecMleP9r/kWTVQWU49AA60c2yP35ZfKl0aW8l7ELsVvfeLbTQH1g1HxD6NBSYNTs0tFjtMBQVbqWHjZWEHiFuoH1RhT2dumh7l/v17kHkrk8v6QZWkgBK2ADgAbPwWxPr2TWFNCVganBKXX5bmHNXRvBhm6J1IbnE5y9uCkJBHulI8jk72JY1nVqmv3Po4KNjewRD5AeQ9d6FiVItkNLmys4pYSHLEoupO7bUF0nRxMeDwxqHVoJptq96jmkthBtbtlMjvj2CNeKSRNbvrp6t+Gfo+Rhf8d7JJa3bqwHNGQ5eSSQArhyo8BDxI3uWNIbi99DITCz2gbG6lQCletOjPBCBMmdRehw6cFKG+n6X4WKk/LCWpjfLX650WrvmGNWOXDQflYTf6JCZlQST2Avn1nwJ5HcBP1ypRhZnS/A2ljGIK4zLS7mJto5NVrHgfMNPopybBRnrs7gRTRVPwx+MdVG+DNcUt8U6vedNoNGfcbQt7gc54jmydPH+oMehN9eH6cqVJhzDfVeg4xhp+z7eZzlRDNRhk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb1563c-3214-45cc-04e5-08df2129e60a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:39:54.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huK8VRHb/PUh6kWvesdDwGOg922Nl+QiUmsakb1i1F4c+IPYax4lhwRpNEwiuAX9/Yaw34thSAxJ6Id9/46KeZxB9VFdVZQHqOJYKH1rO0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX+PdytyT1d+MB
 7Zlqa2u8y8vBfhZj7iToMOPBLGEz4Mno5LfP0OydbS0LrQE6UzA+sBBiLNTf2KhdMpO+moRkGTm
 Cij+L6DBCM4bwI46HCV7+6+R5DuDhB7HAvHASjSkoAA2yOV75pyX
X-Proofpoint-ORIG-GUID: mD2O_MpQ_ku_JHjqQPZzEak8s1t8c3A7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX6RHkN2mxwBJL
 +Y0GLENJYoSVRFOPhUbRnZcM8050A/EEqbDtHpnJU4SxYFNTN4pLFtw7iVkogAofr2SvntWP0cI
 uQjuxCfI/WfV0vwGl535JT881xX1IrkaBsWWw+cdutJ6I/M8ZcTdvSf/gestaLRKK9E4ZITUtUU
 4dg8j+tEQW/IMbCVVvCx3TmpvPIPeLoVCvO4zaqt9gCIABmb/vQrTkQ/Kh4zsOLF68WhW2cQ2iC
 tCjxMEx91l1OKXW4DO7qJcdETH3QDtfDklfRGSqxO9tZl/gPBuOSj4UOR2cd1HQI10/5GZUiNRi
 FfIb0cx9RrAyZJREVZhPonGe2FCnvVOfiJauNU7zwGDvwMjn9gmi0lI9XC1O6vSQ327vcwvAgVi
 HT0apt/2+kO9Z+9SHnCaXHxsHjqAI4I0dhDQB53g301tNWe0lzcw8GWbKE2ysY12o7tw17U9kSG
 t1erZ4t0E9+TjgdOp0F9KU6UVriHauC93luno5qY=
X-Authority-Analysis: v=2.4 cv=Ys2a1IYX c=1 sm=1 tr=0 ts=6ac0bf5e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=8fLnjrhsKFmz57OdmvwA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-GUID: mD2O_MpQ_ku_JHjqQPZzEak8s1t8c3A7

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:01 PM, Kris Van Hees via DTrace-devel wrote:

> 
> User modules can be uerspace libraries or executables.
> 
> Introducing this support requires a renaming of the previous dt_lib_path
> to dt_dlib_path.
> 
> We also introduce a dt_module_sym_iter() function to iterate over all
> symbols in a particular module.  This can be used in the future to add
> function name globbing support to the probe specification for uprobe probes.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_cc.c      |   4 +-
>  libdtrace/dt_dlibs.c   |   2 +-
>  libdtrace/dt_impl.h    |   3 +-
>  libdtrace/dt_link.c    |   2 +-
>  libdtrace/dt_module.c  | 280 +++++++++++++++++++++++++++++++++++++++--
>  libdtrace/dt_module.h  |   3 +
>  libdtrace/dt_open.c    |   6 +-
>  libdtrace/dt_options.c |   4 +-
>  8 files changed, 288 insertions(+), 16 deletions(-)
> 
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 5860e59d..b49ecb0e 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -620,7 +620,7 @@ dt_compile(dtrace_hdl_t *dtp, int context, dtrace_probespec_t pspec, void *arg,
>  		return NULL;
>  	}
>  
> -	if (dt_list_next(&dtp->dt_lib_path) != NULL && dt_load_libs(dtp) != 0)
> +	if (dt_list_next(&dtp->dt_dlib_path) != NULL && dt_load_libs(dtp) != 0)
>  		return NULL; /* errno is set for us */
>  
>  	ctf_discard(dtp->dt_cdefs->dm_ctfp);
> @@ -803,7 +803,7 @@ dt_construct(dtrace_hdl_t *dtp, dt_probe_t *prp, uint_t cflags, dt_ident_t *idp)
>  		return NULL;
>  	}
>  
> -	if (dt_list_next(&dtp->dt_lib_path) != NULL && dt_load_libs(dtp) != 0)
> +	if (dt_list_next(&dtp->dt_dlib_path) != NULL && dt_load_libs(dtp) != 0)
>  		return NULL;
>  
>  	ctf_discard(dtp->dt_cdefs->dm_ctfp);
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index 161e2106..176291f1 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -1232,7 +1232,7 @@ dt_load_libs(dtrace_hdl_t *dtp)
>  
>  	dtp->dt_cflags |= DTRACE_C_NOLIBS;
>  
> -	for (dirp = dt_list_next(&dtp->dt_lib_path); dirp != NULL;
> +	for (dirp = dt_list_next(&dtp->dt_dlib_path); dirp != NULL;
>  	     dirp = dt_list_next(dirp)) {
>  		char *kdir_path;
>  
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 9597f823..22733e33 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -361,7 +361,8 @@ struct dtrace_hdl {
>  	int dt_cpp_argc;	/* count of initialized cpp(1) arguments */
>  	int dt_cpp_args;	/* size of dt_cpp_argv[] array */
>  	char *dt_ld_path;	/* pathname of ld(1) to invoke if needed */
> -	dt_list_t dt_lib_path;	/* linked-list forming library search path */
> +	dt_list_t dt_dlib_path;	/* D library search path (list) */
> +	dt_list_t dt_user_path;	/* userspace module search path (list) */
>  	char *dt_module_path;	/* pathname of kernel module root */
>  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
>  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index aa5eb735..3d17c07c 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -513,7 +513,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  		    "failed to write %s: %s", file, strerror(errno));
>  
>  	if (!dtp->dt_lazyload) {
> -		dt_dirpath_t *libdir = dt_list_next(&dtp->dt_lib_path);
> +		dt_dirpath_t *libdir = dt_list_next(&dtp->dt_dlib_path);
>  		const char *fmt = "%s%s -o %s -r --version-script=%s /dev/fd/%d %s";
>  		const char *emu = "";
>  
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 1b16d2cd..acf4baa7 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -45,6 +45,171 @@ dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp);
>  static void
>  dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp);
>  
> +typedef struct dt_path {
> +	dt_list_t		list;
> +	struct dt_hentry	he;
> +	const char		*str;
> +} dt_path_t;
> +
> +static uint32_t
> +dt_path_hval(const dt_path_t *path)
> +{
> +	return str2hval(path->str, 0);
> +}
> +
> +static int
> +dt_path_cmp(const dt_path_t *p, const dt_path_t *q)
> +{
> +	return strcmp(p->str, q->str);
> +}
> +
> +DEFINE_HE_STD_LINK_FUNCS(dt_path, dt_path_t, he)
> +DEFINE_HTAB_STD_OPS(dt_path)
> +
> +static int
> +dt_user_path_add(dtrace_hdl_t *dtp, dt_htab_t *h, char *s)
> +{
> +	dt_path_t	tmpl, *path;
> +
> +	tmpl.str = s;
> +	if (dt_htab_lookup(h, &tmpl) != NULL) {
> +		free(s);
> +		return 0;
> +	}
> +
> +	path = malloc(sizeof(dt_path_t));
> +	if (path == NULL)
> +		goto fail;
> +
> +	memset(path, 0, sizeof(dt_path_t));
> +	path->str = s;
> +	if (dt_htab_insert(h, path) != 0) {
> +		free(path);
> +		goto fail;
> +	}
> +
> +	dt_list_append(&dtp->dt_user_path, path);
> +
> +	return 0;
> +
> +fail:
> +	free(s);
> +	return -1;
> +}
> +
> +static int
> +dt_user_path_add_env(dtrace_hdl_t *dtp, dt_htab_t *h, const char *env)
> +{
> +	char	*str, *end;
> +
> +	str = getenv(env);
> +	if (str == NULL)
> +		return 0;
> +
> +	for (;;) {
> +		end = strchr(str, ':');
> +		if (end == NULL) {
> +			if (*str == '\0')
> +				if (dt_user_path_add(dtp, h, strdup(".")) == -1)
> +					return -1;
> +
> +			if (dt_user_path_add(dtp, h, strdup(str)) == -1)
> +				return -1;
> +
> +			break;
> +		}
> +
> +		if (end == str) {
> +			if (dt_user_path_add(dtp, h, strdup(".")) == -1)
> +				return -1;
> +		} else
> +			if (dt_user_path_add(dtp, h, strndup(str, end - str)) == -1)
> +				return -1;
> +
> +		str = end + 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +dt_user_path_init(dtrace_hdl_t *dtp)
> +{
> +	dt_htab_t	*h = dt_htab_create(&dt_path_htab_ops);
> +	FILE		*fp;
> +	char		*buf = NULL;
> +	size_t		len = 0;
> +	char		*str, *end;
> +	int		rc = 0;
> +
> +	/* Add paths from $LD_LIBRARY_PATH. */
> +	if (dt_user_path_add_env(dtp, h, "LD_LIBRARY_PATH") != 0)
> +		goto fail;
> +
> +	/* Add paths from ld.so.cache (using ldconfig -p output). */
> +	fp = popen("/sbin/ldconfig -p", "r");
> +	if (fp == NULL)
> +		goto fail;
> +
> +	while (getline(&buf, &len, fp) != -1) {
> +		/* We are interested in lines like: <something> => /path */
> +		str = strstr(buf, "=>");
> +		if (str == NULL)
> +			continue;
> +
> +		str += 2;
> +		while (isspace(*str))
> +			str++;
> +
> +		end = str + strcspn(str, "\n");
> +		while (end > str && isspace(end[-1]))
> +			end--;
> +		*end = '\0';
> +
> +		end = strrchr(str, '/');
> +		if (end == NULL)
> +			continue;
> +
> +		if (dt_user_path_add(dtp, h, strndup(str, end == str ? 1 : end - str)) == -1) {
> +			rc = -1;
> +			break;
> +		}
> +	}
> +
> +	free(buf);
> +	pclose(fp);
> +
> +	if (rc == -1)
> +		goto fail;
> +
> +	/* Add paths from $PATH. */
> +	if (dt_user_path_add_env(dtp, h, "PATH") != 0)
> +		goto fail;
> +
> +	/* Always add . in case it wasn't added yet. */
> +	if (dt_user_path_add(dtp, h, strdup(".")) == -1)
> +		goto fail;
> +
> +	dt_htab_destroy(h);
> +	return 0;
> +
> +fail:
> +	dt_htab_destroy(h);
> +	return -1;
> +}
> +
> +void
> +dt_user_path_destroy(dtrace_hdl_t *dtp)
> +{
> +	dt_path_t	*path;
> +
> +	while ((path = dt_list_next(&dtp->dt_user_path)) != NULL) {
> +		dt_list_delete(&dtp->dt_user_path, path);
> +		free((char *)path->str);
> +		free(path);
> +	}
> +}
> +
>  static uint32_t
>  dt_module_hval(const dt_module_t *mod)
>  {
> @@ -166,6 +331,75 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
>  	return dmp;
>  }
>  
> +/*
> + * Create a userspace module for an ELF object.  Userspace module names are
> + * resolved based on the LD_LIBRARY_PATH, ld.so.cache entries, and PATH.
> + * Module loading is lazy, as it is for all other modules.
> + */
> +dt_module_t *
> +dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
> +{
> +	dt_module_t	*dmp;
> +	char		*file = NULL;
> +
> +	if (name == NULL || name[0] == '\0') {
> +		dt_set_errno(dtp, EINVAL);
> +		return NULL;
> +	}
> +
> +	if (dt_list_empty(&dtp->dt_user_path))
> +		dt_user_path_init(dtp);
> +	if (!dt_list_empty(&dtp->dt_user_path)) {
> +		dt_path_t	*path;
> +
> +		for (path = dt_list_next(&dtp->dt_user_path); path != NULL;
> +		     path = dt_list_next(path)) {
> +			if (asprintf(&file, "%s/%s", path->str, name) == -1) {
> +				dt_set_errno(dtp, ENOMEM);
> +				return NULL;
> +			}
> +			if (access(file, R_OK) == 0)
> +				break;
> +
> +			free(file);
> +			file = NULL;
> +		}
> +
> +		if (file == NULL) {
> +			dt_set_errno(dtp, ENOENT);
> +			return NULL;
> +		}
> +	}
> +
> +	if (strlen(name) >= DTRACE_MODNAMELEN ||
> +	    strlen(file) >= sizeof(dmp->dm_file)) {
> +		dt_set_errno(dtp, ENAMETOOLONG);
> +		goto fail;
> +	}
> +
> +	dmp = dt_module_lookup_by_name(dtp, name);
> +	if (dmp != NULL) {
> +		/* Do not turn a kernel or built-in type module into a user module. */
> +		if (dmp->dm_flags & DT_DM_KERNEL || dmp == dtp->dt_cdefs ||
> +		    dmp == dtp->dt_ddefs ||
> +		    (dmp->dm_file[0] != '\0' && strcmp(dmp->dm_file, file) != 0)) {
> +			dt_set_errno(dtp, EEXIST);
> +			goto fail;
> +		}
> +	} else if ((dmp = dt_module_create(dtp, name)) == NULL) {
> +		dt_set_errno(dtp, EDT_NOMEM);
> +		goto fail;
> +	}
> +
> +	strlcpy(dmp->dm_file, file, sizeof(dmp->dm_file));
> +	free(file);
> +	return dmp;
> +
> +fail:
> +	free(file);
> +	return NULL;
> +}
> +
>  dt_module_t *
>  dt_module_lookup_by_name(dtrace_hdl_t *dtp, const char *name)
>  {
> @@ -393,15 +627,21 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	if (dmp->dm_flags & DT_DM_LOADED)
>  		return 0; /* module is already loaded */
>  
> -	/* Load BTF data for the module. */
> -	dt_kern_module_find_btf(dtp, dmp);
> -
>  	/*
> -	 * First find out where the module is, and preliminarily load its CTF.
> -	 * If this fails, we don't care: the problem will be detected in
> -	 * dt_module_init_elf().
> +	 * A non-kernel module with a known file was explicitly created as a
> +	 * userspace module.  Its CTF, if any, is in that ELF object; do not let
> +	 * kernel module discovery reclassify it as an unloaded kernel module.
>  	 */
> -	dt_kern_module_find_ctf(dtp, dmp);
> +	if ((dmp->dm_flags & DT_DM_KERNEL) || dmp->dm_file[0] == '\0') {
> +		/* Load BTF data for the kernel module. */
> +		dt_kern_module_find_btf(dtp, dmp);
> +
> +		/*
> +		 * Find where the kernel module is and preliminarily load its CTF.
> +		 * If this fails, dt_module_init_elf() reports the error below.
> +		 */
> +		dt_kern_module_find_ctf(dtp, dmp);
> +	}
>  
>  	/*
>  	 * Modules not found in the CTF archive, including non-kernel modules,
> @@ -2064,6 +2304,32 @@ out:
>  	return 0;
>  }
>  
> +int
> +dt_module_sym_iter(const dt_module_t *dmp, proc_sym_f *func, void *arg)
> +{
> +	GElf_Sym	sym;
> +	uint_t		i;
> +	int		rv = 0;
> +
> +	for (i = 0; i < dmp->dm_aslen; i++) {
> +		const char	*name;
> +
> +		if (dmp->dm_ops == &dt_modops_64)
> +			dt_module_symgelf64(
> +			    ((const Elf64_Sym **)dmp->dm_asmap)[i], &sym);
> +		else
> +			dt_module_symgelf32(
> +			    ((const Elf32_Sym **)dmp->dm_asmap)[i], &sym);
> +
> +		name = (const char *)dmp->dm_strtab.cts_data + sym.st_name;
> +
> +		if ((rv = func(arg, &sym, name)) != 0)
> +			break;
> +	}
> +
> +	return rv;
> +}
> +
>  static dtrace_objinfo_t *
>  dt_module_info(const dt_module_t *dmp, dtrace_objinfo_t *dto)
>  {
> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> index d22cc802..88b4f1a4 100644
> --- a/libdtrace/dt_module.h
> +++ b/libdtrace/dt_module.h
> @@ -15,9 +15,12 @@ extern "C" {
>  #endif
>  
>  extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
> +extern dt_module_t *dt_module_create_user(dtrace_hdl_t *, const char *);
> +extern void dt_user_path_destroy(dtrace_hdl_t *);
>  
>  extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
>  extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
> +extern int dt_module_sym_iter(const dt_module_t *, proc_sym_f *, void *);
>  
>  extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
>  extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ef6b7599..b5d2b648 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1348,12 +1348,14 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	for (i = 1; i < dtp->dt_cpp_argc; i++)
>  		free(dtp->dt_cpp_argv[i]);
>  
> -	while ((dirp = dt_list_next(&dtp->dt_lib_path)) != NULL) {
> -		dt_list_delete(&dtp->dt_lib_path, dirp);
> +	while ((dirp = dt_list_next(&dtp->dt_dlib_path)) != NULL) {
> +		dt_list_delete(&dtp->dt_dlib_path, dirp);
>  		free(dirp->dir_path);
>  		free(dirp);
>  	}
>  
> +	dt_user_path_destroy(dtp);
> +
>  	free(dtp->dt_cpp_argv);
>  	free(dtp->dt_cpp_path);
>  	free(dtp->dt_ld_path);
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 0a35e852..4706589b 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -359,7 +359,7 @@ dt_opt_libdir(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  	}
>  
> -	dt_list_append(&dtp->dt_lib_path, dp);
> +	dt_list_append(&dtp->dt_dlib_path, dp);
>  	return 0;
>  }
>  
> @@ -541,7 +541,7 @@ dt_opt_stdc(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>  static int
>  dt_opt_syslibdir(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>  {
> -	dt_dirpath_t *dp = dt_list_next(&dtp->dt_lib_path);
> +	dt_dirpath_t *dp = dt_list_next(&dtp->dt_dlib_path);
>  	char *path;
>  
>  	if (arg == NULL)
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

