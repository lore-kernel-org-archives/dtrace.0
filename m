Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1B217F20
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890157; cv=fail; b=P/SkMLesoS1xhQARNe1OJftl+A73/1waybhMQdedTUt6jf91sz7QzyBRUUiAzxuYUyf1GpXwI65UPi4kWekSEC8rURzz+Jtzt41AjG8qgs96aCAJ1jsgyLogyGIBR8pu7C9MbhkXkLLDFOXE4XkLB6ajhBxsTUt/fEd9sjxGXp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890157; c=relaxed/simple;
	bh=20xvNTEeDX+4ldeEYBiuwpyX/Hogc8ZPEuv8Y3RqU1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lim22GIX1LTbvqXshe0WQMdI1wRsJNF7CsKu+D1tVDDvQE9SJBl0VyQWFPHFwjwKZasAmE4E+og2eQnHmWDbMqtcg7I9yLz30R0XY9rh7g0KeaER9lWtscrvxKFS6zaiHrFJx5jNZcl7Ip70sVQofIUQpkGe5god1CsZZaYKgR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B4EHX+o1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BLR/sraa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B4EHX+o1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BLR/sraa"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdaZX007251
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PbrpCCacm2BXiZqpfF
	nRT5M0a5IzbLlDDRzqGjpyqzs=; b=B4EHX+o13R3d9KsgjPBiF3DhVPtsP35gHx
	LIZQcHnloSeNdtAhxkoRfXoBZFc45g/ziZvjeUHwu65tnQVXhKtGM/C7w7/7NJHV
	cigwkRYkSifKj3g6+CxxOEvb6XeJNeaH9dnod8c/2NQVfsTKEFFZacbdiT0IIiuP
	yGWl+piGUicV4WwYWwcMIJa9aALmJROWah7Y7I5V+r2gGZ/9F+WP5+g+qw9bcQxZ
	z/BFy+Wt1zHBLTGrFio9zIlvT1qjFMu+hjYuGiYT19ZH3SP0qKAw/2MZRHZXS0SB
	uo+Sqh0uc9LU3y1Dm64J8T4sa4pPyHmGpUtTSvFTONkpgifCCFCw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uwwa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:02:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PK6tCx015812
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:02:32 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhcs2x6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:02:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUX9lGItDjy3gnCFeXk4bIr99GW9zt6+lgsMzPTlvyhl4mbqCzR6wgXmtWD8znbszqaQOtR55VJOLVgsr/X2xryaTc7ILagu/L1qrTtegCBnBwdHtpgXcpUePxI3tK1srzCSOc19ViNuOG0uBygDic30JR0oxyMmjYeSPGDyMH3i0gKLa/b7vLRnCY5LcOZIi0JoGCVv1yN4tcwG5cJotrA+LL6t9RknETJrlJa9xkiU2k/iSY9WBTKaYoLHJ0cXjKtGO4oor/j87dXtCu155m1dgEN99ptewSmy3szp+b0SRI8AeoDLEzNAp6o8rWr1Hg0yLE3snzNwO89P/Eyz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbrpCCacm2BXiZqpfFnRT5M0a5IzbLlDDRzqGjpyqzs=;
 b=OZy1mOyfYOk7iKvB2yOmruY9eP0tuqNT5RvjDEWfMjj2yCU2IwXECpM1WOOgB///8VL0h6PEsfnQSoQAYLOry+jbvpsHfJHlHI7QmIJDfhPphxYOlsjYKmH0Sd9RlMYn00mF7hPOAz/RHIKduED+DvXRE6M2XXC6ZveXm/FRr0DCvXAGtJlDOnvWx+FRigelO2pqSMuF8KdDAEQID+OfJyYmuTJyZUjZvkA/UHHiVEm4RV7gv4XYXWRXDXJ+yDs3wR08/mE7mk1qTC4toV3cWCay6fvO9n2HDndgUVrFpvQTJfb9P0uWR2YfVTolK2WW63lLLD4zp+7W2VjMpdRjRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbrpCCacm2BXiZqpfFnRT5M0a5IzbLlDDRzqGjpyqzs=;
 b=BLR/sraamUx/OA5SpZ9PPfq7j8H1bJ4md5BcYLLpYuRT4+FB3IgQVolFUMmC/7WDv+SAh3+F3MUvdI/y66gPHhrxUBUdUJoXXtE8tsYebXQ2FWss+WrkpECEviSJ3Cb41vcR0OU/vy0IgvS/zP3aLffP8SmBcwpq3R3uBhvMLqo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB7061.namprd10.prod.outlook.com (2603:10b6:510:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 21:02:29 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 21:02:29 +0000
Date: Fri, 25 Oct 2024 17:02:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] Tweak self-armouring
Message-ID: <ZxwHW_cxAA4x41bZ@kvh-deb-bpf.us.oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004044355.25870-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:208:32a::16) To SA2PR10MB4780.namprd10.prod.outlook.com
 (2603:10b6:806:118::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: b33da2ba-5623-4c44-b9f7-08dcf538551c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OIFs9iMAAXk4j/HhvYHpgE0QYkcd9RxPqeMYZ6PRROAd7M84OFcKI8EMcZ/p?=
 =?us-ascii?Q?kLDRybb5iviLIeYf9Mf0uZzm8xUrfg2DE0UoWg87ARwTGx3pu07VmvpNw5n0?=
 =?us-ascii?Q?355ckFhF/rS37Fl9gmIo4Bxk1GKj8VeUXR5EsyO1SJ677auxrtvfwxNezS9T?=
 =?us-ascii?Q?+zJX+TlEPPKAY9AtSgLQObOOMkWEaXmUX7keakL1lqM5krIOd55o1NGg+v17?=
 =?us-ascii?Q?FyGthMfD8Fxm07PJAWluJrojt2jPNGmvSPC1ldgtAEanb4ChrfZbcRKbNFMz?=
 =?us-ascii?Q?h8iq/uuonhqVLZb73607/Gcgdznu/+VANehTpHz+dPOHyfuvg9YPJjXJ2qFP?=
 =?us-ascii?Q?gtvcRI6iS0mG0lXFCwjO4VuhFF4cA2IWV6RMaYbtymBuvGbyQh0PErKyd+15?=
 =?us-ascii?Q?BENsPnUXhaZSpyHznCIql7HKIFFSS17lU6uLHWlGOfJO6wh/k5GkR5xDAwJQ?=
 =?us-ascii?Q?TXSJcRJEqZ0lmLkImDO7aA42DkT2LTSd4Q1ZLyPomCbxTwFMo7D+Um69FWRR?=
 =?us-ascii?Q?Dnx5XREVQhHI/yV1vvzJB62gt2FtK6djZkvDDWaFAvYeou9qDY+Sxk4/OHOu?=
 =?us-ascii?Q?eCfZTZ79CSf6Y/9A0PyLc2YMlY1ytUg/7dFl+Vkj96KLomhmXW3dtjNsG2zn?=
 =?us-ascii?Q?j5oQRUAgF9KF8jDoLaSgSRqUGDGoyRUHhYVaInhnmLsNzs+/KzZyaM9fkPTn?=
 =?us-ascii?Q?0TBFSXRaxHcfpmwjhUFRoGGaLyqEA0VtceqsFBZpLQPejEIzFwDDxfGeihgg?=
 =?us-ascii?Q?6KAnzTFNt5bj5VFwoMgxLLy8M/u+Gtygyh0ArrOn/kDP/Y52uxp/xTlXlZ1X?=
 =?us-ascii?Q?VwKXCbAo5RoAqMKE1rGMlASX9Xbjt/GibqqVSISxpwWz3NVBvyl3a+mFVWof?=
 =?us-ascii?Q?Rsdyf95cdLLy7YYoXasM9p4WkxViNdsQeLmcbVHQFsjDHwwT40kZ8VxSegn+?=
 =?us-ascii?Q?ghDOhSrHNgrl/wAu0fxenYSc1JYj6kcSKoRGdM7O/1E0PwpXrF44eTcAcXC3?=
 =?us-ascii?Q?QX1S3clnqfcAt3EZrv0LQIQ+27Ffsf0cEOmitWm23pP7oZ40cPVjZanRho38?=
 =?us-ascii?Q?qsk13aax32O+VdFjM57LVJsjVmwSBs/Exhs8C17u0tv3t1JbTwjCKLmfvIcA?=
 =?us-ascii?Q?y5H4bdvlkSeIyS53/ycPmmXlAESs7z7QQWV0+LNM6Vx4jnXhPmG0KIFTs5/c?=
 =?us-ascii?Q?aWhNsZXtdNkMsshdUNXDEjh/oEoEjrqCL/u5UdV5Twj/4QsaABmvupl712EK?=
 =?us-ascii?Q?+UwyCXB6Qqcvt2VDxQd1+7hQoQSp+hBX4L9NkPq46MLeoiKjz6F756j1B2MA?=
 =?us-ascii?Q?wPV8gW4k6rSGbNzl/9pppjGu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7y2ExPIonvDyksuLnFO2utnTuipAmEUgkZiRdofWDC8tnyrHKsvsnjrCLlEO?=
 =?us-ascii?Q?RY5BUOR87N5QTDKD2v9W6MWsI3ZBn1E6xpYDT2iUrh9rZ0EyzfdqYsaG2x7W?=
 =?us-ascii?Q?v99YJQeh6t4gcdVkUaM38HYKkRxOSvS4qERCnpzXU7wjYycmM7cnqzD+b0MP?=
 =?us-ascii?Q?Tq/NSW9hQ4Vejt9f3fn4BXeHU38FZDpAFbUG4mir4UFO3kEqrhv3gVHEMupz?=
 =?us-ascii?Q?muE1uDO+A5/6oimaMr39gnggeDQPZKaLardik2/kX8UhudS0YCdKh9UUX5Yv?=
 =?us-ascii?Q?SBGyWj5dH6fdiVX2j4TckpyZ7ZuHj6fCk6Ca4RuOVlA8yxsKaThSdoAXTrUM?=
 =?us-ascii?Q?ftDoCKl3I+Lmqg7sR9uvpvKRyy1n4ZbDhkIXwpv47UwfFXa8QVKXoztEL+/D?=
 =?us-ascii?Q?QJRQZTH/Nd0zEE6pyVe1CyRiWp/Ee8LV9kl2G75WIqHg9ktShOnXsJO4ykjv?=
 =?us-ascii?Q?+2bxcUY2iJPSih5sW++RyDGcQVw1v3CBUx2XPcloeHNAczb2gBO8LqU6bFez?=
 =?us-ascii?Q?pqsOqbNbSpVzQqI+EHi4RHxCDDTaGm7MJ72QcLzMd4SdHpXTdRRarhglXvk3?=
 =?us-ascii?Q?XFsJd0r+19A+xdByH9rT3u+yLrfaw1mzDOhS59RhFOvWnAdePJsjgeWAK/wZ?=
 =?us-ascii?Q?8e85VaEVd40ryjk9w8hHUMeuGZsLuFVcwNcGN3vVlWrsNUxsvYpabixdR1Hv?=
 =?us-ascii?Q?Y5KiT0HPBUaqoENk9zB8KYv6bu7I3ENC3ArJ5TgdBLGqEUEpE6V0MI9ZMKxD?=
 =?us-ascii?Q?QVRuGDc7mGPMXsANnQlukasyYBI8JUrKM8a/CA4YpJHfXGPMThko3VL1rcDG?=
 =?us-ascii?Q?0N/FZGYeiL8Xgw8JiCKz/cCnUobaSIJ65Kqv7+/rT8nngIVdehf0c4qZq8Gm?=
 =?us-ascii?Q?aB97xpv9mcOOD4HYXF8uqX7y2JFJPSBtpl1h9tPl/tPCmKZBbEGCgTnl+vDZ?=
 =?us-ascii?Q?hZtvnVbuwMUX54SyOWEFPKFsUwrnhulzU8FLl+WElMPxDK6qQLeuowF2J3GG?=
 =?us-ascii?Q?FVpyY0IZ4zVavi021SWVsjwQD+YXZX4FhfvhtzsUtxkXEvrwYve8YTkHUvbb?=
 =?us-ascii?Q?q2xEX7CDohECU16rW2wtMoG6vWEtqy/+xNah1hr9mawngJKvIjzpNV2klanA?=
 =?us-ascii?Q?E51m2wda0IPQkGUGRb47XWw8Q8aXjEJhqu1D5+Sxa5mu/RYO4dhaEmQgwaC7?=
 =?us-ascii?Q?nlSYLa8mMBUAEJaq4eVa3u3JB6AE1nC4JlfK0YF/CxVHi8ZGfGZiu1+kQK7j?=
 =?us-ascii?Q?I7xbMbMQI/rpJ8p8J2hl284Lu8Rjpfj4OIb8JnSKDXpGnZ1oJuN9Av+W8ZT7?=
 =?us-ascii?Q?L7MbM0Sj9/p04vTACSZ3s6sMy1AVQ98d6Qp9hoKag4IWUBvfIrALxiFfofBi?=
 =?us-ascii?Q?3icMs74dPm1TXmn5kRPXuzKfSUB2Y6mdjFf+m7H4NravRNnshUu4DxDkkHf0?=
 =?us-ascii?Q?YstFwu7ZuA8MJD7Bh3gd5jj5dHrwZwxb3QLZQTNU2mrPTAwgcK1OHhjIMXLe?=
 =?us-ascii?Q?NObsGiye5SFpoIxQuvBDjoQUBVl4n1UtuXoymYwK1G4WvHmXizWW5osH2PvC?=
 =?us-ascii?Q?1i0JUD3hEVx/7/rLBkkhP0yo09hEL9Y+ThAaTLL9qleMMmSxc5mHVyaop76o?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qA6/of+4xLKa1smvL3Fr/qk+j8hN+Bs9Itl1VlHQL5leQHaTZJiFeQPsiH7ptdTTEyK/DXKSLB6lY8cUukY3vhpt09bgeQYxlIMnAMihHNMZ34gnZYNISCsuoeRG2B3OzLLbAw2KFX5LHogTyfmOFs/WONgLcWTAxIitdVKlb+3/f1wZjzUWiI/G0X/y3MraRntztfCUl6f7C4GblUkor9hWj/CgHfUcNnae6XC/Rrl04omH6P5EfPJcEB4Am0uMVsk7+0cjUbZLVTt6jyN8SsoCyafXBcMCNKjTdIAzagN2j+5vpWjnkTBT0i4Y/PReNkBG4aSlvcR2aatcRr8GLFqvpRA9m6jgI5MztAtProElx3tV7wvla6asddB1E2AlV4A8cTlfSB8bYh3B4qLPDfSLwYo6KNGv1HVVEB4pZv2ZiA/LM9jgDvejBu/MeevOmMMgzJdzY69garrUYtV53l6g/Nf0dmYle/oKbcz1nPnTu8nPUt8khd/ofv1ksbKI7B3H+gPSLPOLTQbgvhGXKPwXDxPSjFqKZ4VRXWWXLTp21QMxMcco5repQozszf87pmEqO8LxrpIkED3MMU1yPmQAJmXW9unonFcnaxI0l/4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33da2ba-5623-4c44-b9f7-08dcf538551c
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4780.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:02:29.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krRmBHr3y2BVTXvIYm752jLRTXQBFX4S/iU/5olgI7z+tewtlyz4eOOLiTXF23x5JgprAsN5fA8RKO5l1x9vLp4M/XSI6njHHCC2eHy3zJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250162
X-Proofpoint-GUID: BdnENHArX-AOkiFnMr6LrFuiY1Sl3_yK
X-Proofpoint-ORIG-GUID: BdnENHArX-AOkiFnMr6LrFuiY1Sl3_yK

On Fri, Oct 04, 2024 at 12:43:52AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Commit ea592d60 ("proc: improve armouring against self-grabs") has no
> tests, but it breaks test/unittest/usdt/tst.multitrace.sh.  The patch
> makes the following change in libdtrace/dt_proc.c dt_proc_control():
> 
>         if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>                     dtp->dt_sysslice) > 0) ||
>     -       ((tracer_pid != 0) &&
>     -        (tracer_pid != getpid())) ||
>     +       (tracer_pid == getpid()) ||
>     -       (dpr->dpr_pid == getpid()))
>     +       (tgid == getpid()))
>                 noninvasive = 2;
> 
> We change a
>         (tracer_pid != getpid())
> into a
>         (tracer_pid == getpid())
> 
> Changing that == back into a != makes tst.multitrace.sh work again.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
> index a052abbac..7c3eb2a24 100644
> --- a/libdtrace/dt_proc.c
> +++ b/libdtrace/dt_proc.c
> @@ -954,7 +954,7 @@ dt_proc_control(void *arg)
>  
>  			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>  				    dtp->dt_sysslice) > 0) ||
> -			    (tracer_pid == getpid()) ||
> +			    (tracer_pid != getpid()) ||
>  			    (tgid == getpid()))
>  				noninvasive = 2;
>  		}
> -- 
> 2.43.5
> 
