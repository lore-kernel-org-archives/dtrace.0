Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863972F2619
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763500112; cv=fail; b=mkd+VXWseMm7BsjTs3rGRRgZFbLCQJo0zWGyLy5/q+kwnrhUpMbqezfo2LUGTn7hKvqzJPtv/rGIV15VdS13n8B9WDnuY6XrckxGHOnvGLNWXeDXvehLCp0zE3HobGnYqYWSVgHJnEHLvrLawP9A7pfPC8UiYB2TMG2Ne+Lxk3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763500112; c=relaxed/simple;
	bh=wXP4BPbqSz99npNf6as2DJ23qPVZO3RHZ8nuVjKXmlQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=KHeedPZHjvDtr4KyM6s6XdsvKpZmK3GURqw0MajQ0NAAYBYtta7fQOUFVAK5nqwuqmTgm24ZhMSqumYzYlq+6bWX8Qqhn/HySygX9ikzKyOHHpZL+fLHu1NCCaksPYCRXZjx+rREBPxPtil2R+x70J6yGtnr8z3IY3BCk5r/cMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GfpX3FHB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VfMF+wEN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GfpX3FHB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VfMF+wEN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHNKaO016784
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=peGbFwyEVv6KqAM9+XJmtnnhczfh5LeBdMjyMiYgs0Y=; b=
	GfpX3FHBqEL9Xsl4trzkd8HQ5e+Kdl6KDvv9s/vglLO78ZrjdIt2nOJmP6nc/JqG
	hWjqSfzZGAt04HXb1JcFp7FPZrFrD69xE5UI+qfiytrQOMOhpe6Xk0Q869wSD35A
	4NnslAPkBaGmCJx/kEGYj0uwttelmCCx8eQmPdHpNT14T5UDXKnb2WnrYmHFHgd1
	99go+SSxjtMrP5tLfp78SU6T1TRIG0QoJdblVunw/tRDnV2qj8lWcWPLEayFlWLS
	+Q1Qzr82/Jj3ILFIdr0BvXjISQ7tXt2ySijxB1iziE0+b3oiObffd+/Kvqkgmz7w
	Ui0owzy32YYDabMnfHZ1Pw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej965qua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:08:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIJ9s0v007225
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:08:29 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9ptc0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 21:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDfF8lDTUhdzZcBLTHa5rH+/nk7L9z0KW2gwZRT/5XBRK6MUUSl4N6buOf+4d6kQlNwX9E6LO3D+3J92o0rs3Fk8pNinGSsn6WokwcF7anD1zEiLVC4hxWkEEW1ijQVqXKAMvhq3HHOabmMF+/6BeiGt3xn56MzXdZt+mbnzDBgIXFXFAFHRLctQ2HUHy7H94GcaNJhB9lLNbiNiBldwv/aLWdbiskAJSU4fCP1H11+hcycRZVOqakMkaCsV6o4KDSNydAIocpINTbupGJfH3jHgSo5MEsC0hsS7SJJvUbREQPVyL9gkNp4lfnDc33FYBIweOF8X0RCaDLPVZqc7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peGbFwyEVv6KqAM9+XJmtnnhczfh5LeBdMjyMiYgs0Y=;
 b=QtInuzCVZvqJxlh8g6ZhJItKHtYnpR4O1+uhG1tp67NBR/pn8ojEgnyMRDIGBszyFuJyYFBBja632KWkf5wI3HnPjOjyjHLNh7GYRjDk5KGkzeV9G5KVJlXvYL9/cWoDgTnpHwSeXFRTw8EwpIY9+0dADyr/DuG58TPDvoktSFC+mdYL8GPxT7grR6balucqf02Lj40xtHmPG/7uLBoIHswwp9QABOeug4dJold5xQJjkmS45aztdp2z1jJ4QnFD4HvpfJdXPwhDdBjfPQHh53yF6Y8fYnxRYpZ1LOo5ctLk4iGxU4D0v28unyqNlSC619McJs6r6lTew5D66RykgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peGbFwyEVv6KqAM9+XJmtnnhczfh5LeBdMjyMiYgs0Y=;
 b=VfMF+wENSSR+9jukTwZyGjyLoexqPQ0r7V5BbLI0hJb7cksEt+/Z/Cn9cI2lKnBvGH0SRSpd+aK1Hvz+o2C8oaSEXi3MN3IfyefGYHO/SjkX3+1XG3FTJtiKpHD0aHNUo/xMncMVh7ZZk2Nfi0tcGgYidI8hrXzz35PrBU+Q35s=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB7814.namprd10.prod.outlook.com (2603:10b6:806:3a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 21:08:03 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 21:08:03 +0000
Date: Tue, 18 Nov 2025 16:08:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 6/7] tcp: support non-libctf environments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987C9621F900D4263A4AF44C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f0d491-6e04-485e-bddb-08de26e6900d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YQz3I8kM3tiVJpHecLsXdf32VSlc8E9qWGkkfeQgo1ZUEkmcWESZwCy9I4X3?=
 =?us-ascii?Q?D/sK+dh7OOfewANnT86bPCJ2aVt8RwSv0/2DhuH1e2IMClAfRkOmg+aJiYx8?=
 =?us-ascii?Q?HPrX03xqJCayzhpPE+uZrgu6Pd6S6Ywv0oODJWQLozsw3IS3OMATdxevj7u0?=
 =?us-ascii?Q?HDaXg2rbTYPMge+CGWBlusiiTyF/6x/wOPGtufwSAeQDG1rwC+SFUWRy+kI9?=
 =?us-ascii?Q?uYiGDHZV0sX5IET8o3m8iPogCBNadA3rjswQGtoXgGH7MYrhmuH3GjMbvKFO?=
 =?us-ascii?Q?/N72nTuf/Zj5oYLHTx61MfNbP+9UVWFcA2VDJztM00TEjPDwJsgGwvyRXJjz?=
 =?us-ascii?Q?8vMsA0ktepx/k+Z1yBnaob/AEL2G6JImSLI2mZFD+h/NyokthXr2Fg/hm0Kp?=
 =?us-ascii?Q?b4loxH332H3q/EZ2F3oBZZ3BChD9par36CgOmq2+cuSbtLSaCx+ozTBa/fmR?=
 =?us-ascii?Q?z1wxZtQ0pSYm2nv5k63ExPgp/Of4L0X5vUbYxKZM0cL1JWjeHMAL7EE1ds5o?=
 =?us-ascii?Q?KY8S3PmEPcL6aRO8Hqeq/W2rOYz86qwviro4pOgP01MAsiggwdz2Ccxx1G1w?=
 =?us-ascii?Q?Mpn/2/BRoh8DgShBtBEUqw+M8HEJCWqV8vQE27RH6UYpJwHAituvoSic/b8S?=
 =?us-ascii?Q?OaxuhgblMY3Hq0dkaFqV8ASlBphCd6SH+KFyX/8qiQWTF8kWTxX+f6d9M9DV?=
 =?us-ascii?Q?/VlhhDRDHhCWHPWC5ub0/qisQFlX3YV2MYsBVEldA5Mf/ySBnuGD5C67k9Jw?=
 =?us-ascii?Q?4Dgbl2kFuyNUlH5qgtDtgQm854BGvVNi3bCSKcz+ZqWdm/6og5/2abgH0KhO?=
 =?us-ascii?Q?DgVolppk23S0QpNLjlSZcOmd3TSgFoJmrCB+04KZ3/ZYjAvqDpye44R0WrpG?=
 =?us-ascii?Q?VBw13ahGb+3MyZt1vMKjeOQq9E7Dy90vtY9n6PMArNvfhPUCJkSFMVAYmqkI?=
 =?us-ascii?Q?fVaaF/2uoveoSGqqGSRzcVsHNuDUISNIJePy9N4JDwwqtJVeie1uicsSvtUR?=
 =?us-ascii?Q?BbePVpeE1/r6LEqWC1iQ2YzVib+PSRrdD1y4TGh030SNy8ykTJz8hV3RANx9?=
 =?us-ascii?Q?4MRMiQDkzgsbGO5O1z+8bUlzOpNwB1Jt0GJRk9Icmevli4stABL2PIZaVS/i?=
 =?us-ascii?Q?rXnseEzAvUGDh6Octx/dvR5+zrenjj/WUYBl9U8P6ABro9dLGSGWvPFmZIxp?=
 =?us-ascii?Q?2WTfGGwVEJD4g5qbZLHNr9ur0xS0gSEAk23p/JPQPIkP2NFBjY32eOd2Ylhc?=
 =?us-ascii?Q?lE0dV5yZD6W3wTTxHFS2f1T0Uea8Un2BSY9AkWJy0iwJWrj7LYJdfofVwyX7?=
 =?us-ascii?Q?dg2E1d3m8qw5Q/x8eTyzG0szTuQ2DCm0dpt4XdnInKcKj9jW2TY1naMYu7Tx?=
 =?us-ascii?Q?v9WmLsBxNxIZmx0NP1mEgMQsN/b04kLu7nKOe331SPJHiWWgSTG3SReP4cUJ?=
 =?us-ascii?Q?HO6/xqPQPN1m0pj/TJpJErjkjKQfYI6l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P4l/CD3dpzZvumBY29dCyW2NTNk8gg9Su+MB/d2iZ229/iQb+NPapAcJhzhn?=
 =?us-ascii?Q?GMiIWeJ2odFoY9UJRLA+E/E7ad54HjSBPj1w81Hy32Zs9X0oIc6Dg/cFCLxe?=
 =?us-ascii?Q?yd+XSk4z/ay5eDynDQ6gnvk137+tAetHAmKzTwcwkQNFonzzUKUMkTqzWFkv?=
 =?us-ascii?Q?tjn8DHS43EEJAvR7yxDi8jWv/0yLlgrn3+/+hCkrtgFeAcHRnz0T2r2nAQ65?=
 =?us-ascii?Q?YbeCSEEevJ8UFzZSDkf6iOM9XG+PnNrAlDR90FKkDwQEGRKbPgrtTDt79tbT?=
 =?us-ascii?Q?k4kb7A6ZDu7QaOPOAhvNTPZgtmMQmfDxiE5RkHHgJiWG/Ah//Nyscn3lNzF/?=
 =?us-ascii?Q?HakHYfu7KYG+74llC7T5QZpEekkHHQIAR3HhiZ3GmeAuXvFqS88z0fwnMqZf?=
 =?us-ascii?Q?h8IuD1RodK3sN4HMn5XdwkoZj4aBeq9lBSudO5jg+bWrs0keUVgAn2oaTF1I?=
 =?us-ascii?Q?a7bYZxBWaqL+NZ91NlHw1+IbJyB0XHo6QbbI2ptonNc/AAkL8Y4sPla7tesb?=
 =?us-ascii?Q?BUnpk3zl/sEMIYo3qKILzszcyVrpia8rOoibrTGgIRQeXggsSTVv4LyyGay8?=
 =?us-ascii?Q?Lg6KjO80iNe4PgDJCgsSCcBQNCmDj6FDOfjSiF8OP0hIBt4HbxWUNrNJQx6H?=
 =?us-ascii?Q?ueg173r+6FDxycAwxmXRykr9DeF+gVOmWxy+zx7ZN9nNzQGY+gkZR6k+Qjtf?=
 =?us-ascii?Q?mTFplmqKbBzrVIe+KJZxDuIGbVdpOEyKinFxJTFM4z0tVk/6FjCVVaTG/4o8?=
 =?us-ascii?Q?GQygEXSHt7jzcZq8owAqNcWzyhiO6rrFjOe8b8UCm8VZIMdtePxnLoOSED+0?=
 =?us-ascii?Q?VEa2rDp06J4LVqU6vZXhSFYVW3YhUV1Ae20VQbcS4z65A66DCiFJPhsXC4dO?=
 =?us-ascii?Q?m8sDouL40xg2EIn5dgUIQ3i4S76pKfIYNAcMVe0aE3gtTD5vTQOe22ZZwHok?=
 =?us-ascii?Q?K71Dj8eyhxU+9PBbPbckvsdznrgiztXrQL/VCSpyhz+bwLgFaONdP4Pphost?=
 =?us-ascii?Q?bO1v3UiMA3bvhLglrFLjX5X95EPNjwvex0sScn2tCLmU2nq4/2AtouCxKR0D?=
 =?us-ascii?Q?DKghQjXRLlb0az2GJE1DjpgeifGv3RxtRbBZiaApvjXDNfIZAAjEo4x/IOd+?=
 =?us-ascii?Q?t0Ah2GdCQLi5og7ns57Z8HH1XkXK0N0gUbnyyEhMvHEXVElG2IgadnGZ8CB+?=
 =?us-ascii?Q?2WJVTI4mA7WVb7NMApeE6wB4v6rFgGJo8RefgoNjSrlFmDfzagU5fFFWcuOa?=
 =?us-ascii?Q?nZjKaOyq0THYDV3O2+ugQv7vgg1n0n7/OTdeGJVQNXs5RET8nfU8dbQHxkWD?=
 =?us-ascii?Q?fJtDzCy1gCf3akJe3aJQc4lPGZSYfE8Me/FgSWdAGtASv8ZubKJPSTSvpn8R?=
 =?us-ascii?Q?FV0SJbL4AW8+PEVrBnkeOvlFddxhvIYUrLzcj57mzYPPMbv3TAeBNujMZeor?=
 =?us-ascii?Q?9Hbqd1woiWgUMIyV+PzL9JagdSSPYHW0NKO69l5sXcxoZUtXJCiio5tjFSF8?=
 =?us-ascii?Q?gmYDPI7r3z3knMKYjFRBVs4TuUWym0HU4HxF8zmWt0PddB30MEb5vTnGr+SP?=
 =?us-ascii?Q?DEpwI0xbCy9+4JEvSSY/fh2AOBR0nNNGfu3pWLKZzFzQNirEeLJRSGWgDxpZ?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QifyYytVso9stu43Joisit8NcTc3Of8u0mVAw3/cucS9TsHpUL8MalAm7l1Cghs0T7qA9g9AQWbPLfsNnmdla+mqQLcv4Q+twA6yidV0o5fSc3vlRe/gaW+Ene0b8GgrLvQV8pruH9Ux6xNS4u03cOuGbx3uXnYLD7Zou4ZO67A+JqRkJ77rP2ITXeedGJT1AS8iOBCv9m3k91fBWXY5ZjuZ+fuCRRsJVrrk9s5XTJrialHhNYggeKJUvclhVk04cLfsD5BdLj+XIxUllAL7SY0rSAbextQz3I6vxpGtQYp7JZIaTwkh+tOPFsxlUynVd6xLGQYEQavOSJCsD5pq3uSBV+bsXzRsbkiydnN0DMfVcVq11b1oxdqMzdfRZZ25+cKq1KH7wUAlwycGOGFFwLeC3JcJGfidmwOcAzH7y5WplBfxdjD/OgC8ur95e4f4TDjIsop2qncP2G82voNXwYYjeaskJMpWHITgxdswjLStmYoiqt8yI950JJ6M0rXXxElKyjvRyE2k3rNavXBNdBOqbHSYKQbz0SrbBWC/bnA/L/Clrfr4TxcbDtdHUqwntyIf5RkAx7Nrox1G49IVKfF48w59MmVuataPLSxXHmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f0d491-6e04-485e-bddb-08de26e6900d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:08:03.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl5f7HdEyAf1KkrfmdfBw63DMmn6Lq09ypzcHp94yQaLH6+FgjuFsum2N9GtEfi8aRXWUj1Yjx1ZlmhJdi0ZC17jIxtq/p3h2rLVrFZa584=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180171
