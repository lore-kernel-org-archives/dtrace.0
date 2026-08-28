Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E85257827
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950126; cv=fail; b=Z6W9T5jQ6KPRbLUnNzWGiuL3CrgXXgeApyCKfJH+tzYTo69UMNTthXxc2K5EDojv28huBYPPov7RN5IPS6/zWlj2KulmoSA/N/PjdKg+Dr+85ZJKJLAPvSo/yX/ezsROEbBRV1Aa+4kH6elUs1DEXt/7Gp/Yr3WWyVMyRli9a7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950126; c=relaxed/simple;
	bh=0p7wlIDDRKLu5rMFtJLiLF6on1xQRY8oWHe0EnPrmiM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bOiduinqgcdsPqoMfWqUw9QLINCu9PYouOhijY8ZfduZsOocdd19OeNdcikBEft2dIKjiRzaA+LhFlyq0OgWyJiPj8diioRX0OtwZbVMjwUYYoyknWbHAxwOaSrvgFWTaMF0WNeYfO+CEqPiSvtRA+WMdxVq+bq3fp8qn3SyC9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hxSi/AAc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RZ7vCW5a; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hxSi/AAc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RZ7vCW5a"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK9W23147576
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Hx1iWQwmk359QcLuKb5wuI27ESITqJmsEDU8TOPGwv4=; b=
	hxSi/AAcxdl8sl5GBqgd0P21GuO+dM/d/1ARf/zn9swL4KouhnIcKdgr3ExzSvml
	na2bUSYK4pkN2or2QjkCrK/FVWDk0Ze0AoGMUBWT5IZGMhdEhGmdm2vhCN4n6kTI
	WtIB3Te3oDCRc4lSaf7V3rAxokMJ/koKl8W5Kw5yM/TWKJyGe69kIJsQwmEDd4x8
	zmAFIqA+rjPVDP71JP/DLqfrofDEnasT0pHycYyyfQkulsubovsc4RGz+ixUV5NO
	g5RmbhqN6frR3HAzzlGxV3EzFSRE3RH5LdNF9v24qPf02OhOGDoCJ7ZavWiQGs6s
	MZRrBMTjQLHX9k635A79DA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72byakay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:48:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SKe564001753
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:48:43 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hhg06-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 20:48:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dlkvz2hYNwSXYDeITuGiQlVLNn0sepXdQtJfP4glV3/y7SfzXaSEUzBYan3WgjwebI+t7eOolFqbccJnAIPLmzBb4wOT++xkkViO1eIoEB/pCkr+hYG3R6hLmV+tp5UDq9se6RJ3HjFKu6e8NsXVv4Xb6ol9d9FYt/vNnVF8bm7xs1B8390SpXr2TKvHI+c45jToPesJ7PNsT4DR9foTOZrlXLgfiOQ1KBLUajVyC4N5Y8rLrBNWR9Og4SiKFK8XJJqTdoKxZohjtL34n2wWHf1AeRR7dTOCSI7S25dlisZguy08qDMEg3QjYK+RrQ1M07NIYm7AJ2eM/d8YAF5BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx1iWQwmk359QcLuKb5wuI27ESITqJmsEDU8TOPGwv4=;
 b=CsA2J6Rk9W02CKEnnxSgMOVhCCr6ykmNY77d51R5TrPO3+rvJ4tSNmgpziyBFKnTYEoGyZQ7EHJw8MTMdBFNwIQewnXObPDyienHlgH36fn0lAbLpWLMhCNDvvIVqKoWRlCTpA+VxJxQ8T/CefGIaEdV9j46MoH52nBvHrVMnxm9CbOcRpUmF/RZYR/Fu1deA2IX0tLeVWpwCuX55ZmzEE2PKnaWFw5HQ3+CLMpP8SbnOnLPic+jPVMHBQJrQWS4/x8A6FLK1N4bO6UmBzdmk8CEkhit8JRDYv+iGIgdCKGrP37AGU4c5ODlkvdlmUWJgm4RhYZH25mIbkQfwhU1QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx1iWQwmk359QcLuKb5wuI27ESITqJmsEDU8TOPGwv4=;
 b=RZ7vCW5a0k/TueLI7jLOxEXdkk55t5DM/t3C/4bJ0rc88GNMqZYd8F/tliTs11fTFwXgImQu2xbD/ae85NszsrFzstT3FrlT46yzlYhCT0kg+34dH/Nrpc+kqlW2RBp6kaO0scG/B3XK37R375I1XrcmgbA+2lQGNoegs+QSs9M=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH0PR10MB997688.namprd10.prod.outlook.com (2603:10b6:510:384::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 20:48:41 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 20:48:39 +0000
Message-ID: <9ea5a8c6-e815-4b5f-9602-059246c85405@oracle.com>
Date: Fri, 28 Aug 2026 14:48:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spec: make dependency for fuse3 more strict
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <45da1d96139f5cdd2f451d58f46e67f6@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <45da1d96139f5cdd2f451d58f46e67f6@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:930:cd::29) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH0PR10MB997688:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd411d5-1650-4d45-a31b-08df0545bd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	rxwLZgM+9RxMsCIl778VUaU+Hqnd/CNRA2A33eSNTlSdqzhYxgH8Ulr245uVqIuiA2aqRaJ3CMyPH5ic4s3Lkhdf8hTwX0qHSmRa1S8SZybnSQ0t+K7GgTkrdjuPc6O9DlDmXhuP0wisTUaN8uk7IfU8gkGWwsI4ocgMz2sOd/ZhhgGpkPXpbkjbRlLGvn5MrKw6nZUE1iL3TMI7QoO+kb0AZWDyM43s5YWLSQ7+dRRdY3n/HxsAUr49XL8L9S16zIY2GN3/ULyED68YmW1S5hdyI5xt3xA2bEE6chxds5pdgZ1B0/qJ2isTU54kudOwRk97fzz4EGuceT/yosgLU03AlwbN7gUL8B3JHOG/B/nxNrK/zC0d4dJ9vhTpz9M1ZN5+JmiQ1QiRpkhl/KboUcgBk+niPJbHupsGMR+CnICB1Fxmhu/3oYzukwi6Iw4oIadS5YE5DsG9HNcEVj0LmdCIuLsSmrGzjJrwQOYZcdsTqW3dN3Ko4RvrNDUuyUAJmzJhG9uqkiu0QsRK7rFNdRAF3mlRotNa6a7GRSBpSckAkok5jxfzOLtAHtezH2RC+TJgXnBoZPPm1ueRA51QoQu0HTE5jnVFO8ttLZ8nLsAFvLNwcwt0pIN8p0w429e6BIIP1nhaDGoh4Y7HLsuzGYS6lid17DWRCr0hkRoZvus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWl5VXdzMVpiQjVTdHRVa29iVC8wNitMeUpKMmtNZVRYaFdFYzl0RGxhMjdI?=
 =?utf-8?B?eDJGZTlnVFVaQ2dVRG5OSDFJWENFRDg3bXNVTTVjODJQMUVRSTFHbHlzTmVS?=
 =?utf-8?B?TFV6QkZCWlRCWWYxMlFGamxReGY3RktxVUZtMXhyZUJhWFFtYTNCd2ZDbjFH?=
 =?utf-8?B?TVlrMkpTKzdpUFF3eXJ1WnR6RWRNUWV1ZFI4aEExK25lUHlUdVhQanQxVllI?=
 =?utf-8?B?Mi9jcis5R0gycXJZbXI4VmIrR0cwZGowWnVlcDEwcmlCWGVUZ1NDWWFMaGx5?=
 =?utf-8?B?KzJaWjdTMkI1dWpDVkZGQjZVNkdhdlhxSE9NZ0Y0TG5TdGNFY3p6NkRXV21T?=
 =?utf-8?B?eEszbStrcTZJdDZrT3JuMjE0NWk0OWM2V1dQK2ZjaXprZlF0VXVRcnp5YmM1?=
 =?utf-8?B?dFd1YWcxYTVvZ3dYODdqT3FrYkc0dktpMTQ4V3dpaDhxTkl5VlZ6M3c5QURJ?=
 =?utf-8?B?S2x4MDhmUkUxY2tNYXJjdCtlWkR6OEVLcEU1YnpWb1dNZGs1V1lvbG9pWENS?=
 =?utf-8?B?b2VpT2NKZFg0TlFXSHozSTNhVjI0VmwvaktuWCtCcmM5T2pCeENBOXF4Vi9G?=
 =?utf-8?B?SzcvNzVrWGx0MWxOL3N5NU5GaTl0UW00cW1iOHhoOTVOSjk2Q01XUXdwaDMr?=
 =?utf-8?B?VjBMbThRRHRTOFJtQTVBOHJiOTRtM0J6OW1aVmNxWGFWV200b2djOTZJT2FS?=
 =?utf-8?B?Rk1IUlZkYXhqQ1VXQW9zbkZEL3J5RWFwN2ZJcmxiR2dTWStUeFhhdDlLV2RH?=
 =?utf-8?B?NWFIWVVtdFhmRi9Ob2NuT2ZsSUFoVEhCYjFtd21mdnRucUcyZmhrWklDVnJ4?=
 =?utf-8?B?RzFDTlQvZHlpVURXd3ExSGgxZ3JSQVhLS3ZsTUdadE1VYzRKaXdqTTV1U1VF?=
 =?utf-8?B?dVpuSzNHMDFMaWtPWlc1ZHdEUUxxbWJNTDJ2d2d2cklaSmRDTm1wd0tmRW5D?=
 =?utf-8?B?WjBnYjZSeVNaZVBWd0ltenNNU1YzYW5pZTZObW52ZG1weUtyYjZUY2JrZC9L?=
 =?utf-8?B?VzZ1RjY4MVFNQ1JqR3ZYbzlHUFpnT2lFOHZsR3M0MzgwZXhJUjYyS3lLQ1Vv?=
 =?utf-8?B?ekt6Y09xOE12S2JRMno4UkhqMFJvQ2cyU3JLZm1EdzF0aUV0M29xWkl5UGVP?=
 =?utf-8?B?c29IdWZ6UFk2cFdXU29yYVNlNDk3MUZDS0dMTUFwVHUzcVN1OWJUZkdGQ1M0?=
 =?utf-8?B?djBFeEU0TXZSbjF1OCtIQm4xRVdsRHhwUkFDTllGY0YvN1k3djNoTW9RVzRi?=
 =?utf-8?B?ckE1YjY2NjlXSHVsQzNTUjJ4VEdIaWVTRW5KVXZhMmR6OTk5T0lmUXVhdXF6?=
 =?utf-8?B?SUlRVlg2NS9kM3puTWF5V3hNRUk4bnVhUzRGTkFPalIwbU5qR3gzSHhyVksx?=
 =?utf-8?B?TGMvdFMxNmFORjltOHkyNUhZVitKcGdwM1dXRXR6SURoZytiNk55OUtYWm5l?=
 =?utf-8?B?YWZKdU5xR2lENnRSaFpYUzM2NEtKL1R0dnpmNW9KbWxtdTIyMWZqNHIydXBx?=
 =?utf-8?B?ZmZ2cUJsODFnL0xoY2NSeHBHYTNhMkV0c2N2S09lOWFjcGFtcERCMmcveDBP?=
 =?utf-8?B?UXFOaWxUM0cvT3ppZHA1L1FiNUYyMmxpbkpHOWozejliaDRhU3h3bU05WUU4?=
 =?utf-8?B?dXBEditERktvalJyMUVmVXdhQ3Evd2dVdWhqVmx6ckJoMC9XbXptMkJhZWlo?=
 =?utf-8?B?OWdIbkJEcmZxSHFXRWtkNkR2Yzk1anRxK2lmZ043aVZ3TEdob2pxNkhPOGZG?=
 =?utf-8?B?QkVwUng4UlRUMWNWZC84dno1UGNBSlBuNy9yTElUd3NUZ3djY2NWMGpCR1Vm?=
 =?utf-8?B?WGtEcVVWWS9jd2pzU2dPd3VJaTBobjlNZkM3U3FpRCtvSlRacFozbFI4OGlH?=
 =?utf-8?B?KzEzWkU0SlYvSVUzeFUwY0xYT0taa2drZVkyZHNDb3gvN0JIMTI1VFFFT3d5?=
 =?utf-8?B?WmJsT1hxL0t1RU1rU0lSazdxTi9ZWlNQdHpsaWUwKzBSRWhVemRkOXVWN1Iy?=
 =?utf-8?B?NFZGZmZnMW1YOWJVTUVqN3ZTKzc0S295N3dDWmdxMHB6RU1sYVVydllpL1Fk?=
 =?utf-8?B?RWhxZnBBMktUNWIvUnFWRFh4bWRCQmRvbVFDaHVBWVVzTjB2ZUJDT1dobCtx?=
 =?utf-8?B?WHRkdFZRWituUXg3QTl0K20xZEozRElGbndTTjdqZ2ZPc3lIMXJJcWtlZGRJ?=
 =?utf-8?B?UGtkaDBNSk03TEhHUGt4d3pqanJPWk9GNnEzSjhMNi8rU1QyYy8zQXFDb3lk?=
 =?utf-8?B?OVZlckYxWlFDSG9FSG9oWXJtMy9WVGNtcUxrWmNqUURDSGpvc2RhQzNaTVhp?=
 =?utf-8?B?N0ZVR3lsUWpEQmhLUkdEUW9aa1ZidERCSXJOeDVFdHdUbHk5cVNwZz09?=
