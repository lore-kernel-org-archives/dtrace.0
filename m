Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBC225797
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424823; cv=fail; b=M6zrs3jTHWwNPq4lzLdgC9+F+ImIqFBfG/8c3bCbn5soEx2heXeEX4531aZJzBa08WzXygF/MI1YmDJ3Fn4KIg6o364wnj/8Xjp1EFNME9Zw3rAxJfrPBzdSXckn9XuS7lXLXERUCF1M0rHHzSz4vJ89/Dxgm7/YzTbirvXKSlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424823; c=relaxed/simple;
	bh=nN46dlFehgFgQXf7OJlcGQjoglWjgHRXuW3th98DHXQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Q9TogqzPLAu3WJJjkb5+f+IlyCEmUQPBVnmt1QZA2d5z+GpGpqgT/yIufmzXKrAwWb8EtQG7c45c6dIhdq7C8nL7gQrIWxQgRoER5+L7fuPhhGcgrxNw7Vky7xKBIUyBDiLW2J2WbtC/QVpSPr3B7QtM2CaV4AF95oQUloN6t3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UbRQTPpO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jAh20W4T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UbRQTPpO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jAh20W4T"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Dfkw9002786
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=; b=
	UbRQTPpOKxAlU5wA6POKXwShhddORmyzpwc98stedx4d2PW1je+EG9k3LoHgKZ8h
	saOmoV0EwnC4R84oO/7GwnVHpmhBE9uMxHzywa0vXlj7RsqrCRvbtcTRqE5NnPYM
	CN9+/9c258/VJYhhrhfZ78xiEahRdCQQYFjghOcFmYf72EJsvZ8IPkRsi/tYaJ7d
	8Fn8XxxE5oOCnvwCj1ksHvDhXr074AjEPKq4VQqCNtnQXZ6BVbs7qslI0nytax1g
	+Bo2+KPUl4l/YEO5nPrFeuqnM3LE5NRms1zGZwCV3d/kjL2WBAoXY2qqJsan88h3
	HH9xXQR0V97Za5qrGFBsRw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasbqfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5IAjjR040353
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836x8kb8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kck0k7aCFx+bmhyWrBRbO9PP/r5jEqlvfKydXE73wgSfb0Md46GVaBk1qvQgS8MI0X1gPXnEDHsTA/2Q5umdKQWURceiXkK3Am9sImOTlLxBUFHRkuUZK4Ga5rfy4ZozN95DkI2qivALnxl0a51CIdt/viUN9wM5P9IS8SDVFxg5+mpWWbHr1LwZqlHa48JzEJxbf7gXS9ua2Q5os6/s8E+S2FBWi9LB+B5JblnFIHxk8iD8ANOQthcyxdJoiteTVCoI2CV55GgTuDnh7tztp+aAEI74qhyILiHdd61TrrZyAD0NMBss4aaVfYF4clsLSqDBYqCeCYcCN+KuwIdjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=;
 b=kXxes7XPu/Ndu4eYuFs67sGg5bbn71ortpJU/Dc0IKy7YXvA6Y4JRJGxh+sUFllXzRTiTbr0UwpKwCq7oeZhq6WHzXhAPifTFaMOBp6x/SlZ7J5wGJ+kYY4ewIdH8MIFr3tkgdParJHD9qtDnzhPRukwoaDJMwTAdhcBsgYUT6KphsDABhqnlQlrYpNDyPWhW6hbVVVf473Tx9BuKsZUhfBMywTycHbgSViMSJXqSGTtcAHmama3vscmG9bSzFvvsEHL/0asscWTgbszld50iJdhyK+GDDa1GRDGjLT7Y8TawEnrVJs082lrsQmVy1HX5jzdtsG64HOyUgoriQewuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=;
 b=jAh20W4Tsm5U4BPJ/V1YeGvXc0Ini3IePcyipGEhx4bNjL7BlkP+WH9beWL+xgqo2rpI3DwErc8pUyjRzVtPQTw67PTWxdxjARw9Vl1dnuV2w/OLk/FVbJ6FZk2JbE3jbaBEu0qnEbPTgLdbhhQJQt4dAwEGtHC0q9wzyokJq18=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:29 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:29 +0000