X-Authority-Analysis: v=2.4 cv=DYoaa/tW c=1 sm=1 tr=0 ts=691ce04d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=_I-dS1PJ-mPbLbjZnZ8A:9
X-Proofpoint-GUID: wxBdLPY5kHli7eqxo4BjWkzTMo1Mpn1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX6fImMRkrIq9s
 aUXaFtubo6tT5MtwekM9AXz0lz6XzpC1EmV82PtXPFjc817/7zmqIsyffVNH9Ne8R1gBXtLXl0N
 NbwWRPggtsSLpgQjPNUXQlP+kGUhiJX7gkKgdiE/BqIO6urAAwG5ZnSK070SYTdgP1n3qVCZ9BT
 103EZfQjx4I/Xecy1Vi1WAUKz7rIloskS6Eex6JaZfV8gYt3BXuS6c64c6HwDpVBDV+yfLh6bUV
 NESChEEB7bcbuDstZbt6gVRF06J9K1h1inaE/3K3lPiTS4QL7xzyaaylY+IkGLHvoZ95Vg2KHNM
 LHOBasHJA/hda0QJmQXeR9RMKvrk+nH5Y/Gc+NSDm9lkQ/hFQz7Zjp+MinLxMkH/qsNa+3FdBrH
 lTc/PSIU3OhKL675GGSPshb6/96DPw==
