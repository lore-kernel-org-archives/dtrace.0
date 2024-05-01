Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2442A96
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594373; cv=fail; b=Y69Tz0mVWc5oXTy+ec5bpfALLblNkUNTlHhNh7yC6pVslYntUItHvwtvz+rILndeaxxkflFndYXGlyDx+kT9RH6+ktyfm2jV1XAU8nbmoryASQyFGhYU47i7cnzaLNBv8Pl1LeidnrDlWbsd46/E3wVwChIDDaPX78NCZtXqGGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594373; c=relaxed/simple;
	bh=p0DOjy20f2JBt97Y4nfr567O+MjCbuCLkb44s0igzDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qws+is9KogceFW9S+OtKpAf5yW4BnAHHsPDwX+/ei4gVUv9N1g//7qWO0IRX5qx+x5HbcvgJtvsZwsstuCiTFnRyyypF2q3kzc2+Os9Vmdxd3QW1g4O8t7ml5YrEBgAnliCPbxeHTVc946PdLra9PcpJD5KNovvjWOw7iKSQwY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CVCZWuRi; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FD1iAR5S reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CVCZWuRi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FD1iAR5S"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441Jbn3o024912
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 20:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-11-20;
 bh=SUc7tIBcksSOZkI8BNy7hcm5j8SEo12Pevi13FTKip4=;
 b=CVCZWuRiTKc0TYW7kT6pdbo5MjAVybBST2eyrQ2Da3Ft6mCG8oZ3XWQxHwX7FEAQ8q0Q
 9fLz9dDEP34QtOdg1XrCD7WajC0EQgKqItfSQcl992fIH3HoZAMucqy+ZYe2cSpfBYVG
 lRu1FNumDAjzkaZ9ZseTMaJkI29ByAdmj4W/YLd3p8EvpWBVaPujxIXyDcVmOEr1uadb
 Zef0WoJUCHcxi9kB9XoQeHvUNyYrZarbRguk0vTne0C8h2liInzY6KoTQhWtVcdA/KN1
 S7quMelnDpDwSnQrcZ+XeFWtrwU35IiS7/19UTcujQPZsj+CEtndCwx0HU9OxfRL1WOt eg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrr54g0gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 20:12:50 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441K1Ppt033207
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 20:12:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt9hv31-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 20:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs8LzMbxA8B47qSbqr9ZQe2WDf3FwYK60vbEOZag3rtqVMyRJfIlNckhYOjOIk7B9MZkC9DMliywELjgw1taZRf5xdOpgUSSDpPJL2LMvdlBre63CaSXbWYS6EXdt9nFzrCQuRYLXyffHg6UdNFvQsAyuPHzize+osHjtCumQKxmwvKnicUICCzMqfMMnDcFwZ0+gzM4taK/cU9t2jUDOXAEbkHsLYwWkZljQndphupm72VorAWpSyMUCxwdM8gm2oISrUESl3LQtZLWtunVp6qw48TMPdupbuPm4NwWvUk4gkl5Ne7fAwqhZlVL4GyAM0Uzf8ByN4vkijExW/rBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xDGOa3VINNFNJkqOOouOdkrUE17+uJrO+ffBuQsOPw=;
 b=OdEbevyUEmYanGbAmfLaOX0jFW3nnt0yn0i6NhVPM19HprWvXSiWOcWgUNc1xS9iPcyebevgMM/wtultNEDRz/m6gNEWeBCZnt+uaHqdWvQy9Z6MPh/gjU++UjbtDNB83MEONkf+Fq5qzKm/e37QcPW1hymoed+x4XqsZRRbHwKQa2Hptnv61WrZaAhWsUYVrBn07T5yT2kVX8ODf/KYtL3cqRoL7dnbeTD4C9cPQJMC9P5jNz9g6ILS52rkcYU8BVSSjGl+8FoBRaFr7/gBSM+UpYUPTtUMz7QZvycnA/v9lGwEg+gVm5zLMrGyiZXv3QYCIp3kLBomLmcbrpmwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xDGOa3VINNFNJkqOOouOdkrUE17+uJrO+ffBuQsOPw=;
 b=FD1iAR5SIfzP4cEIsFHnWJBzNuVip6JayW6ipsB+JGRrT3Bb83NiAHWuKuXCHMJO/NrVDk46r8hLWGPOTfqgO9DBs25PMhabpnfb967gVmPO3kxADAt5Jkh8g6pBDQuJkdh2LMh0AZfiM+XPd7+1MZhdHTV6Z5cWtulBOlXI/T4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4237.namprd10.prod.outlook.com (2603:10b6:208:1dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Wed, 1 May
 2024 20:12:47 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 20:12:47 +0000
Date: Wed, 1 May 2024 16:12:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] cg: allow providers to specify a skip count for stack
 retrieval