Date: Thu, 05 Dec 2024 13:53:27 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] fbt: clean up fprobe/kprobe support
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: aba12bb1-daf1-4c22-49a3-08dd155e1ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abTbDI5C3uZbk6ixi/b58mrfajvVgUj3WDKRyZGJZ4njsSNh5R0Hj890Xd9s?=
 =?us-ascii?Q?ZX4RqfJ+AkoHMyKPqWOVse5YjA0jO5pCKA6RqDoLY3IDyoyHxn7bZgwe8yF9?=
 =?us-ascii?Q?TYwc0ddF+x7Dwu3+TIIrzbY2EKmc5pu9AcUOSP6E/UBq8n45fRrDfOORNOKu?=
 =?us-ascii?Q?D69dsg6/dMuUgstqrkAxPYfsP3fBZFhEG+OBiMpsoQKHVPUD6krr/9R4jFIe?=
 =?us-ascii?Q?v9kHsxj/lah85rWVAOUQs+MNh1MXNXafb9Qn/mVvJ3FqmQl4adUQ4mH5f+rU?=
 =?us-ascii?Q?wYcf31uMVkYuUA0uh2dGOMTLDtaiCDvQwioAM9KrjyyPUYDyqDvxSKHXUA0W?=
 =?us-ascii?Q?Bxfzdo+9ItHj2Tmb+amxmY7tYNoirCZNSw295l5i8J1H7VzBo2WpHqIWmTM2?=
 =?us-ascii?Q?ssJMMJlR4x+8r8//zNQZeuRGmKAhjVZGqKWMKy6o6k1gmnAH4abUVRh3ZTwT?=
 =?us-ascii?Q?OcvgW5ULWoIfr2hLm5mKwlY3hl9ayAPIJ921yd2gWQONgmFo1BX0ry0qwhCO?=
 =?us-ascii?Q?tMN2BrCQVl5bzdWTy8t15ibMtEb3f0PCUgbUNurNxyIEK95becw1wdshU0nJ?=
 =?us-ascii?Q?VNHgsxC2EolCS+yjTka1zTaUT+6Uu30CLR0zZD1R6xFI5arzTH2XOpy4yLFQ?=
 =?us-ascii?Q?1T29XSVr2lxiQLTPis8gL8t/nBdKeMlkPHr5ufKGjwo7J2UK0ULE/egvXx9c?=
 =?us-ascii?Q?U6tAC22eFibOC1aNw/6FZhFxRHjRzwil0KbRpYQNPFiaXscTubC9hSy7Lq8i?=
 =?us-ascii?Q?i9ZnCg47huposfAp9T6mFDxaYaHjfyyx1D08wo+c3/KIm2R9ogE14qau8D2D?=
 =?us-ascii?Q?SzqSQ1IVQzDsug7Y46bd17WxJKHmFTBZDjx8ZIs1RQGIbcJNr69LNOjImIg6?=
 =?us-ascii?Q?dE3IqO1Jm3AWb9ipD78DxAdn3JfRYsEWptJ1757ef6FdEiLtQD5RLLk5+QLD?=
 =?us-ascii?Q?UJ+0AYCpoqcSSO2GV0FLp/MCvttnnpXCAGq3v+DTyHLcQEBQ24nJb6Z7N0XP?=
 =?us-ascii?Q?3HpwghhOpo8a7LFH4N06cj6CzRS4/hIdqLZBObGQNFONzvUdgROK26+X5nRO?=
 =?us-ascii?Q?LTbu0Btx+ut6Om0VHXANP542iYY15GQIYIa5WB+XR9oxDDQrYDcQKz2OR+2V?=
 =?us-ascii?Q?De23XKUcY5GvyGCPjnAMuTO3A7kqC9PHyO12Mvjj6H7GXqowPvOiWB5EI71A?=
 =?us-ascii?Q?ruQ8QTiiiBHS+MfEd6oxBnkN0IjSQV21PLFqjg6MOhZ5JNu3uwTRgTg+RVGC?=
 =?us-ascii?Q?H9PLhEFQfMNjmJE8f8fLYmdAfaoGoVJ5TLkVwdF0O8uMtXSWfNu7jw3KsGoy?=
 =?us-ascii?Q?2aHKdUJVwAGXWwcfphjp2J4s4VMorjodchubWCtwWFB7eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CGLeNoroK7zsOhvRIFuc3uUO4Nfw6N3prOC8p+qiG/sK+rcmJmsoKznvwNb0?=
 =?us-ascii?Q?oRdrJufQixnPwncLw8guyjf8O3GJwEc6phYgmZhak03KmtoLKB/tuMUcHo6b?=
 =?us-ascii?Q?KQQKsNCiLBf1cGXMaC8PaSg5ijJOrLkMRzzATRCOJU0vdnjLGq/5BaKgLJZQ?=
 =?us-ascii?Q?p4TSmEuycYxyhmQrhhFCMh732TgBd7sI15btAmVFmPlxaEttQxs27ihDKY7a?=
 =?us-ascii?Q?JV0FraAAdW7kr0HOYJdINWAn9tNJXP2Lp3b+OsqvQmWDggAnVF8JHFKdQ0wv?=
 =?us-ascii?Q?Jn0jNG48tbhjjDRQcGj08YrixCNev0L6Jboysaau/Om+QAt44VB4N5matfwp?=
 =?us-ascii?Q?YdYJdZab12Zrm0vLk4q3arR+To9T4/hFufX7oTq+mjqtkDecK0mb75y86TFB?=
 =?us-ascii?Q?cL3hUXuIW1Os5336AAn3IKQbEJhJSwoU9xwd44iac8JP6CzCdDGn8JMENpno?=
 =?us-ascii?Q?SnbKiziyfDRyEfCZV94bDPZpF1hPhyTSTGJ1kcS/H/X8fvIL6D4CA8NRtxIv?=
 =?us-ascii?Q?8W86gLu5zJ6Lkm0LMEev7BJr7zU2qT7grA1PIrSNHNRcngY+S4/U9pUwhxnT?=
 =?us-ascii?Q?14OLVEEf6p/9VUrV5cNxCpUPBedAenzjRkyk/LMxt/XoRp2t8anzZHoQVqF+?=
 =?us-ascii?Q?MQikl53OWU6ASCUMxRP9fmBS3ezvJoYOUOCsU8WgZww0Zk3g4Ns7CWG/46hm?=
 =?us-ascii?Q?0VGb+j+QMdF4h4ff/iq6M9cMfC0S9BN6c+ZuhJwliEeMZUxEMCmnp03BGBVs?=
 =?us-ascii?Q?eU2an6H/KMPYBE718IJTK2ys1pNLCYvlTIUOPLcsjvKZvbhrHE79nJ2CwuPE?=
 =?us-ascii?Q?xClp0E2TUgdd2953TLEymw52QUCyxI0/x46qmNITTVHqmauEOLCf/U/u8bEW?=
 =?us-ascii?Q?THR7bQ/fJyLAC8yUlSzzBwLFyVcxF8ii/fh7kygxz59NRqLk23U4QryRuycO?=
 =?us-ascii?Q?ZtTgL34m+38EoiC9JS0X55lAcWDXsbBy63846c4OSqmq/2dvknpg7EFpj8G2?=
 =?us-ascii?Q?FwyegccdtZSGvjK5oDnMk6Zr1XXGRWLIAB0CUC73MUDMKmYeIFVIqIPFURje?=
 =?us-ascii?Q?dKRvPBd0uSasoWWSf7p2uPPgZEjSeRXr956t4XI6+O61AOhtrXhW2HkV9jv8?=
 =?us-ascii?Q?Y3ClE7m6RCxDmFZVndLL9ikjRPD2CneJO/RLMBaV1hJkIV7l/3cLVPSfyBRc?=
 =?us-ascii?Q?MVgd6b01TKgUWX3OuJq4OMQnGdYIKPlSS3R5At/+aLcjiLwjP0jERFg4Mlf8?=
 =?us-ascii?Q?ahCPEkVkIHz75+sCSNUdju4b/xkMyOp7ERYA8cmwP6r/sYyPKIHR+CC4ZADT?=
 =?us-ascii?Q?7RvSWI5ob6BQUSClbVpZ8I/ntjqXSsrceufprUkwhLqjyo+MfoH5zItRFddC?=
 =?us-ascii?Q?8muYAJh7Oqj2yVgduRae3/5OEBO9dPQRzqfffZl7Dikkot1lIwsB09S0TaGp?=
 =?us-ascii?Q?syZfWDAgPFkMvqB9HYjC0ZBUsFls5kCXxwOGOr+SaO0qqDiRnMiCQhzsPn98?=
 =?us-ascii?Q?MonL80p/zZiJM9/+dcZlv/I+CxHYtv7YVXNfxXHT2267WH/a9CGG8s+7Lroy?=
 =?us-ascii?Q?dALhIAPN+nP09CIjtdMBctODBInFurC9x5wWCwqG55Ot97LI9h7TqSO4TzeD?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AAtB3G5Kt83uuk9RAyOjvV8UkHjQbj99DLlpgI/Fwz8TPloWDQOeVibp0w1Wv5lgTCVNUdQnZjwjTK3cbBQd/3rQ9l7b3lYt9fXoTEVyPKoK1TJ9RLZrmndxYSOgAUf8ypJafpOIOkzRs5Z9+9i2dLrNV0dKGgh8avy6NBkWZoxn/pa5Q2xYvQYi5vtiDKUu5TKIRgpr9OV7ShaJ3LhHF8HRe/o6DL9EKHuxfAc6afcxNvinWIe/mDtqzPSVOGI5nYH8Al3+mxH70QLbRFgiDL+cF0OhBbCb7qYnuEzyNaE1UaWCgecr2I6NGvF+Rrm+okYNkWUHBaDcuDkrh1A1bW2hknOBO244gUSwd+G6N9sE+CeY8E2IfLsdDBaFQIl0QEoJ/cZ58PRvlFA7QV/RSxT8sh/W0jEDRtgFKGmwyNXlUjvQ7BCfsrfPzV4Fmp9eBnnJjN1vPfYHmwZMPUJsb1rh8JjK3qwuyV+CNp6QtYfP19GB7TfZDiWvfG5UkK1LGinEfOYOMafKM00VQH1YhuNVWPNHqqyNqq3wD2v+go0INfybNnLd4rEk0WDwc+IMLXJdwhF5ki0wpepbkmjRr7JIGkfcd3UyTPg3WxawwaY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba12bb1-daf1-4c22-49a3-08dd155e1ba9
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:29.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW4k8I4P9msYoMMy3KNkycweNAuI3Le3hKE9ZANDV4slT0FHBsIfsoPW8zQFu7qPBjpYc839sgcxCBZWkNrFfj/DvUimXIeq1wPe79yBKms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050140
X-Proofpoint-GUID: CpAuiJZJjSwnZiQkrkJTEmIwkkCUYEkj
X-Proofpoint-ORIG-GUID: CpAuiJZJjSwnZiQkrkJTEmIwkkCUYEkj

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 14 +++++++++++---
 libdtrace/dt_provider.c |  2 +-
 libdtrace/dt_provider.h |  3 +--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index da288401..a60a2e14 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -57,6 +57,9 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
 };
 
