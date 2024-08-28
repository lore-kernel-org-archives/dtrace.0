Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162B15749A
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877339; cv=fail; b=jUBCvX2PCs1TbhCRYba6MWNqU3g47QW8uBbLIj3M2wQpc9t98U+Q3e3louL0L7Wuk3XNSjOVlnuitQJV1DhwY6B0D4sahCiK8hyXk1t+e2BEiPUfdMJLIvYd8A0OPcIDbJKFNUU0qO7lvKNXIIRzAblptEHRhRL7I/keqllBkD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877339; c=relaxed/simple;
	bh=Es7BHrWUOGtmqAzvzS2tJjUR8aMcBpqsyAPRVbmxOk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k4AIC09H8qmMCRBKXWMvUhqk4Deh93xud/fVhYdt0COM4ND6z4Q6Maqwt/e6LY/im1PUh5DL2I1VHOZsEp+0iANL6fKkjBH6BliwQa9x8pUzKRy1ayq+epoLIos/92a+8V/3C5hyk1tchymYXD3F8PXhj2VGC6trAGpoF5F7gO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gkefuTCR; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Qo5JQwVU reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gkefuTCR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Qo5JQwVU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJXX5Y019674
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=I2PHRIn9otr+2GJaXBmkBLxvuM5GKnnFhl1chvL824E=; b=
	gkefuTCRRR7soUGuJICUmRN67Yfntj+/H19+Lt4WV66odeQLt/DKc5iBRp8RQbbN
	3kcQqlHq4uG+CzP48yp0E+1hNrNtw1+fk7TdNB5o2U1GERhkPaeN7+5JKXpr5W4m
	5tb1kVOxHv6SyiNGtzJ6aj3F/WICIkZ13HOaJhvLcTg2wgRz4Dpi9tB4gFGRdiJ1
	w71Sx5HcJQVxDD+n6OVONF+1+TkmzNjLFJcpbUVdiNHGCSGR1jlM8ENhcGAyT5h2
	+XByQlB+7lh0m79vVTxpg6uXAO0LFNnPKtWGc1M4DUTp/c76EhqG1kdTFBnt+OEW
	PRcRdSx2HA48xtpZ2/ztUg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukt9qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:35:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SK9pp7016854
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:35:36 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5u8ddv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:35:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifEsVrjsrLPyV2z9EuYj7OtM/Yc3bFLkkBAD0CGMHudKxCQRNr8mdKxP9qq+QqwAEmeb5rWqGqv7H1pOd2HzeLlZXMuu6lZDU3M5G4xc9FAdXw9MMfDOUbcVUMKBfibDoqO6d3ZShi+zDrxrpgthT8Yl+plEvb+9OdD4KmTE8eVwhkqPp8SfyxL0epKpnoNt+419N9h0ZVdfDHXXrL9g7qeHDx0S7us+0HJDclhriZSbaqpkYm7qITmJkAZ61wTmC0E0oG6lGcntbQ9edNFIqgL66LwmXxgITh/tybYCGAAdrRnBfQ2QaRXjbKpGcl5DrsopG8IIR7a4qNWyNDfo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNQxX/fivMutD9iBzTUoYOTC0S9VRR+GnZYeo9x5SFk=;
 b=gpq4Q4q29fLISsLFnZCZawakQxgzWUutS4nPLAmj0NRHdwSGknYD4cwws+ntHUF9mRt9oMaBTgE7P6iJnOYAl/clj1exiJf51nIRCNPMW2g3c6qWdr6Eq5g69bjbO22e7P1Y/DqFTpu/oTewtL//cUhRwVntpT7W7XZBhmdxfUmJTFFdP+9+DeoMKITYaKP33L6N4vQ61GtlSloC22xIkPiW4xdilEXBxwzdBMO0EQW4NJhVkRN34i3PawCWYmlL85IexDgYmgMARQ8bmdhtNUuI4nBj278X1EH1L4AGLYtaYX029c/6hyNUsE+JfO0utX98v87hkd/S665UAFKHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNQxX/fivMutD9iBzTUoYOTC0S9VRR+GnZYeo9x5SFk=;
 b=Qo5JQwVU9MuDt7jQzqBEt/LaG5IxXY9IN0/9y73Tx31nd6AyufI/llOidEwQxgylS8qeNvMKbVZgRyfoSEbZ4lVv40DgM2veDFD2GtQ/+aYtLNgso9+XYv/rvLXfTrF8Gu99z4XNfKTLa/YmFAiguiL9eXXRiBwwlVNmjKKt9jk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Wed, 28 Aug
 2024 20:35:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 20:35:33 +0000