X-Proofpoint-ORIG-GUID: wxBdLPY5kHli7eqxo4BjWkzTMo1Mpn1E

Commit 0fa93b3ac ("tcp: new provider") and commit c08a5fcf2
("tcp provider: support tcp:::accept-established in absence of skb") both
introduced code that uses ctf_func_type_info() without a pre-processor
conditional to also support the case when libctf is not present on the
system.

When libctf is not present, it is assumed that the system is quite old
and therefore is running an older kernel.  Use of libdtrace-ctf (which
has been deprecated in favour of libctf) on systems with recent kernels
is not supported and may lead to unexpected results.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_tcp.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
index 44ed2bc9..c3d5553e 100644
--- a/libdtrace/dt_prov_tcp.c
+++ b/libdtrace/dt_prov_tcp.c
@@ -160,17 +160,19 @@ static int populate(dtrace_hdl_t *dtp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 	dt_probe_t	*uprp = pcb->pcb_parent_probe;
 	int		direction, have_iphdr;
 	int		skarg = 0, skbarg = 1, tcparg = 0;
-	int		skarg_maybe_null, have_skb = 1;
+	int		skarg_maybe_null = 0, have_skb = 1;
 	int		skstate = 0;
+#ifdef HAVE_LIBCTF
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dtrace_typeinfo_t sym;
 	ctf_funcinfo_t	fi;
 	int		rc;
+#endif
 
 	/*
 	 * We construct the tcp::: probe arguments as follows:
@@ -262,6 +264,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	if (strcmp(prp->desc->prb, "accept-established") == 0) {
 		direction = NET_PROBE_INBOUND;
+#ifdef HAVE_LIBCTF
 		have_iphdr = 1;
 		/* on older (5.4) kernels, tcp_init_transfer() only has 2
 		 * args, i.e. no struct skb * third argument.
@@ -274,11 +277,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		    fi.ctc_argc > 2) {
 			/* skb in arg2 not arg1 */
 			skbarg = 2;
-			skarg_maybe_null = 0;
 		} else {
 			have_skb = 0;
 			have_iphdr = 0;
 		}