+dt_provimpl_t			dt_fbt_fprobe;
+dt_provimpl_t			dt_fbt_kprobe;
+
 /*
  * Scan the PROBE_LIST file and add entry and return probes for every function
  * that is listed.
@@ -64,7 +67,6 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	dt_provimpl_t		*impl;
 	FILE			*f;
 	char			*buf = NULL;
 	char			*p;
@@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
 	dtrace_syminfo_t	sip;
 	dtrace_probedesc_t	pd;
 
-	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
+	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
+		dt_fbt = dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
+	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
@@ -463,3 +466,8 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.detach		= &kprobe_detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
+
+dt_provimpl_t	dt_fbt = {
+	.name		= prvname,
+	.populate	= &populate,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index ca8b53df..1e2e844e 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -30,7 +30,7 @@
 const dt_provimpl_t *dt_providers[] = {
 	&dt_dtrace,		/* list dt_dtrace first */
 	&dt_cpc,
-	&dt_fbt_fprobe,
+	&dt_fbt,
 	&dt_io,
 	&dt_ip,
 	&dt_lockstat,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 8f143dce..f62137de 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -76,8 +76,7 @@ typedef struct dt_provimpl {
 /* list dt_dtrace first */
 extern dt_provimpl_t dt_dtrace;
 extern dt_provimpl_t dt_cpc;
-extern dt_provimpl_t dt_fbt_fprobe;
-extern dt_provimpl_t dt_fbt_kprobe;
+extern dt_provimpl_t dt_fbt;
 extern dt_provimpl_t dt_io;
 extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
-- 
2.45.2

