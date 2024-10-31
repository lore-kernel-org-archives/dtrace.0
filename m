Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BE131BDD
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730352174; cv=fail; b=XdAYyxRPC5MV6FLuIZ6y0hKMlnqmOWfxRBSUxCSm/3Xe8KNVUFDqvwikWFJPA1iOB9LdQGZNj4DC7RYuVMaslYtTlWE0cb5gbMAX8ZkwN41O+DeR/OS7SZW/eP/qzHvhKD2fLBL33ASyPK8JpXrHhQ633vz+LRMGRvgYqlVbOis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730352174; c=relaxed/simple;
	bh=ntnDxYX5jSUPKpoONsztgzX2bxZQPcErVW0zlMiMEZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZPOnXTKtlZx0wmfLnaFKqTrwwVhoFXUXiXmycqsK5v+wIB2yZNw2tznXP/G2CjpZ6aX7jMouxAZSyKNbGN77uzCZoi84za+ZpWO6XcCbv/jUVvcVC6oSaBcqUleqzUxMd66piSA5LF5tT2cz0DaBLXko3Z1v500hCHrpW2MNJ6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JBZXHFTp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jwKsNW00; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JBZXHFTp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jwKsNW00"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJBYww005157
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PYO4Eie4NjTJckdgl0
	mIHZkmk7SfW5X5Xounw4Q0fzI=; b=JBZXHFTpTsKz3WTyKRuLZOI0smWWZq1+Uh
	cv4B255YRc0iBxEfL0No1arQdzz0jXAqpzwaWDKpDxJ7+QPLLn6CqVLEOabKYq7p
	s1ULPBh6KDy4T44myjnSnt67sPLm3n8SdqGfmxWdrc306QQv3e5xqnmvdM1TB3OJ
	xvwHvHsJ3yEQwlzCv+fTg3fTOsBAlf1wn6svyp/iaJfPr9nDVRBXtssfGXthYF0v
	RAbB+efXzyWiuf5kKbWBt0mJwM5JqAz+L+ZcVMWbZCxoyC0MYLD7BxqhN9S/ExWx
	grYE/x9pz2OAl3ub4u4wq4JaZvoMtAtf5MtVChQbuIjTRpXeaXPg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmhnf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:22:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49V1IZqg040257
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:22:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnarew08-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 05:22:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/f9b57aIltG0zKlV05RMJbpakLkHsBXvnrMvzobjYjs9NXkef2cT2dL3koOEJFZUDLWWZ+L1Pzlk892nJrD3V0YdqQJ+UbB9CgKcHKqqUwcxd8CWHLC7axz9cs8IcE8PDsepjgl7a4tzGfQFjpLZnVeF5rgIxTNfqCq3BlYAs5xbKzNJk8fTipiKCxdZWC722u86y1a9jQZyuRcS0LfLb1u8cVALStGiDXbVcurv52xXnFXceteGr8/EW3tEWHjW/2rDe5fDkq9qv93VirHpMignazWzTGnDf7oQhRB4mft+l9RjlB/Us34LwwuHNckKDMP9DjRf793Pr4bVCzHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYO4Eie4NjTJckdgl0mIHZkmk7SfW5X5Xounw4Q0fzI=;
 b=tZ3ROesmRcHUoS15ToFdkrKGq7VHKyojM6aLqsyl3M2ctdNuO1/zV1/C7uH5dZrP0ys529SRjRrpOnEgnj7CQ9YY4Hs3Db9m6EepO84NaELgvRgX1Lvrnkijjqzz5BJJNnhPxxiHm33xAwxd4b8MnMrW1rufIkuQ/as47Uqc3cd5yOAwgbRaZLoD26mjkyrD0Vbr03fvhIf8Y8Yd9e1KbURDzQHFrnJDBwsToVCqiIAkYwSzRzh9Zx05s9W0U/ooy1nJMGhMEflS6FfAqLU7IN+rJnIyTUZTElcOT676ZOPmMUcBF3joUqHFzfCT08tlaGuyTia+7uLbJo5WTfloug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYO4Eie4NjTJckdgl0mIHZkmk7SfW5X5Xounw4Q0fzI=;
 b=jwKsNW00nUXM+zPCiDEhEMQ8Ti7BwqNC+QSIAonI9c4JP4uFBwr1PzMq4c0xqok8PaWjaacO2nEd//rdy2mIkZjLyYSLlw3JQJ0PxNGohkZj9zzU7Iq9Xn7pbXB5Yjti5SXZ/utaWveAsaHFrCJm2CTuFDa4AsIQBTFpVlYNmKY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 05:22:46 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:22:46 +0000