+#else
+		have_skb = 0;
+		have_iphdr = 0;
+#endif
 		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
@@ -291,20 +297,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
 		    strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
 			skarg_maybe_null = 1;
-		else
-			skarg_maybe_null = 0;
 	} else if (strcmp(prp->desc->prb, "connect-established") == 0) {
 		direction = NET_PROBE_INBOUND;
 		have_iphdr = 1;
-		skarg_maybe_null = 0;
 	} else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
 		direction = NET_PROBE_INBOUND;
 		have_iphdr = 1;
-		skarg_maybe_null = 0;
 		skstate = BPF_TCP_SYN_SENT;
 	} else {
 		direction = NET_PROBE_OUTBOUND;
 		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
+#ifdef HAVE_LIBCTF
 			/* Newer kernels pass the original socket as second
 			 * arg to ip_send_unicast_reply(); if that function
 			 * has an extra (> 9) argument we know we have to
@@ -329,6 +332,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 				skbarg = 1;
 				tcparg = 5;
 			}
+#else
+			skarg = 0;
+			skbarg = 1;
+			tcparg = 5;
+#endif
 			have_iphdr = 1;
 			tcparg = 6;
 			skarg_maybe_null = 1;
@@ -340,11 +348,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		} else if (strcmp(prp->desc->prb, "connect-request") == 0) {
 			skstate = BPF_TCP_SYN_SENT;
 			have_iphdr = 0;
-			skarg_maybe_null = 0;
-		} else {
+		} else
 			have_iphdr = 0;
-			skarg_maybe_null = 0;
-		}
 	}
 
 	/* first save sk to args[3]; this avoids overwriting it when we
-- 
2.51.0

