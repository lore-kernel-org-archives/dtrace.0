Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17914AD0D
	for <dtrace@lists.linux.dev>; Fri, 21 Nov 2025 01:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763690074; cv=fail; b=GZgU8HqfqsRDSD00Z232M1BFfzbDqsUxEEF/ACXPV4qTRpqkKCu9qMVA+ji/qj33Z72M5NqJp1KERX3EMm4Z5h6FlAMo91XUF9vdP4TGs8Cuuy4SqPCVmmYchwur5vIl2ukGCB9PNmvSbC5acPOjOef74700AFzUNIv9CSB7FU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763690074; c=relaxed/simple;
	bh=njFt0/6faN6XH0YupaGN296LLCOPepHxuC69ae0k2jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VEEtF8x8sl+GkHeECWEoVxdON5wCXO739i5fantnHzXFEYhRLrsG9nYD5hyJgIWFYIWeOj9Mn01ul+EEl375n8HCCi1SJdVg0qjQ21o3GH5E4kMxIYF+TeMNhH2Uh7lhnIY2qVtDHgHR7BSFE1/kt1TXjgdmGhDvVH5f9IZHxJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xayg8LyR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ulkb1A4a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xayg8LyR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ulkb1A4a"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0vcpE014865
	for <dtrace@lists.linux.dev>; Fri, 21 Nov 2025 01:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=V60FZ5lEaTIa1IhkJI
	lNLE9xStIZM2LzGen/A7/FArE=; b=Xayg8LyRp2aY+yk5w0jX9VLs3h9ht44IhN
	j+SPaAO7O+4JmCrAl5clHQh0pP7F/YEK8946FFxkKKRoXlPkwWc4zB5ZGjOWE/J4
	JuCaJiecHWM5cl6BM3T4TAq0AuMRLJrYhe1G+V6/KOnylvEJoqoQlvrgJg71L9zq
	KbPi1Q3q9wO5crRibAEJDYIMssDSUck2BmnV316tIGDca0JwGYK8TNrIvcvl4Pmc
	S99D/s5crweXJ/Gb50e8cGcKqiPCptg6Ikt8J+9JDw81pgY8uf3FwASscweFhOPj
	dgDnlybvxlisPV04B8zZ2PtI1IB5BZXc+D9bY9BvkInNPcXPwlzA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej90adsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Nov 2025 01:54:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL06VJU009447
	for <dtrace@lists.linux.dev>; Fri, 21 Nov 2025 01:54:29 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefyh1rch-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Nov 2025 01:54:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOrWlCn1HCQ9st1coW2c6rMyaRRiwjJsDud1J1ze5DuETc9KBiFA1/rO3sX2aQ/+28/pilsSNRLgjj8PfSLDLh4Gkqf56fn//0jZ464TDGlTdQmGzf8TjPWY/7fXhu9UQkBIZE9SKMzf/eAsFnJy4bhHQilp2JnkLizF4v/ezPX6x6btM1gOrX9KGrkYqHPM2apwhmipCa3iNoNgn0bAmav/KWSkTTGAg5B9teUKPkYRn7GBS5dji8iaLDyzGi6I6gDqhzMk0w8O2UWXtdmojDRZMrtTERHRpHsz7VDSsmJ/3k9P4sHRszZIXRhLYrtOOhDK9I7xPbdMbxpjFEGt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V60FZ5lEaTIa1IhkJIlNLE9xStIZM2LzGen/A7/FArE=;
 b=RHH2mw4aTxCdsaFIpKLva/m2xl3ld5Ci17svtdi+j5QUk6fYg8u4NSlxPELGeuhDvzWHPcnqojeI/Jx/UND9BFQ7FiDeZt8WsjucVzV0C8guPmvzZfv29U9FVa+rH1fwV6HK6xWdW0AW2XQilX8KcKadCgfIEKD2L+iL8+mhs7aNGuMvL9l0hES/iyXNa4gWhgOmeLU2El60yhyDP8HPv0hLhgGpLVtd8tGlUnTQHUnLUMvE2nRRVctQmWR/XYz4e3yqPM4q9uZMQyQt6gI6z81jhDjZhmpbHGv6OhqgaZCzKSKlTTZ3aXap+8a1f+NQqqpDyR3GzJEHQlphVD69Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V60FZ5lEaTIa1IhkJIlNLE9xStIZM2LzGen/A7/FArE=;
 b=ulkb1A4aMyPAuDLQAn1avSJGPBsL61p1FEYHMqT1pCP402XRGRKZbgaYhZjCOiZHhniubbXDo+Tz/ncnnq4lUI17vMWhsbhiEE8Ekyl1Q/zWSsk454NcjViRTPFn6AM8iQVNQWtsNjw19Z1DGbBCAWm+0WfWW9GJO5emp2QnnAY=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by LV8PR10MB7989.namprd10.prod.outlook.com (2603:10b6:408:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 01:54:25 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 01:54:25 +0000
Date: Thu, 20 Nov 2025 20:54:22 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Do not convert "__" to "-" for stapsdt provider names
Message-ID: <aR/GTq48FM+1nA1a@oracle.com>
References: <20251120225000.31618-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120225000.31618-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|LV8PR10MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: d28d02bd-02db-40b1-f819-08de28a0e628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7B5z2Y5dhdz13/+JJaK5aGCGhSDtDflw0FfG7EUttk7TFm1mwLsVe09yBOQN?=
 =?us-ascii?Q?LHaCACvO+n4o3fML3p6sBPiy+R3N0BbRWfeF6wbHW2SzQiWA0keOPCkpI/k5?=
 =?us-ascii?Q?dLE+q9NkUHOebgZaZjnoOhL8Y1yVhv9t70YX8NCv6FwKZ8PUCtYMEc95hiXv?=
 =?us-ascii?Q?gaxPJHG0CnAWKMb44jjno7pKbFN/ZIvLoSJW7iyn3wMZqvZzNKytJLBrN1kY?=
 =?us-ascii?Q?/IQ2Bafy5Ajf1iVHrB+fIEwMGdMgjTY7uQ//4pU6+8Th8W8DiXSl8nZap7wH?=
 =?us-ascii?Q?Ef8aF2jv97rmQKyXKbwMgML+9Ggh7/+6wTiY5FBw67JoMW29xhtByicPY6Jo?=
 =?us-ascii?Q?J2EJbj7vqBAIaCkJdoRSPrQOq37sPWNtmIj913X5lJeWRCBprLsaTcTGW5IW?=
 =?us-ascii?Q?po4LuGk/nv3P5MU2z9QMc1aLkwZiMB13VotBSWfCHQaGrDY1PN0h/tzDeXTI?=
 =?us-ascii?Q?P61BuOZJTUkO/itA8/RfonoOrkXT1XojNkNuFqIGA7ec/YrNLbFQj9S1FoB/?=
 =?us-ascii?Q?sCHkjyltUswQX4NCtxFpXYciGT9p6wjESzu1iNLZx0nvA1eZSoP36qS9N+YG?=
 =?us-ascii?Q?ItcgrtsAKXlBvUieN9nXytkgPSv9tpEU5otjxNeR6ZL2XOMgLmk2wpZZ5JSA?=
 =?us-ascii?Q?DsGYKDFfL8+YvcrMUaOy0CFdG4w2lZZTUDgGKeogFVV9Gqngg2Oh+Ws9rlS8?=
 =?us-ascii?Q?YijlvtxovRtnzzdfqpe37xaZmoOyUk2jF9+I1Je4UD98cGFL2LkE4ns/IZL+?=
 =?us-ascii?Q?dHCbfZk7EaWhHWDMf5DFvPKKdBYX7Do5OjLdGLoy5TV0MUqEzbnCI/+CCkcx?=
 =?us-ascii?Q?MzBI7D9ZNxE3/RUVInJ6M1432zK3GnPnCtrPaxo6wT8XfoZqnRP8hL8SHM1F?=
 =?us-ascii?Q?rFTFo9xTkxE0ZjY/NlPosjJNeo2yLG5vwzp+NyOpY2gwk8ZGiQl2XM406XQE?=
 =?us-ascii?Q?IONt7KWAcu77QYx4wPEJbkjEfGAyd09WkJspBDzz3vmvwjeO/2c79E7qL2nP?=
 =?us-ascii?Q?zibvBv3k4saIXmgL7qm8PJJWo2KnZcbPj7SmbqdOX/JTLkk+/hVz5pbm8ppe?=
 =?us-ascii?Q?RlWAqInvmdwehqiYUiIlK3UnnT3C+yXKMGqgA3j9IDGiJydE0gS9vmE78r90?=
 =?us-ascii?Q?TRFY/jskthN4wKGCP8tSl4batgKlquwxYgbo7vWf5eSlRSR6A4WR65MtT43h?=
 =?us-ascii?Q?HEA+Fb1D7gmPBXz4S8uuVhN+GwfbSRcB8afjfLAjLoBH1Y1woHHCDGNhJ4gb?=
 =?us-ascii?Q?vB6YFzqlztLApZYtf8J5E746BJGFMlk6F9fqz1Bui3kf7nCaFEite+1aCo6a?=
 =?us-ascii?Q?rTQEFyoG8P1oO+haXR4rWvagr7yt90osZtF3YLpw0s39eFQsa7xMTduHIQ2y?=
 =?us-ascii?Q?b85NXITn0hEL6dOt71ihJ6F5cvO21RfwbtGP8qlfDtkPyBT5rvKdZg9Q7Dgb?=
 =?us-ascii?Q?62+Z6BdNsTqJdSvvK6R2DFK8K4UYJb9P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wsaZpi/VLdnRu0D6/p+tfHn3CAu+wxaUieMKR5IeaTJpCe73mYKHM9MW8MnB?=
 =?us-ascii?Q?Qy3dm178Nqt21T8MObYsbMdman/N1SdNvg1iZGKCc4RlEEeYWoyn+HvHuygV?=
 =?us-ascii?Q?yHkadrFGVP31chiMhqti1NAnN6RfRNi+zO5QNB3sVQBh7BBu2ZMapzginoB4?=
 =?us-ascii?Q?Uv+VwdrTUtDsTa4C+7sjy7VxkEoZFIx5SA6jww6VLovElF5OyUpcUjqR3kF8?=
 =?us-ascii?Q?eWGPMKsOMWeKdbMiBe9XIbNmXgxOwvgOYdVMbVSz+MekHwevW5/0GyJ1Q35j?=
 =?us-ascii?Q?vzqPLtTOxnjmp+JDkM6rxDNp06JDJPEBEcQ4FGegzmdGwnhRgwlikHVmhsNS?=
 =?us-ascii?Q?TU7IvA2FqFKqp4O4qHbAv9rI+pJ2xlrTq0Yba8aFGsgXIn9KMFRtsutvtFVj?=
 =?us-ascii?Q?tcLM6sO9XP43YF1/fCMQugpRi6z1wxZPUKo6W16RgbmY5BN78dnfWNdgPXcn?=
 =?us-ascii?Q?UYglcMkT0Ock2+JjUBWdh3qRfo6xjuEPFxVKLml9Bth7MjBOTsZla6XkB2XP?=
 =?us-ascii?Q?fnMZ6uanAh9fK2GQCcoyc0wkjlZh1pXdC47F9YMvcKeJKtrU48GTMvWh6dCI?=
 =?us-ascii?Q?qzjCJq6ZxWYf9ynYUCFaGdcxI5WaMHF1KOA8dK/djR2pHkJTwjrEznyMh8pK?=
 =?us-ascii?Q?WE9clGtgXr/LzeFufMKiYGlXxenUn/yx+4ddSF3JiEm7SGO8zUtXjDKD0rAB?=
 =?us-ascii?Q?LTkZccJ5VC9im2EU6okyn5NO3PNtDg419fBJlayFyIa/OoqFm8EkxWMLWFJh?=
 =?us-ascii?Q?mw8kBW7FvWI4V69nghwkYLC32ChVX8BtoS1QIhfctHL2JY3eBEkUHeVpTu0+?=
 =?us-ascii?Q?g8znNFYtlbrnOERhLiXHmvT/j8VHCnR30HRutOQQRTytKUuQZRm5OMphQxfO?=
 =?us-ascii?Q?Xh8RTH0n+VLWOkkquPXD++wbSRzNFVT47hGDrF9gEboYHUJVockODCO+vzgI?=
 =?us-ascii?Q?hG25yp90/KB/WBNYtKIjpbRpj3Hb6gr1B44uBN9pQ/bwx2kwi38rBCSswtlf?=
 =?us-ascii?Q?Nl6AQ15+bPn9UFBu8rOL410W0twGSm0fqafkfbwDMm2Q3B9nmd9ARRKnVmwO?=
 =?us-ascii?Q?f1IYWrdrdD2YzWTMN3+cXpfJv2vIA7LPl+RIVONgHRTDRgnpZUxldUdUzEOb?=
 =?us-ascii?Q?HFtuNiMXg4vKmuiyEkrMwa8eZDMxYxkWJkehokDg1DMbAbbXNTQ64KY98egb?=
 =?us-ascii?Q?Qxm0vWAqQrERAJwekPMZYZF78bAxr7Ro1uyVYFg7L64OvzGZDjuQVqDL40Kh?=
 =?us-ascii?Q?hjXPNkO4AeDy5LNTadxm62irOHJtVxIkSXGGGSNQ8PXiBnKcgj/uY/LaHM/O?=
 =?us-ascii?Q?RQgT+a7B2VG9M2lrjv5anfppKfF6JRdIBjVpAzYjMqjIHJHeasT8qqEH1S3N?=
 =?us-ascii?Q?zkzSamo+aZJEJizDkRpD1XDbHCrF2IsNgY2tljWbmk6npsA6+Y8rzN69DjhX?=
 =?us-ascii?Q?eXBETDoZehfey1GzV0b3xR21s9Riygj57ZiQK6iux41ekC4T8CrfVo+AjTfJ?=
 =?us-ascii?Q?CKYJXmgXTTntTuMhHlPzuHkKsdlNBEg9/0X1+MPRUGcFTSiAQoMRcr7miivh?=
 =?us-ascii?Q?oDeNgjF9DqwCn9uGJVcYYQAFtfsHSAToe9L2dP/PvwVPIpgeIS+w7bJyFFCS?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/NTdTXDuNQ6EkKhD1rC/J6UkLMbWARJia9oet6wORHdpx91OJjmzBsnA/QJNRjNeViJ1/R32jAT/NafwpKtsGlncz0V1HhpY56RcRdK0uJODVR89ELZ7JeDw1JAxtx5hgJSRlTS4hmKJS3m9ZL7MY/7817M3LQu7r4twtH+sm+UJbRCR5EOpCwpbTpIDaVphZue6P4XiM3t5/86dyqmmXM/W/Akq3v9iF9c5/IGCdq2RCnxca9RA4XaDvadf9VPRqZfWk6R+yHUCUKv5cXHVwSDlnZZFwreSKphyURKMnHgXya0WUYPz2MBl7wJIKa++W03jguG7JBNZGNearKmzb+wlIr0EgGcveYryPYKBWK/4l/5dzZf7MnluQbGBjgJ9pmGFfncAeswu1AoXpc6lSIyQBKSDtE1/6QLVr19rl45Rqwcl6P9BmAuddmP5AG2Six0vZU+TFSXqfyYUaQu3NBtrOd5K2k+kUl4CAyj13zqA8L9TpgM213LMFTUMj42iijIZyoPNZTy4Yed5/v4PxRnwTTdpHEPCmWlLhoJkf6hdVDtLTphHyPCrkfZJGNm99Gc46hxfgpiPyRhitfJnW2yH3FLFq7T2beEoPgu5QTQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28d02bd-02db-40b1-f819-08de28a0e628
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 01:54:25.6128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhvLlRuiuVQQ/m4lOrcFWIS6AofNoy3fUXUWp7mF1J/qAZ4yRGlIzbfPvE0/OaKWvflFhllq3hqStvz/lVQ10H0ZoOkOGPR2k8s9I4567aI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_10,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511210013
X-Authority-Analysis: v=2.4 cv=OMAqHCaB c=1 sm=1 tr=0 ts=691fc655 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=jd6V5qSVhItfB9iarksA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13642
X-Proofpoint-ORIG-GUID: _Zuv-X-0TpM2wjwI9nebT-8Cb2WCTb24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX3AtqMjlPXh0e
 EYnpTv96bckdHuHfEDgF5CESJiGRuS/FRFoaOAPhHNgdquXTKuiFRnlS1kbh1Txki6iLol9WfUq
 lRTn9/r5hXj+P4TR1V0YyrSZ4A+4B13LGyRwIAR7tClWJR32khkFtakbVy1LOMOzCi8Ubrp76xM
 eXHEK45Bp92gQtKaqj/+Q71c1OwA25rYW6kXPaKfBw94CajRBmx+g4LPrTDBSHhw9nMCe9iahHF
 7G49u/dauCQ7mbkUEuJP6WKfJWcd1jchENQ4mXgIiO3pFL6LvExQZxobNXA5V9uxQVJvZ9WpoYM
 5FEjV4fZeu6c/7Ocg5zsMSa9ChuEqy2XU+twB3bP4Qv+7x4setD+K5/ybu50Y4g6cAXzyDTSI6c
 gNwNasy2TispHDLVGwVmFT5ZD2VZNIpJy8NHMjY8W699rQiJcbs=
X-Proofpoint-GUID: _Zuv-X-0TpM2wjwI9nebT-8Cb2WCTb24

On Thu, Nov 20, 2025 at 05:50:00PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> DTrace provides "__" to "-" conversion for USDT probe names.
> 
> Commit 4f58b864a0 ("support stapsdt ELF-note-defined static probes")
> included "__" to "-" conversion for stapsdt provider names and probe
> names.  Commit 22932a9875
> ("selftests/usdt: add is-enabled stapsdt tests using semaphores")
> adds tests for both conversions.
> 
> Since SystemTap itself provides "__" to "-" conversion only for probe
> names, remove the conversion for stapsdt provider names.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Vam Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c                            |  1 -
>  .../usdt/tst.stapsdt-notes-isenabled.r        | 24 ++++----
>  .../usdt/tst.stapsdt-notes-isenabled.r.p      |  4 ++
>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 61 +++++++++++--------
>  4 files changed, 52 insertions(+), 38 deletions(-)
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 7d6cfb4dc..fb3c59581 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1346,7 +1346,6 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>  		if (strlen(prv) >= nhdr.n_descsz)
>  			continue;
>  		strncpy(prvname, prv, sizeof(prvname));
> -		(void) strhyphenate(prvname);
>  		prb = prv + strlen(prv) + 1;
>  		if (strlen(prb) >= nhdr.n_descsz)
>  			continue;
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> index b088b285f..19924aa6b 100644
> --- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> @@ -1,13 +1,13 @@
> -test:main:zero-probe
> -test:main:one-probe:1
> -test:main:two-probe:2:3
> -test:main:three-probe:4:5:7
> -test:main:four-probe:7:8:9:10
> -test:main:five-probe:11:12:13:14:15
> -test:main:six-probe:16:17:18:19:20:21
> -test:main:seven-probe:22:23:24:25:26:27:28
> -test:main:eight-probe:29:30:31:32:33:34:35:36
> -test:main:nine-probe:37:38:39:40:41:42:43:44:45
> -test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
> -test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
> +test__prov$pid:test:main:zero-probe
> +test__prov$pid:test:main:one-probe:1
> +test__prov$pid:test:main:two-probe:2:3
> +test__prov$pid:test:main:three-probe:4:5:7
> +test__prov$pid:test:main:four-probe:7:8:9:10
> +test__prov$pid:test:main:five-probe:11:12:13:14:15
> +test__prov$pid:test:main:six-probe:16:17:18:19:20:21
> +test__prov$pid:test:main:seven-probe:22:23:24:25:26:27:28
> +test__prov$pid:test:main:eight-probe:29:30:31:32:33:34:35:36
> +test__prov$pid:test:main:nine-probe:37:38:39:40:41:42:43:44:45
> +test__prov$pid:test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
> +test__prov$pid:test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
>  
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> new file mode 100755
> index 000000000..234d1fa55
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# Replace pid in provider name with "$pid" for standardized output.
> +{ sub(/^test__prov[0-9][0-9]*:/, "test__prov$pid:"); print; }
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> index 322bf53aa..a839d5722 100755
> --- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> @@ -83,67 +83,78 @@ if [ $? -ne 0 ]; then
>  fi
>  
>  $dtrace -c ./test -qs /dev/stdin <<EOF
> -test-prov\$target:::zero-probe
> +test__prov\$target:::zero-probe
>  {
> -	printf("%s:%s:%s\n", probemod, probefunc, probename);
> +	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
>  }
>  
> -test-prov\$target:::one-probe
> +test__prov\$target:::one-probe
>  {
> -	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
> +	printf("%s:%s:%s:%s:%li\n", probeprov, probemod, probefunc, probename,
> +	       arg0);
>  }
>  
> -test-prov\$target:::two-probe
> +test__prov\$target:::two-probe
>  {
> -	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
> +	printf("%s:%s:%s:%s:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1);
>  }
>  
> -test-prov\$target:::three-probe
> +test__prov\$target:::three-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> -	       arg2);
> +	printf("%s:%s:%s:%s:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1, arg2);
>  }
>  
> -test-prov\$target:::four-probe
> +test__prov\$target:::four-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> -	       arg2, arg3);
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3);
>  }
>  
> -test-prov\$target:::five-probe
> +test__prov\$target:::five-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4);
>  }
>  
> -test-prov\$target:::six-probe
> +test__prov\$target:::six-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5);
>  }
>  
> -test-prov\$target:::seven-probe
> +test__prov\$target:::seven-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
>  }
>  
> -test-prov\$target:::eight-probe
> +test__prov\$target:::eight-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
>  }
>  
> -test-prov\$target:::nine-probe
> +test__prov\$target:::nine-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
>  }
>  
> -test-prov\$target:::eleven-probe,
> -test-prov\$target:::twelve-probe
> +test__prov\$target:::eleven-probe,
> +test__prov\$target:::twelve-probe
>  {
> -	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
> +	       probeprov, probemod, probefunc, probename,
>  	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
>  }
>  EOF
> -- 
> 2.47.3
> 