Date: Thu, 31 Oct 2024 01:22:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Disown child pid for cleaner stderr
Message-ID: <ZyMUI/T7D82hZGTH@oracle.com>
References: <20241031044906.15804-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031044906.15804-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: ea857b56-dd2b-4122-db8f-08dcf96c0de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C/4vicVBbbpq2cfC7Y19pVbjRT3RFcrnOJnx9GGAR1BIU3ke9fwiIczB+HCO?=
 =?us-ascii?Q?PKd3WcmigvUwL04bfH4vrUqaDaRPAmsgHkZRFJN7nZCjSCrYe7BAkM6GdU5+?=
 =?us-ascii?Q?vqJQmAr/mbARNTYsZvUBazuMw6JhSRHbV50ESEZuxI5PchL4w3AhRPw9gxRD?=
 =?us-ascii?Q?tC+IlDj0/adew8qAMtE9RHLAgSfZgKAw3/X6jBirbETN8iuD7ipG2/5KdPzv?=
 =?us-ascii?Q?OA2E1xFJs/Vof2TABc7qwpGD638PQFK5sSmxAYvvIE6lYoCezZK5xsm0SxCo?=
 =?us-ascii?Q?TvYTQlbKufhIJ4t4UKK5F6lRMB/qWHIWBbGWcRlHmD+xrkOC1c1MV/ekPWVP?=
 =?us-ascii?Q?vcpHnUcNXlYiSeax9CsgAS8LmFzDONuwCW+08qN74GiS4eHEVF06taHqJLW+?=
 =?us-ascii?Q?wJtsH7NrWWhkOu774Lp8b8l1vtsER5FT2oW3/WZy+J0jfNeXSrjiavfL1HzK?=
 =?us-ascii?Q?foY+CeJROrMwciXFMeaODN4qENgvAoq9EsfE3+syQbQ83E+hA3zzQaJN9aVi?=
 =?us-ascii?Q?naG49Vv9wpBQs6SoPRU9nUZmAxyqTMFWOFia6IWIsts8PHq7qntG2DeNg7iL?=
 =?us-ascii?Q?Nmx9wcmA8YK7gZ62no55Ou11q8/2uHLsTUSGQjgWWOHyfOHZeA2uqM83e4n9?=
 =?us-ascii?Q?2IWr43s2Whp2xSg/75eVk7md+Tkp27JiBXzzU7XmjloEoIef0o/TzjKKbFEY?=
 =?us-ascii?Q?G7LYdyRKD81YSjGITYd7CuU5f/4bMUOYPjfwi5/wEz5twHh5+CwjVVxLSeQg?=
 =?us-ascii?Q?MP4bN+Nf3k9pB6wd5q8j86IJgxfjY1MyKfDTgcalEc/WbWH6HPgtYwC41VSx?=
 =?us-ascii?Q?2HencMzQu3aT9116d4Lw67/pdsTXnoAq4cKsvX61UxpDucpY5R8BSwzXGeqZ?=
 =?us-ascii?Q?GhVwO1H6AtP22WMHnIX0/EbSJ8Esrzv1A2uq/sQ8ekYbyQAFhq5LW0INMxCf?=
 =?us-ascii?Q?7qjUsRqilzkg4Zia8yiOmFFSnat2i6tW9rACp/h5ked5DC7yMBELZ+w3xYiw?=
 =?us-ascii?Q?Vzg6E4RCWrkbDUJkvXwbDFYuBAw34yiAvy9boRcxWry9A8JW/FIRAqAFJNep?=
 =?us-ascii?Q?3F0sckFeCAursLLdQI4/rfDWyBG+MwcXeTlB7DWX6RJZV8gH4g2F63SypU8f?=
 =?us-ascii?Q?RfalwjYgUXrmHsXO1pk5Z2pQjA5bh5Isl52VXrnOhunhEy1Vu65MU1CQqEwW?=
 =?us-ascii?Q?NMcjQlHfT2VsTKoCTSz/vH/PMGEpfkm6oDy+XO5oIFax7UHZSNvIIjN0KufH?=
 =?us-ascii?Q?R/8L2AIBf92zMzzP9xuucWFdDpLiN95wJUWQzztnB1ITbdLCPEPWgWczsofk?=
 =?us-ascii?Q?HoiULDe4ylJqtnlTGxKlXU73?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hp5k6rGPybdgVX9HaIJPOv1/tS5AWeaTwesj7adJl6OTzv0VMc+ZYwj/OJix?=
 =?us-ascii?Q?i/HXz1VzzmtSUGpZ7NvpuObvArA0Dx7fW83U40suewq12uM3PEvcXkECivhV?=
 =?us-ascii?Q?g1Y133LPZa3aiNp0aUho2vFFGp1PKnZU1rDkPSAvCJFw5sA9hR6yWTnkuWkO?=
 =?us-ascii?Q?BKC4ajA7Z7AupgJk6Itg68gm+mVfLJfOcw+/CFFAmVSDwmVUuTfjVrYeEnA6?=
 =?us-ascii?Q?X7ZoLTh94Ldg07EFkh1AfvqYz96ZpnRX5uNoEk9B4GZlpx0bggu0/+FyWGOi?=
 =?us-ascii?Q?/TLe+U/0TySS3IQUt+jgAZ3aMK8DutliT05p8Ws1FAuf5JMBPGSU89Ar0cdX?=
 =?us-ascii?Q?t6eVxm2CvPEodT9irisdSg+xVIQh02XOrJFxqm6r0KkE02Q3afMc8483xlnR?=
 =?us-ascii?Q?RM7BEHH9+J2lJacI2CyqJekdYwmG0p5ox9IHGXf1tk9Csl+dG4Y7ioHroBik?=
 =?us-ascii?Q?a3pi09z//C+BjAfasB8Zz7lxT+5Giua6lt87Z4euHSB6tgrto+v9Q1oe2GUE?=
 =?us-ascii?Q?Es4D/DICU2waD1Cba0rPraivh/lHVIxRfmgogvtA2nR1Awql6eJaMO8R957y?=
 =?us-ascii?Q?IjAK4FGerpgwWJUndrHpZfRKbHtZ/EUkI+w4Y1mOFfxojrfI2TFF5rb6d8V+?=
 =?us-ascii?Q?+vdBQl+HNphDxO1eJT5TzL44YhD0pup9wpwFPuyV6F/b96gcROON0qqa/SpF?=
 =?us-ascii?Q?9+/3VmbF2QMYal9nH5KaIu+g3TxcBwLy/xTf9c1FdcWe9c2PFjn6gke4pNMM?=
 =?us-ascii?Q?mrg4wbKSPuCezOVH6aQY74Qrj7qQJCAkgJ1a1DWvsLLJM5W0YZSKq7jAR4H1?=
 =?us-ascii?Q?CYvcLWuClfvSoVPwpH92JKRdKnv3CmJEhGG8O/XPN0WRH9nNAQvrpOo2R5MK?=
 =?us-ascii?Q?aczjmYF329xqYtFs6KnnmPftLyhLREt4QqKRl++l3P6/IPfBj41pOTnPZH2V?=
 =?us-ascii?Q?4rkUNAzCzdpkVnIw+zQkm1sTmxyPBohMXTDP62wJ8rbogOupNHwIdewEY44+?=
 =?us-ascii?Q?ugr6lgZeMB6XRzyJafkmEOhybmmhGEHr/c/vCrewWr4LGlc+M3hj1rWuSbFv?=
 =?us-ascii?Q?UfvmE+BwiwzRt9WyYlKkNS2QbLTsnlIs4XJzT+dOGUi+XEUqriTf6B7+cryI?=
 =?us-ascii?Q?xwHC0sOG6WUNxCKi5GYTtcOP9I9ZlK+LrI/SAl3cMRDMVXZeBUEpgsGLnCTD?=
 =?us-ascii?Q?V2StOBoC/+AZ9UIE+Nh47F7cWGl6shlpBWw5sFXNImovn4/rCZ3n9u2VcCG+?=
 =?us-ascii?Q?iOcZxLwSLmWO3xPYBvhTRhTyrg8Xp+AyiLuxNxw0oh42w1bCZdvXKz2+lgdE?=
 =?us-ascii?Q?0rgMMNdc02hpROZX5Oznz55Hx/LX44Pn9H2Acv/8xSJLUwPun61+tObD6mGf?=
 =?us-ascii?Q?i/VS2djb0eAjQJbqRm+jKEudlyNapUG/7MowwxKPxbX5QRpSeBSu+vMogjc+?=
 =?us-ascii?Q?KcFMSPmcMOF//fDt+KNihlNTWzu+cZ4BIfIFhXZlMWoydfUU7lTUz4R6Uq1k?=
 =?us-ascii?Q?6WUc/5XKGlt1KW+wNhLzLepxYgqaTzIU3PeaH+xCzborGlSM28ea1g3DTW1r?=
 =?us-ascii?Q?ECx1HOOUYdWbCPOajDvDw9tYHoOLjUeeSwqOHd8QYzZ49H6D6NGjglM7t0uO?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bGex6m9KLnWRqb57sLnxqHUizH2jLzN9edpTenW2Ad9tfQpZBibfKWC+lQXS5fCP0ZzrMW8UDZkPwPSQLwGfEbhFQHYpCy0aE4st97er8/jilCfTA9xrskKbT0LjOKogzWSWMgXbWs0QmD78nk5IP4YjwcHcU9OKAicTVXNole12D22UC11UYNynEwN6sQY++lcsmlqifnaTGuMVWyFeRjCaNQ0MIBvP7qaN9KJM1Uhf8maq2YX05fxT1sBQN1y4IoFRXTkpgQC+x4uwjYwTB4ojtq805Y3GGZwjcvlPARZKGC7lcQafPcLlp3mmBP/eU83FewMiDuIqpTiRfa2+HIWCy16kFE2B5GAhKSQ28uvLYfg6IR62hQp2xB7vVg6NHykgiMLLvlG6tcVnVa4je35OR/m/NAPZp6Z2sSgWPlnvMnK4ohz8WL+mws3uSNSn/8keeJ9ctBaGozK8P2C72WbPJiiHYaVinvN134gQGTpDEgRlZP+miyFeFu1rg52AZRs2sbObbAUL1gxy8RDgcANr7j/7sLKlj7VWVOemjn1FgYdAz82On8qEhS3a3HDP8FCRSIm3Y4wLsEJR0w+IkGyxAESClCQZvRg8zn7mbxs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea857b56-dd2b-4122-db8f-08dcf96c0de7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:22:46.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSYRpI43ICCqewQ4kiNx1HXIi6K/ZAhoK+Eo67a8q7y9QwuSo5s4AjeLzTS1jaWvByat0Lxg9pHrWgF5qzS7Cc7XErJyc6pj77D00SbqpL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310038