Date: Wed, 28 Aug 2024 16:35:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] ident: fix unsigned vs signed comparison
Message-ID: <Zs+KEuRUq5PzktIM@oracle.com>
References: <SN7PR10MB62878756B7ECA31ECDD54F00C2952@SN7PR10MB6287.namprd10.prod.outlook.com>
 <ea76fba0-c7eb-de97-685d-ca969d87f784@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea76fba0-c7eb-de97-685d-ca969d87f784@oracle.com>
X-ClientProxiedBy: LV3P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::7) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: cd28c527-ce4a-4c80-4497-08dcc7a0f6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?oKCe+Q2zpSy6jB0/9/nnSuSwedT+wxujNgNiOHVSQep7ZG/iYWeHK6bbx5?=
 =?iso-8859-1?Q?oZcinQ+/0sazmALhOZh7kfqx36KNFnGB/hLVJ7VV7vubJOK50g5iTXoBfk?=
 =?iso-8859-1?Q?tJWLzTV85fZ6tqNel9QC+aG9Q+IIuZjZl6mRBO+duY4k8EdPwe9XaXcSs1?=
 =?iso-8859-1?Q?YBtrVBHofwOxsoeRvZEMgE1NdhWl7ietKMk8Fen0p2IJHlumewwih/96yz?=
 =?iso-8859-1?Q?OpgLqTJCI9nbRRhFzCULUtuTAgGg2gk0ziXpvSltTnNPtzAwjOuGsYXhWG?=
 =?iso-8859-1?Q?MifoElykV7S7XgBG/U4+BcOccHI462dPIm7//qOAjpGJGFDtygSJYkSrai?=
 =?iso-8859-1?Q?u+T8OXdCJRcLOHoXKuzsQtyF5diPlyyvS2545ZSSeIa1trBl+SuEoapSKu?=
 =?iso-8859-1?Q?a7L6LRts8tCdFjyrujb7f83RhQkIn6gQc6H7slIeTG8vbdU5eseun/pcur?=
 =?iso-8859-1?Q?Xb7a8tc7TsOdwHBdlKnxsPCO4S+9wKB8j6g+6eRvH0JBq46yOSjBuUkemh?=
 =?iso-8859-1?Q?Ij0X3YOWSbKbXa8PPNHdSVtTKzq3zDNVJtUxn3gUbvXh8cAS98wY6dfrFf?=
 =?iso-8859-1?Q?EauyOlLElKQ995oiDTv7Dnw7xtvxr8wQnqarIT2lEZKA1brA9FQD26cHpJ?=
 =?iso-8859-1?Q?o9iDCsoEXvl+ifwIG0foRQ8+o9MOWuzIY5zPi8N89a75DeFOKw/TTsNqR/?=
 =?iso-8859-1?Q?TQzuwDrJ6jHNvDXgepZPIsRKpW4L4Mqv6pR4zUJmZWYpQzjdEVTGHwPlZV?=
 =?iso-8859-1?Q?wvvXDXKXKx06ka2KeIl3zjnkTdkI0uo6GuKBE4FyzEnU38RHNaYeRwLcIK?=
 =?iso-8859-1?Q?FhDCoLkr0sGnXIKb+RVE/+xEMVwAyXh4VADbuMI5oOHkXnqTbGqYVULa61?=
 =?iso-8859-1?Q?F0HyWaBYUsVj9egIODwZ1f4Z74+kWCK/B9DY6WagyYT5De6tfER/FiRdph?=
 =?iso-8859-1?Q?ppUSse+t6O9cBSooJK9TVJU2/dcAvfUrQD3mecNxnuLIfzj2+OYPWcb/eU?=
 =?iso-8859-1?Q?Qr4tukflzqd2TdfPW7hTH5G2elCYLiJAeh5oP6f7Zxi9nQuD8Z7gIuVYb/?=
 =?iso-8859-1?Q?C2BkrkBoZTc9+drWZ1IDXaD16N0yAlzyA1peR8VbOF9rAFMrNvf4OF3EOC?=
 =?iso-8859-1?Q?lYjD2DDyKwEBXLcdabWUBKUb8SmT8MzbWUMsSIMYH6U1L7jihF4noWD0ye?=
 =?iso-8859-1?Q?GI7S/eMkps9DrS4+JdXpi1Wpe6/h5zBAR7R4ZlqrVx2GzNv1bVZ3btI00y?=
 =?iso-8859-1?Q?pwY38uSQofoi/7iFl914lZGVf7ayyeLhVS+vbYjK3y8yuKQoPEYi3GUA/R?=
 =?iso-8859-1?Q?hSY0tIlOZgu06khCoh5R7pKWF+vxjaQR9ZKmqr/hP5LbNEKCC+EbdF9JxI?=
 =?iso-8859-1?Q?AHt+tHNh+/boOJrKbpMIWNNGXw0WOVKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eaiKaMyFg63QHFVlH/JuP5uek4+3Jtrf23BvRxtPz5oHzF32A1HYdH8Swi?=
 =?iso-8859-1?Q?cAezHE3oLdJGT38OzinUhMlSwAdo7d8yxfaBsTaI5jXjh5ye3nUwiaO3h5?=
 =?iso-8859-1?Q?mZAbqtXETkV2I30e6EHFl5KMG+EWDv1lvVeqLluQy3UKi7hx8dvE3cZtWH?=
 =?iso-8859-1?Q?tv6hCgLwWuhTOowm1Joqrm+WjzHzCAd2liB4Cr7sWpMT5MQrcH1w99OxLR?=
 =?iso-8859-1?Q?VqjKDsENrzWSbOuzP5mV+iDfnQx5x9QZ5F5bBRNKbp0UtAfoEqVebuqHyp?=
 =?iso-8859-1?Q?3Q4539WXqm03lgMbusaie7Edilp5QhX6Q0eFLUwa9jWu9gxcrmLuWJjmD1?=
 =?iso-8859-1?Q?+bUsVT0qjtb+lS1czKh0SEhPXXO86LsKxMnKJSpYbW1lQbO3n3xoynuOha?=
 =?iso-8859-1?Q?lY++qbps2AFvw7VxeSVbMB3GrqFZtVscA1QtxKMcMhdygFSXjuLGGgmSiQ?=
 =?iso-8859-1?Q?VdIDF+3RC6soPSCcriXRV4WozHvErWMb6Sv7f+CscFfKvHqhV9j1ai6Kyx?=
 =?iso-8859-1?Q?+Z/64a2QD3vI3S2s9Q5UJ0hPlvHGxvElhBxH/33DlVFfWY/y4gTp1XaQnm?=
 =?iso-8859-1?Q?56U1oHOKVPInmHoII9xIKoxyHRPLvSi5jOF5ZoEyJJpcR0/PRMBlH4zbF4?=
 =?iso-8859-1?Q?p416cFXO/mdcVICJVEIFyUaUacXF0pdErMJHR1p+mwNSAGCnSg+atZIeqe?=
 =?iso-8859-1?Q?J1SgMgS5gyQYpHlyC+kD7qrA35VvVCPSJeDO0tR+OlDzsl1nyp4XcuwLvW?=
 =?iso-8859-1?Q?4sg2GGjL26wAwLmV5ZEyOYk4kMj71Lcp9KJnEK6fiR4QischGG/hEREVYr?=
 =?iso-8859-1?Q?FebfzxvTg0p4JVeMRovCJVgdNtjYGZNAOsEBJ7hk8nY1IboomUEYmZ7JTJ?=
 =?iso-8859-1?Q?+Ne6DnR3pn3Cc8QREBH6ERAATAI8bXeocvLjbjs1DJW0PNq0Ozc50rBkMh?=
 =?iso-8859-1?Q?6yfWiuh106LggZ8uky3BkRxTvdBWoqXJSR010IzcQm38zUaahAa81Pby90?=
 =?iso-8859-1?Q?NfpiqMcwNk7ky1/HfTch3OnEkvYWJMGGE7Vn1xGuYyPrhLmDx8Pc2YO9wA?=
 =?iso-8859-1?Q?nPGF/fxsq5HXF02mFYEqQFU8IpMOgnNdGXo6Wd7GSZNS8r97louLnpagDR?=
 =?iso-8859-1?Q?GaojF9y7/mhB/ljzKpic5mw/7m/P0ncuFUQqrYYSb0ffYgPq6pKiFLt8Jh?=
 =?iso-8859-1?Q?bL4wUXmbNqIzucB5YKDFvAomUWvwMt+rKmWbnb1HbC0/pjeGFVay8StCjq?=
 =?iso-8859-1?Q?tYc7CNrZBrqPuhp2PMU/YBWjdwe5jBCzRWbQwWtdp7cAypJrRYeO+T4fGF?=
 =?iso-8859-1?Q?6RXR+AoSz51D5Lu8jWdqAPAtsvkoWB9sZ6dBkG/keM6b045TrdbyUtCk6y?=
 =?iso-8859-1?Q?MVsnkI1EFBq3vWbRH32hl4AIlL8mewJ/DP6rSchxQbgpBu+iN9ftNgJJoo?=
 =?iso-8859-1?Q?RvQ8qIpJZSK2MQ432UIAGsFMHn7FefZNv17q4z1I96pgF1lKZ3Vlb1d60z?=
 =?iso-8859-1?Q?E1u0yJS+EzkF4iKGW2q+MWbHoGoiik+syx8h7l/89pe/xw8rMEQd1ThUyf?=
 =?iso-8859-1?Q?ftqzI9OZZM0hYHrW4VzfbKOS96Ocn/TjXp/cIolAHYTFkDEL96Fp8Sr30P?=
 =?iso-8859-1?Q?ZKi8SvplChFNbUI4G2fvuUIoOlWmRpmrFYfye+rtnRgmAzFxpoSeFDbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	phMlB8xUsgDZmHv4K4lJmMW1fgSsNecLTbdyPSU/sXQhN3oI/8BdiBsD26VR+rY0p/lIn5A3aMOaMuWkrEumbUtuM5cFrLCg0dVQ6RkA5YIUBwT3irlGeos4EeL3YuTGE9FtamcKLfR05u9SggLm20CO7y+2061/dN0ulocOgPpjE2PKq5YdAyTiNAt7zLNA9KkriopDOFXtd35R20ySJM6/8hVtvoJNznFP+4N3XzDSo4D0RxGqBIh4qOjNqfJTxTtd+5ufrvdYEcmJrX3B1P+Bztzejsjfx8Ko5VnoZSZGpPvqhSOLzNgAg0RuxUABjPsNXcQ/M8ud/xpdde1pBIwhZvInSx8jr6uZKX3H99fC82334zCHf2XAZXs2Lp2Twm0BlttbrxTvz+CS9r0tYKQLMo865/dpEIUqxslCid58hpjzta8yOi3qybXlXQMwT4QbazhBsR64kw29Q1KKyEwF2L9G7Z5F3l/BG5NbwMdL2d7X4synHd/oUxEAsbECwfIvlnmapUv7g2Bq29mZVI1No82ZmpxurshocpJL0IPIy/h7mrHPYD+BLZDzEHLEtVRWCvckZYT0NadKxLPTfKQQ4d36Sd7ClUeFCBFEEjY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd28c527-ce4a-4c80-4497-08dcc7a0f6ee
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:35:33.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUFFU/8LedlK3unedq/StVi5Ac3jhtZ4KrEdGgPAX2+ZL0az1xOelJ+M/9nVmyEgu4mX70eFcN1tBgiNa1ZsFRPzd8xDrSIK/WOkTF/tVBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280148
X-Proofpoint-ORIG-GUID: Ltci4kjxo0DbwQ_mlutwBa9nhFnMJmkc
X-Proofpoint-GUID: Ltci4kjxo0DbwQ_mlutwBa9nhFnMJmkc

On Wed, Aug 28, 2024 at 04:20:26PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Incidentally, is this related to my "Supply a default probe_info()"?  I'm
> still in favor of that patch, though if this ident patch goes in first then
> the commit message for the probe_info() patch needs to be tweaked.  Maybe
> the two patches should be combined???  (Maybe not.)

I don't think that patch was ever posted to the list for review?