Message-ID: <ZjKiPRAkL0jjAHKw@oracle.com>
References: <SN7PR10MB6287B127ACB48BA73B9CB46CC2192@SN7PR10MB6287.namprd10.prod.outlook.com>
 <8cbbd931-e46a-6ce9-931c-19f238d70abc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cbbd931-e46a-6ce9-931c-19f238d70abc@oracle.com>
X-ClientProxiedBy: BL1PR13CA0445.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: bda009d6-548f-44e9-bbc6-08dc6a1b117b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?iBNuqJsYHXYRbgLfpktzWy00WwzMcdr2pdsQ8bqGCBesmF/FIxQr0bRn9E?=
 =?iso-8859-1?Q?xpaMh0t25OGInuU2wb/CJ8JdIXKF37cglZ/bdjbFfbkUBth0GGkJVwnciU?=
 =?iso-8859-1?Q?c3RIcZztEEAH71A8qHkN6TdJ9xlv8A2MV4gOhhRlPALjL20YIbe6Q/YAe7?=
 =?iso-8859-1?Q?lSlAIV1qf0ZQJMQBcsoLWnjPe9RBh+2FUbZ1R8JZ3VWZFJnYnt3Rkh2HuJ?=
 =?iso-8859-1?Q?xD39MxBbDzp8ZHAFbmikaVDWmUaQ7+53vZFbYOlSkf0k/UPZSmDRh7Lu1e?=
 =?iso-8859-1?Q?3/dsGZ0TC9mCIyDgbZcb0un8NXvMbuN6Fllej66ACDRuM4C8Jvl1Ha2264?=
 =?iso-8859-1?Q?9R1txiTRRdbDni8XgIHPoMIXh6tT53S/c4UhcD1rYUhv2lOBc4EMAcIew2?=
 =?iso-8859-1?Q?yopv8SaI+TZNx+h6D5Zna8LreFiF48yg+xVSQsrhkd67MLYrO6MgPUirAN?=
 =?iso-8859-1?Q?aeFUDanlAVqp5dVzLW3vehA+hu23GfhgXQNtk6qtcUbqyJprohc31c9c+L?=
 =?iso-8859-1?Q?/VnFawZYcNr3tW4fvDIAPvcqEQKYHLf0vGXl83K2kpR0ueMJ7xudLMF6Zp?=
 =?iso-8859-1?Q?cS+OzB0/KoeeKoZXG8RTQmEnKckHDGHLnChjIjWyOFKxSL6QuyjnFAlvRW?=
 =?iso-8859-1?Q?xGPU/FzVo+j4APySsEWOezpbRkb+eLnN0SHYilKntofhz+IMWf09wmYNZD?=
 =?iso-8859-1?Q?E4prYf1LQlLLAW7XxzYut7Gl/wYzCuBjvvM15yO33O96dPm5+9IPvNZ8T7?=
 =?iso-8859-1?Q?U/HeYEasr/pyz4rEepvVVTdnd77Qz6XZVWzMu6SnzdcyHaLsX4U6oWhf82?=
 =?iso-8859-1?Q?WxABrkoFjH5hLb2r8jv2lYKm+i3qqFd1750yeG2TePjIJhu4XeHs8PGc1V?=
 =?iso-8859-1?Q?qL1tkGjEVZspN/R7+fE+BAj99IZxbE8QJy78Z/myLhan3SEQsubIF6frj8?=
 =?iso-8859-1?Q?OjBynYWshXIQae7VgItBYGfBzpL95MnkmbrQBxxyC/MLmwQnRWrNFUPItV?=
 =?iso-8859-1?Q?ZFHethNI+CYF9AlXEJp7v4OPzI8H8Qb7wU+DFhZyQAyrb9i+l72mN+n3on?=
 =?iso-8859-1?Q?Tud+CY5KwoM4L0KFsm+m0kmcmGSUOxLKiVt5X4LiRNrKaGNjPNt3kp1HWc?=
 =?iso-8859-1?Q?ijwjNw8nb48ARKvcvBFHPRs+ccgfBKvySCQOb5gpQdaWSDzNiwS6Usk1r0?=
 =?iso-8859-1?Q?LK88R+nqx0Nm487Zbr4wc4H5ul9cdiDLMAL0/FW6FA/6l8GcpM99qomUvH?=
 =?iso-8859-1?Q?OTHAIPqrM3fupQwO0zNjXX6DSo62rowaJHnGj8SW8hr8iOxTDibub0xM6b?=
 =?iso-8859-1?Q?Um6vvz3ve4iaqGyXuA8u/3OFhw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?IjAtql3Ezjt2sBWtWUH40s4kEoLmXyMhkSVddD3kRzUflCrD/eSvmUQVZz?=
 =?iso-8859-1?Q?t3ljNXuEQpv6SaIJFvwInHWEeY7fmBIG4geQfOrZrZJfKaow7r+5uoMs/Z?=
 =?iso-8859-1?Q?xLsmq8PsENDLBFyI6v9NG49uRG+8CJuOlhQjx9IIhRaNLWVQvonDSxHuf0?=
 =?iso-8859-1?Q?0emBkvzqIy/IPWNn0r3qXNfqyotZoAx6V0hGygqwhWK66Ux13AvKIDfSWu?=
 =?iso-8859-1?Q?Al3j/cgL9X60CD8gBY9b1mh9EvzsdNA/HFpEKxEv2aosfPcvsvm2YqmmsJ?=
 =?iso-8859-1?Q?CC8azW6+JPJOu+Gx7f11YdQZorvg+On7XejtWgL5j9KIu2fjdJrnehsnof?=
 =?iso-8859-1?Q?TbpmSzl3oRV6VQs0Oy/4YniYYecT4MR5ECqPKSruuwTdCqqzW8b+2nLeJh?=
 =?iso-8859-1?Q?ll6Mlbdv+ymiVxcUu4pZhCQNYdWkJVGsdLacQGtPNxKQnhnmJcPwQQd8Cy?=
 =?iso-8859-1?Q?JzCms6AsKsgbPWbmqTORZ7VJvsRJf47Rz0OoEddXGKnxBG/xDtj1G135kf?=
 =?iso-8859-1?Q?UBLfNlCQeSbOxKdxrqY+gIO9UalsZLweaxMORqvwxqaOe525uHYrEhduf2?=
 =?iso-8859-1?Q?qv8fndb6QV/pY+ODGn9Pqr9DDcH+awyFwOO+RlsUH5E9g3fX9JKgSxc+QH?=
 =?iso-8859-1?Q?Vloz7wrfgUDjpT0ALtROxXBMSCI3+GlccYVxQikOw01QXx79DcrhGqmSTe?=
 =?iso-8859-1?Q?qI9IvhngMy7Fp/sUf7iQgB+VFYGPsPUCaS+ooyZmy6pTb1pkJkW4ScczqE?=
 =?iso-8859-1?Q?lqU/LGNx4xAmuUslbY80HMiOgrmKwBZTLLXr5Hj2PP/RADle8VSx6C9ecq?=
 =?iso-8859-1?Q?BXdELF1dQUeVkc9V3FAIA0AJOdDRes9Vi2gBM+wXXuvQhBxJIgoZoUKTiD?=
 =?iso-8859-1?Q?1moAvS1BmZnqAiL68VxiHSHDa8GHRrrRcioUq4V4OoNCZMqFqEKgYjLr7V?=
 =?iso-8859-1?Q?3sbXWIY45zfEctksfFXjxwqcVtLtXMQbFX46s1adG5B9zSnE1VIPe4kG4i?=
 =?iso-8859-1?Q?34w3XgbFVfjpduh1yyRrIDpFjCFuneaREOm9gzhe6kZAvehkuic7qStFDO?=
 =?iso-8859-1?Q?CiM8GA5lXPYkmuF8j4ZTNTKawfI4FhmMF1VHSalhGuA+p4eFvN30zg4SfU?=
 =?iso-8859-1?Q?ylJuw3kLos5bhFfcpLP3IibAypcwpk4mYS8vwUmEnxn0aGocQ0V5lyCEcf?=
 =?iso-8859-1?Q?nm0N3jbKHVs2fbJc7uhh8wvo2z3Ac9wHrV1SUD8FwUgs2K3JNQuBs78YMn?=
 =?iso-8859-1?Q?VXiiv9k0FPsNbETZORVyrQQDWkUaLA/D98gqhHpdTPDZEnWbCwUZ4EBqoC?=
 =?iso-8859-1?Q?2D0gwX7X66cV+fDfGusn7IsZE0Qgv4iBmSKmhFf3vFwEg11AtvHZPGA+/B?=
 =?iso-8859-1?Q?/FO6uDNLK/teMcKzldpErNVGQIFvpB4knLCqOV4gp6jaOezfEb/G79abeQ?=
 =?iso-8859-1?Q?S3PmfCAN7g7tMUzNJwfekaFUt+5fOClOtcTGioTZc46K4IpURWsqRYBrdf?=
 =?iso-8859-1?Q?U314h7LGS5753UfcdkuzlYX8C61RVW/NpV5GXQo49X4GLOtOOUKSe6t4yp?=
 =?iso-8859-1?Q?VjInokoLnz9aIgBz5dyOWqNLn5iTkzzYPpOGiEkRp7Ta6Q1e2Q4dbIG6Qi?=
 =?iso-8859-1?Q?u9LRzHS3WG7NNSJKAkSQrUGrISaTyvkISslMOGV8HlTdCRMuGkJDr37A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+fVmC2EmQZywtsGPkJYPofJ5dH3rXhDiRYNjCaQenGvIjJ7JkzrIaIqqLQyLmvW6v/nw7s4yoCmox2MnW5lUkW9bQ9jpCFhzwXsmNF7yGBsc+GsC8sm+YrlaHqqsv08LzHcNmbeUYEfs+81PTPFMipHAqTn4XJJ9y+fbWwCV/UxJbaJORT3JGWPQJ6OG5eSviALuv4aiaTl0vwKI1perZLiPTrAwpRr7cJZJA7r0TUnHnOHmVMmKfnQhNEAZ54v1F7qUYz6QEU44SlPoilupWqiwUWVrZXqCG5yQUOJZiz/k6RHepH+xuTBrQc5MJbMCsKkoB/hZYTJSs/6CPacptYGdWEK+XunX1FmdmeKy1TKgAyCND/y0SK6HjvfIINI2caJbM0Ya9GXtyGu27+sY6A/U1YHnCXgN7pAZiydRLpY7fP5733V3lnVZciPUmiXKezzULk6fc+A3tyvKrlAjypprIDCbP41PMv7npTmZqyKsy2zvrwGTp1foZt1qjeajEWUN+VhYJ67MYtGcq+ciTzoEKAFyiQZcCGWZ5gy0cFuOTf2dyvCTOzQZCc/tuAl/Zv1mfU90VEFlGDQOvmZzpOUb3c/pfjTnSadMgdUxLVM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda009d6-548f-44e9-bbc6-08dc6a1b117b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 20:12:47.0613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B13wHzcyX217C5AIduCUMG+08zrmEBTR6ckQyfXsSBgYnltvJ2nw3/GRQf4Sx9ZyCrzPldwfFYFzW7pSlNX6GAbIOwlKVKWPjpnnct0R2aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4237
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405010143
X-Proofpoint-ORIG-GUID: GbAv9N4h52WjeRZ381sleVeD0ybJj2TR
X-Proofpoint-GUID: GbAv9N4h52WjeRZ381sleVeD0ybJj2TR