X-Proofpoint-GUID: F36-5vRne3YBpPkjpAsmJewS6NLxWa9z
X-Proofpoint-ORIG-GUID: F36-5vRne3YBpPkjpAsmJewS6NLxWa9z

On Thu, Oct 31, 2024 at 12:49:06AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The shell can report when a job is killed, potentially
> polluting stderr and thereby mismatching the results file.
> 
> When a job is killed at the end of test, appearance of such
> reports may depend on timing details:  does the parent test
> or the child job terminate first?
> 
> Many tests deal with this problem by disowning child jobs.
> 
> Disown jobs in a few more possibly problematic tests.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.dlclose1.sh             | 1 +
>  test/unittest/usdt/tst.enable_pid.sh           | 2 ++
>  test/unittest/usdt/tst.exec-dof-replacement.sh | 1 +
>  test/unittest/usdt/tst.nusdtprobes.sh          | 1 +
>  4 files changed, 5 insertions(+)
> 
> diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
> index ee4d95f3b..b65e4de5d 100755
> --- a/test/unittest/usdt/tst.dlclose1.sh
> +++ b/test/unittest/usdt/tst.dlclose1.sh
> @@ -200,6 +200,7 @@ function mywait() {
>  
>  ./main > myfile.txt &
>  pid=$!
> +disown %+
>  echo started pid $pid
>  
>  mywait 6 "started"  myfile.txt # wait for process to start
> diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
> index 91923014d..bbb7680c4 100755
> --- a/test/unittest/usdt/tst.enable_pid.sh
> +++ b/test/unittest/usdt/tst.enable_pid.sh
> @@ -142,8 +142,10 @@ fi
>  
>  ./main >& out.1 &
>  pid1=$!
> +disown %+
>  ./main >& out.2 &
>  pid2=$!
> +disown %+
>  
>  #
>  # Run DTrace with different pid probes, each case is its own "epoch":
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
> index 9f30bbfcc..f9cf6bdb2 100755
> --- a/test/unittest/usdt/tst.exec-dof-replacement.sh
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
> @@ -81,6 +81,7 @@ fi
>  
>  ./test1 &
>  PROC=$!
> +disown %+
>  
>  # Wait for the exec, then list all the target's probes.
>  # We cannot use pure dtrace to do this because it doesn't check
> diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
> index 50f18a6ca..4b5050ff9 100755
> --- a/test/unittest/usdt/tst.nusdtprobes.sh
> +++ b/test/unittest/usdt/tst.nusdtprobes.sh
> @@ -121,6 +121,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>  		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
>  			./main &
>  			pids[$immbr]=$!
> +			disown %+
>  			for j in `seq 0 9`; do
>  				echo testprov${pids[$immbr]} main main foo$j >> check.txt
>  			done
> -- 
> 2.43.5
> 
