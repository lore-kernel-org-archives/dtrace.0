Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAF38DD8
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595064; cv=fail; b=i5/fK5kDU/nPh9vZp2JSk9+FD4VLD4EK8PvAiRYJMZFVjzRcFw5XojXe4u3m6nJqVi1q56DG92d1tb0SKnnaLNo8riXDRnHopmU6Zrcam9dPgUfN/5isrZrmqqKB5XW49POHAaf0SGEwc1RVZuyVzu4X6NVobRoNHDptpKJhZYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595064; c=relaxed/simple;
	bh=BcBDAbJsCTmn3C18Hebe3VFQN0qGV4bIy3122KPD0Vo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=GJAhcu2eI3547VyMaUHSyjGPdRYgQDMzMSwkZndBTblK4QImTzjTYdsi11+Zb88ec4DssW5U4/BC0CuF2zgjTheAEHi9kjYk2BBnL05FXDRgHe9v8+n9l1OXmiAsLeLGJvlIT5lSvY2rDOXmzF5BTVDUqouKl+Q8V3zTQOK+B1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VD7t8EmV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NYN9qfvs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VD7t8EmV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NYN9qfvs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OHSJnv025255
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=yYo1DazFOeKLc3SN3i5D1E9VRpeAMKxfdZ3wJc2nJVU=;
 b=VD7t8EmV3TLZmA6uvcwM3ZvpZpNLJ7f5UP06JtTOoNvssaJIIdsiFrd2Y0ch03Rnrwek
 D9Ut+lqZ/jaP+9t4Kzu8+W6VRZGVIfjNXWmM0OUch1vDcX5bC73x8Ai3e1ueKBzk2hEU
 ri5Jmve7fIO1ospYs+uEQQjZ2OQqVu+nojjWNipWaBpyiKWVPSwWWMeA2wYvR0qoOWB3
 ywPYv8jUzcGnd0NO84f10fcjYziYFn8kxDWtyYGwz/7ET/mymU8HGfxcBxBXtmSKzSqz
 MTzIsN70vrWoLOjY8Wv136k1Ii6xXiPbrCeH4Kd2Ag1C8Y3Eu5h4STXRZU2GSdSNC8JN kg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6jrewcqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:40 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44OM0TO5036013
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsceapx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 May 2024 23:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grAf4sk70+o8fdPrtRnLAT+aesciLKCt7kic34pWYnM2oxFMEo3hC/Vf4CMydwuZBfzSL/4Ht3HaegaXsXCITZSOSpXhMRwvxYQX/gJ6vz3Pp9CYz8d8+GBsrmkv8Pt7acRwVIBv4wqh2G0gjduEiBGfDfr6GHhQ5hkJ4+lB7Jg1Touh/0ibBVxdfki653Lynq7MxAQRlPryF5mqFaiRCFQgm+x11mQ8OevU7iwxXmxlOcVhbnfU9XSTEvtmO/gHyTiQZSglkq+nLSJ1TzzoHvNUf6suZc9rC+DVvvWnzxdH8ZmkB7Lt33tbZgRs3sBs+pBwsQ3h8kt1HhCj0IS33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYo1DazFOeKLc3SN3i5D1E9VRpeAMKxfdZ3wJc2nJVU=;
 b=L2v3sWgtHnsQFgglPREZ+v/Dn655SXqf49ZV23HWmdSr1GGDDvnL4iROUSv157D2UAxTeXkWcl8KxysxZGF0PsnEk1tMeVt2oMpPbJjEAhp6MT4sDrcY7kMiAmpiTQ2c4Gjz7a/DZWHFHQlR9UbM455X0g+mF3TAp8hsMcSKf7F3e+4OiReqcRh/EKXcdV//0hIdWT91Yy9A9BzOaoBsNNAd4dNYjUzanB87eA8BDZH3qd4mlAvNtaifgjGMgvnUWCWuiB3yqZRTJE9kbk3iYUhw8a1Qyg7TdregV/9ITqva2XOYWgmAuuJCCkh81lJg6DNEycU1XF/qgi3f3ThlUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYo1DazFOeKLc3SN3i5D1E9VRpeAMKxfdZ3wJc2nJVU=;
 b=NYN9qfvssTeQppNjQJBRdapR4m76RNdrBvCtJfLduxqT0v8BZEzX7tMsgYYU8jU6/M5PYKyZ9kgfllbiw7xyxCdZAVnm0Qwa/lkPIcDrirNk3F5s2zC5FqbfCUhxf+1WbkjZFlDkN8KYXUFPjkKfvlO+YW6BFipfoFkO6TynBdw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB6324.namprd10.prod.outlook.com (2603:10b6:303:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 23:57:36 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 23:57:36 +0000
Date: Fri, 24 May 2024 19:57:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] bpf: improve parsing bpf_helper_defs.h
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287C2D42052CEDF749DEA5EC2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 34eccdd8-5da3-4573-37ef-08dc7c4d493e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X2CUEK/dR7Vu+B1rjtNy8sva54Ch5f1F/TO1WRjmCjk9MV1FoVW8jrjX0vuu?=
 =?us-ascii?Q?bOHurmMj/eDXRtdLyJYINZ+vQPGV+XzCd/3XNZ8k+eEZ4c4sM67ghYkxnL3C?=
 =?us-ascii?Q?DVnHGr5aSoXG8B33LnITD9UPjplE7JHYNgDH/crDJKPj0lIcOmY8wG+CSkjM?=
 =?us-ascii?Q?6X/8W6WTLB9c26hdJhZ73MmDEZ8hJJYav11sl3WYwsBBeNbtHAI+Jum9piqM?=
 =?us-ascii?Q?UOVTHFYYaaGZZi+Ov6V7ILQthJClIUcTRhGbPpkNHg39vf39Gzme8Twh2jvr?=
 =?us-ascii?Q?JK4HrlKTQcnJUj4L8h2PDCYOJLgBxHFUzTdRqcQhTjb16ZyD9fDP2HQwQuhk?=
 =?us-ascii?Q?zjrA2AAKjvuwj2v0o9H3xJg+O0mzOUhSofME9Xsnhkb7gSv9WbK9UAvhQNYl?=
 =?us-ascii?Q?HfnTz9rklSvlYrSxNEWnKggzm0OfL6OfPlCg7rb8dB1cUr4gFtMFPq7jp9Q3?=
 =?us-ascii?Q?9DIFHqv4WxCoxkyyUJxYE+5lrC7Yvoa+fXq5O8MMkujAc7jM2hpqB3Nx/2rh?=
 =?us-ascii?Q?uR01E0s2iIEmC0BaUvHuTK6+IIYHwSHVB7bApGiZDBvGkw6Dh+tUaN4xLYAr?=
 =?us-ascii?Q?bvhlU68Adj8935bforVQz+LunTq0qlmn1/mSxc3kgvmQI05RCNIs9/yMiV7B?=
 =?us-ascii?Q?OWLgMhgkock3q6UXbhqhR+8K9fdVQ4oDX+AIfOmen851tCIQ/wiQEpq/6SRa?=
 =?us-ascii?Q?5UQXnsleWWHzxFF+IzMUK3jMMcaaJj2B7w168XczIw+OQ8uVK9f1uproYAvn?=
 =?us-ascii?Q?ifdQWzpP1me21aeJtCbRFB6s/rV+6g91ziTm4Exeq6CIvmvnRRYh1cyodLFW?=
 =?us-ascii?Q?qukgVPCuhaqR1B8OrBnHfbzohoFGZmfgt/ZJ7tv9dSdYKUBh3WMs/EVe9fSL?=
 =?us-ascii?Q?V86mAyXKHsbi6wGx2xZU2CS/Oiwp8uoHeLi8XSEXfI1rPLF4Gb2wv9xiSVKw?=
 =?us-ascii?Q?Jqqh8EMgFg4SN9AwMqYrRuNb4Rko/+pYELE3ZS3m/MbdgXZfIG4uFByEb0rw?=
 =?us-ascii?Q?YOtEmQAV4bsYYQbtw8GNgH4QjvW3mUxFSF7tKlkieJ8FZFNivdY33b2xSQdp?=
 =?us-ascii?Q?OVDV6G1wy3kEeBHAtulr34E2JZe1V9ttBD0biCjOmUG5DwjJCtAI/+ardVEw?=
 =?us-ascii?Q?u4jsnmh2/Oi/3br1jnJjcwv+Sdupv2U4+rjXJq0iTUg1DdI3whdD+xeWrpbF?=
 =?us-ascii?Q?YRGRJnyr9jgdVCQcneRK0J30EGZWobWZVEqdI5EReC2narMEqwFx4KhucePm?=
 =?us-ascii?Q?Pr0ywcvmWuCXEoemFVBRGkRaIr5/JeWe/8FGh/N94w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U+GoHSL5EP9FgipRITxeGrJoQilWJ671mqqIxgC9n9au4mAm/TEioM85IsBt?=
 =?us-ascii?Q?MXc6hoZ5Azgn5gg8My3RtBj4ImpQbEf7I5xwddVt9B4ta20sBFl7eBIx2ljB?=
 =?us-ascii?Q?UOLdblr6RMwoZZ34g2f0ufHa0CFVAAeEfbPbLfblm5SYp7BYp30LrSOR02jR?=
 =?us-ascii?Q?qkORtmvLR7xc9GmJUQ8c6Zf2DZoh0zT0oMsnPyVfDK4IMh9hhwRPWyHIOZQw?=
 =?us-ascii?Q?PIBOgIp0qXkjQwmrYDwZ75XxC/qPKvBjuMuc3+4uMQWGWzhH05b3IREuVqym?=
 =?us-ascii?Q?GSu1V5JUbW7f1X09QVkmCILLQJ3Dq/IE5eBn0uCkuwy0msBJaJfXPdwHrEYN?=
 =?us-ascii?Q?ugfT1Xdx6SXp17gA4LJQlP46I9VPSIKU2X+8L5tYnhWkGJdZcYdE7RD21zt1?=
 =?us-ascii?Q?WUk2XimbPlADmNFrDPM5EmpoK/lZD7vN1ICV2dWhfAvE0f7OIf9H78BDS/96?=
 =?us-ascii?Q?YVSj7HNq+bodJZqpSX+C+GhsyarRhqr4PCNrxc7gI/uHvfzGaxumKawhuCo9?=
 =?us-ascii?Q?1ZzmiKW3v+swCvHmGXLv+prM28BOZ119lZlSenCyDrhybEEe/9inaWmZuG3K?=
 =?us-ascii?Q?Lii0pDSgco0y7diDnQPObCaWtJcnxBagtnr7F6p7TxJb7+gVqoffubyOgNBL?=
 =?us-ascii?Q?In6x9YEA6xTvOrngFw+Qv0M4fqL00LLRT6hZwCvZEPRlb7Yc1OI2Mi2nfcNm?=
 =?us-ascii?Q?C6XtZpTHy2Evr3bz3PNHOFlHD/ABmsYm+KUTH6R/CItERVC3k4zjziyD9VI7?=
 =?us-ascii?Q?1yAntDRCDAO84+kuUeo9mU3gqjP9AwHO6/PI88Oyny9E8nbd2qRZEPfTaRci?=
 =?us-ascii?Q?QkS2vmeoyd1blcIqUrYNF7mkFsYiXeDcZd4n81HS8r5O8754sp/tqHF9bmYv?=
 =?us-ascii?Q?muLZqCpnMKjH1tSrcgh5bmwXp/hcoZYT4DFx3qmtxHwdF37PuRqdoqSOBiTp?=
 =?us-ascii?Q?L8v877U/rdj1OMTcL+lA7vZHIa6yDL2GjuECDJjFPjFSzDql3nCfpmWtdUXn?=
 =?us-ascii?Q?iiz4E+0FlzhfN8rDBu0oK07RrbKXA+v8sWOpju0wAerMIiogBm7i1GPnTIa3?=
 =?us-ascii?Q?DsZKBGC1vUFNeWySazMxZVDoI/mMN7qm0jf7B/CMkd9IRUWzFX5ylPKz9ARk?=
 =?us-ascii?Q?Vkc9LgclBjOpNZbsu5tdrn75aaWGiAA7l+DFqUHIROHbc+o1gnfHS1fCTYXn?=
 =?us-ascii?Q?T20pLkT8SCDSkHsLp2YEt1+3mXTsNJ8BII2U5eoJ7r1FgZfBPMsb/WE4pjKG?=
 =?us-ascii?Q?4JCxMnZ3v4DjDsQ9CajT6/Cdt1/bjiy/5vyqgm+W4ZQDqmvolopICS5D0ZWr?=
 =?us-ascii?Q?3d9diQaO3iu1bylDcOUuhzZnuugFPd+TvzlzfhjIKGZhMc6UtVbIi4ENRR+s?=
 =?us-ascii?Q?Wo2kK26gqbW0QrYt4uKMgKVaJSocWAqlp/54jRJY9yJDAwDUUQcIZ+oaXW3+?=
 =?us-ascii?Q?y8knbbnuJCQ5lm3WVMh8LYEdSIKF44fw4JBvx7xC0iS6xUsqolBF5K52dBXb?=
 =?us-ascii?Q?EL9hTn83XNgUZ5zeC/BUo6hcHjEYg2PutUPjD1lvxhaiCwbrs6FxpTr6k9hG?=
 =?us-ascii?Q?vbrn9gmOE8w9wiAH18OOOLAL2arN+2YjjF26f5L8r1jAJcksQnZmrbdvXXSE?=
 =?us-ascii?Q?IbnWJkqoOTRn4idej+YJipw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zZu2MDMyD7545nU6ONrPk+ii3x/Ls5DzBnDxYeRJfWzbre8keOetLuRUmgQ5m/fJz/xsHS7mwCrjXZX9lRNL1cc/1GSMCNm6MlEcZDqyLj30sSwYdjJbMnLLpAsi4odlqBVUPSkxtDS6oykkzqrmDUhimULAwUcC64Nfs+U6D9MdCZNQHr9WKK3YKTsETQsbhfymhV1D1mveFCcgFRYLDTYJhRNBLMFZlFLdyxPRYyHa7422zerko3366bCEpFq5RoOsRT4d1+FqMs/elLXdr5ytJqdd7d7mtOFOZu/hpNcudK/w/Thd8CZAAOjLnozpRd746AC2Ddp9dAxY6sZpw3XQG18ymanBge4pE+D3GWi0PiWIw9EoQsJ3KbFb1h7yEDD9u7R6MHTIZFacIFwerUW3OwRIIc9Wt2d0fZAHOcTCaWlK7oOeOvNUysp1BuFykrPBWIrz9TAdg2j+qhsEQtk8SPsXdU2/osLdBPMWJBiZ4yi/MaxBzLzapCnXZiVTthj/uKAtxO8u6dRvlQ+RwSew1xdG2JhXlW+48BA0wD2P8eMa9rUsWKV5wcp2RMKqeK/QD9YwGcbaN2RmHQAqfoxtKTDA+M4ZmAYvFfXwark=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34eccdd8-5da3-4573-37ef-08dc7c4d493e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 23:57:36.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ6N1HJCzHS+ajHkeZol0tKXpEHazuXDs9V2q+4Gy9dDetMAX/Duca9p4drgjqrDQUERJ2AK8BwyFrPeCtiPQ4j8hkWuQBbXawUQs+3t+pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405240173
X-Proofpoint-GUID: MgcD5dj4nNdAhxEjzxJI55mdOMic-kPQ
X-Proofpoint-ORIG-GUID: MgcD5dj4nNdAhxEjzxJI55mdOMic-kPQ

The parsing of bpf_helper_defs.h to get names of BPF helpers and their
associated values needed tweaking.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/mkHelpers | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/mkHelpers b/include/mkHelpers
index dc5e62c8..96d5ea53 100755
--- a/include/mkHelpers
+++ b/include/mkHelpers
@@ -8,8 +8,9 @@ BEGIN {
 }
 
 $1 == "static" && /=/ && /[ \t]+[1-9][0-9]*[ \t]*;/ {
-	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+/) > 0) {
-		fn = substr($0, RSTART + 5, RLENGTH - 5);
+	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+[ \t]*\)/) > 0) {
+		fn = substr($0, RSTART + 5, RLENGTH - 6);
+		sub(/[ \t]+/, "", fn);
 
 		match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
 		id = substr($0, RSTART, RLENGTH - 1);
-- 
2.42.0