X-Exchange-RoutingPolicyChecked:
	q4EAsyoYoN0ayozhTxwUCnd0DzJa0oCVM0exicHvdj6vjnwv5NIb4f0N2H4FCEi2T+Kfjxok2E5pThUGMECr9itulZJaCQXWr5DhhL9OrAdChu/AsuXUNFGCA4krWUA7kl7lFL0I+PXHKnzUqdjYRKQnLVDpJD/K56mcJaRBMDBHfpoGtiCPv14eoAjiXEFFSRkelrZ7gsCJFvVId23hcgUYav4Dz2k4PhiVALi25dizlnp5OYUx1JjZCPSWFhOGudyRiXcweiYhZ8jyqpsqZNfu2BRTSrCrwNgFcnSGlIzqQOJKyXPbzdLy9jWYCRFwjC3mBUQMMW2yJ1QrFKpEFw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	INqYwghgEqJ3wiyjsLz/xBMguK6pBE7Ljt41Xn8Chq0AmROROkd/bBge+fy+j/pFjdC0Gql9Kuczssk56bi87iwgCCVqvLnzsKlEophgwJywUblLvEd9Oo8moRqhm1muKSNpSsrpxX6MpKyabozEA840WUbID4h80SxNeN7nvnVlYc0wmQfTp1tENEAaCESQXiSCHdlWYUzX36kAS57dE41xbfrKLWd+sK8mdHWQeqT5Q67nhnwBb/A0waAhc8zfa5oeyc3NMN2xV2Ij220NoQbnhEyp08iBoMpQqaLkVwGAAaj+dEyKg2VMNKvEtNxKRdgK4329tb7ScXsEpuXq4VIkc/+OJDYcG4crFn2PIw1mtNpHZ90Hndni2GB9vhAUnnwrTCaFJD55RHro6aVWcnAYhkuGvdEKpFHeYDh5YWYK7E8HJOYm3iQ9qWSy5gB4Aqo5L9zQtBgKiNmkUUZxM9dFldmvsb59G4GYYih8v8ThJkBKQnx80ppVl+nB04sjNpZ76hltWba74LaeUO/SXVXYjfJczjf+tgSoWigaJn+d5e+qr4MV/xSW0Qkgk4yPxvb/13tVGHdw6VXQrQeB64NWav7BAAvqsJSXpUTIuIU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd411d5-1650-4d45-a31b-08df0545bd22
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:48:39.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLhK0HPoPlNNNpOzImV8QqJo7QNP4T09mbPeL3B2+P9TJuLxJX19rWr7Z9l8RAc7PaJpIer+014fZQsZG7MSkgZIJ5kEBCxndiVLydovTKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997688
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX7fsF9v2pQbJg
 Vp8MLj7pQ8gG/U2i7r6GjKdXiqzeGy5Ni6uccpKuE/cZwiCNzdVKkzX5LoswAxBoMpFiLirx1BP
 RBktf4+sfGq3vkQRFbJ29bSi+6jBly8fEsBRvgkqO5xl7pJQoHworDDvgNlaAmf0S/A6Buztv74
 x5AdNGw+rkwvve4TgE6ykutrUb4966rgqeozl3eak88LE2celJvMpouu4/R/DBz9/a229MXOimF
 Wk8VAQDDpXvgj9GAgvovWKvbbOheGCjtexVYquGHMvK+WrZxoeqp3+qnPCmVhe7v3i4iAsm4XAO
 VofrIGxnehLGuuykh18H4D2z4ZMQhcOQknyYICDvU7Q5G3BSaOlAZcTFGmfwjSXNaO4qJZHWGzk
 PTGyWBLzb6hwFQdHr2ZJXh1zDiuqeUGUowJf1MFRNCqUj/fFLLRAqCb+5Bu42FYd9x/8JpXteiy
 iUUk9TxIHTzDS9Yb77A==