On Wed, May 01, 2024 at 03:40:09PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> I haven't played much with stack/fentry/fexit, so I hope this is right
> (e.g., stable number of skip frames).  Are our tests robust enough to assure
> us?
> 
> BUT!  What about stackdepth in bpf/get_bvar.c?

Ah yes, need to adjust that one also.  Thanks!

Incidentally, caller also needs to be fixed in this way.

AND this skip should NOT be applied to ustack() (nor ucaller and ustackdepth).

v2 coming soon :)

> On 5/1/24 14:22, Kris Van Hees wrote:
> > Some probes cause extra frames to be reported with bpf_get_stack() that
> > need to be skipped to ensure we report the correct stack trace to the
> > consumer.  FBT probes based on fentry/fexit probes need this.
> > 
> > Signed-off-by: Kris Van Hees<kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_cg.c       | 6 ++++--
> >   libdtrace/dt_prov_fbt.c | 1 +
> >   libdtrace/dt_provider.h | 1 +
> >   3 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 27246a40..36975406 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -2595,7 +2595,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
> >   	dt_irlist_t	*dlp = &pcb->pcb_ir;
> >   	dt_regset_t	*drp = pcb->pcb_regs;
> >   	uint64_t	arg;
> > -	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
> > +	int		nframes, stacksize, prefsz, skip;
> > +	int		align = sizeof(uint64_t);
> >   	uint_t		lbl_valid = dt_irlist_label(dlp);
> >   	/* Get sizing information from dnp->dn_arg. */
> > @@ -2603,6 +2604,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
> >   	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
> >   	nframes = DTRACE_USTACK_NFRAMES(arg);
> >   	stacksize = nframes * sizeof(uint64_t);
> > +	skip = yypcb->pcb_probe->prov->impl->skip_frames;
> >   	/* Handle alignment and reserve space in the output buffer. */
> >   	if (reg >= 0) {
> > @@ -2644,7 +2646,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
> >   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> >   	}
> >   	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> > -	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (0 & BPF_F_SKIP_FIELD_MASK)
> > +	emit(dlp,  BPF_MOV_IMM(BPF_REG_4, (skip & BPF_F_SKIP_FIELD_MASK)
> >   					  | (kind == DTRACEACT_USTACK ? BPF_F_USER_STACK : 0)));
> >   	dt_regset_xalloc(drp, BPF_REG_0);
> >   	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_stack));
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index 0ddffa20..dfeecfd1 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -431,6 +431,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> >   dt_provimpl_t	dt_fbt_fprobe = {
> >   	.name		= prvname,
> >   	.prog_type	= BPF_PROG_TYPE_TRACING,
> > +	.skip_frames	= 4,
> >   	.populate	= &populate,
> >   	.load_prog	= &fprobe_prog_load,
> >   	.trampoline	= &fprobe_trampoline,
> > diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> > index a24b1d00..bf3af0be 100644
> > --- a/libdtrace/dt_provider.h
> > +++ b/libdtrace/dt_provider.h
> > @@ -44,6 +44,7 @@ typedef struct dt_argdesc {
> >   typedef struct dt_provimpl {
> >   	const char *name;			/* provider generic name */
> >   	int prog_type;				/* BPF program type */
> > +	uint32_t skip_frames;			/* # of stack frames to skip */
> >   	int (*populate)(dtrace_hdl_t *dtp);	/* register probes */
> >   	int (*provide)(dtrace_hdl_t *dtp,	/* provide probes */
> >   		       const dtrace_probedesc_t *pdp);
> > -- 2.42.0