X-Proofpoint-GUID: kOdYASUA3KtqBcMISgsvBxoE5GAlQhP3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4MSBTYWx0ZWRfX54eFgNlRXK3G
 2Rrj4JoDWefvsHIDuue0mMLbcfx2jOrkc0n0j1SbLb1RrYNKWbYAYhW80MniE33eNpTorqZXvgV
 lRpHr6USE83kpYDsz+YZhLrKDPcaRoV2X84tJXPqSjy2R3Td51JS
X-Authority-Analysis: v=2.4 cv=fqTsol4f c=1 sm=1 tr=0 ts=6a91f42c b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=3tRoW1wRWrjmoSvsU80A:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: kOdYASUA3KtqBcMISgsvBxoE5GAlQhP3


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/28/26 12:49 PM, Kris Van Hees wrote:

> The runtime dependency should only be for the fuse3 libraries.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dtrace.spec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index d72baf9d..f294e28f 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -53,7 +53,7 @@ Requires:     fuse
>  BuildRequires: fuse-devel
>  %define maybe_use_fuse2 libfuse2=yes
>  %else
> -Requires:     fuse3 >= 3.2.0
> +Requires:     fuse3-libs >= 3.2.0
>  BuildRequires: fuse3-devel >= 3.2.0
>  %define maybe_use_fuse2 %{nil}
>  %endif
> -- 
> 2.52.0
> 
> 

