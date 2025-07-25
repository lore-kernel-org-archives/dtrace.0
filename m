Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003BF242D8B
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753470313; cv=fail; b=V4bk2CyGBsRg2P/42+1mvmydYMbd6goQE+sEs/KUe+0ux+OgZI38ynIou+nyqFnaTJZfCRU8nFg5vNumM9IHDzknRgXmsp1Qy3s4ZTFBrIQaltBTZSp+Pk5oMkLWiRG+j1jgC4LpOCZMFYzTyc3wHH7zhmWAAepkXMcdMo+V7+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753470313; c=relaxed/simple;
	bh=fQHRqLZUC06C7lGe9qijWnpQm3zBduSsG+bryaQ+9nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=APDt+OVFgnKFu1wgmgdD5fSrBaSjjZZvVJCWo3V70otnvPQJue7MVZCdy9TeSi6L7KZIaCHSE6vU6eeQnqgDXEkw0SSBMwOhXLZy6QhqBfXAKQqbm2xEZRLE8oLwulsAK33YGT2+EwWe05BJlNjXKt0tu7fd3jzoPDarV0K+yVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vwg+J3f7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Gmb9e5yG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vwg+J3f7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Gmb9e5yG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCD34007424
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=cqF4g+idOFO44NKVC0
	4fuOYji1SxQZCPZ+AKCoxISAc=; b=Vwg+J3f74FT2nC0DMSg3zr1elP0h0HHbNL
	CUqKt9x9/0obCJBFSauwPhaS3EyfccvpoMJIOsXTCcYwTzt0pjvICBDjMFOhUN/4
	rYKnX3uVGngknVT6nRCjR+6w2A0EtjoyxEgYIbWQs0XLoQi1vBOlpWD+5p7bZ3UR
	dsSlSKaYOaHq63Q2S6Pw6x5NLDlmt/A6d8TQ7V55OAhEQ8HDeNqedp4P6fgL0v4d
	iPIvDF0FLI0O/OxF1awkO4NV7YOsB1gqb/kILRqts/GC3ewswSVSWl/+rUGkwCNs
	UnqTp2sm/djHvdwAsBqXZERqCwgkYQvA/41ZBj+6N7gYRdaB/H8w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1k9pxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:05:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PIspV5005720
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:05:08 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tddt6u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et8btrKTt2i6NgPLfaW/1q8hrT8cgQfinmHt9v+b/6QL0jghoXHGqsZzKAobX4+fJzJud3i7feuQ7lL4/KoNNC8ZYYSZkwZzC0t3gwddUcnRceauSgNhT6ijBhEdjucfOshNIHZg3fwwUojSa7KdQlKtdG6BHqTX8HBtQwAUUCzAhZp7jA/dzliEeO8vDOgDtBe+w4B714aYzJVheDs+Sj5AjVoyJ79GTKRr246SJka4zr+dMfhTfiPW6UHc1owVu6O2ebTzwL2CA2Geu9eaPY7cQdBT7ctPXc/NC0WrdkgYjzJ9tyfxxdHBIUMx8UAUiOjvjRCWN9rF9WYId69MPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqF4g+idOFO44NKVC04fuOYji1SxQZCPZ+AKCoxISAc=;
 b=PnRWPELGCVGYkJ3BGZT+lrka3S5int1dQLPk4yZyL03S0bIUJp6nyfURJFCl6U6d6qT/ZZhHkHoPW7SIodbD/7Os7oIKy+W8dokPWe0W4iaXOZ0CyE11nHVMJ0kLJhksWAlvmy+q7iAaSTx4e7pseDbzUvCsEzdUQaO+7/u4jlV+AXyelsYTVuHdmybvonfAkifGHBJXWT+vm/Rs4PD6Hyr9iQKySZkrkxh37NdITu3HeF+6hIafAf4WkdiPTAygxSeleHPLBazGzn6SDBO1MWXyc04GmVLJUQ45wFNoWkaH+lENpq8dJ2QoqVk2w7HQjpb/YcqaPm9QriefsXY81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqF4g+idOFO44NKVC04fuOYji1SxQZCPZ+AKCoxISAc=;
 b=Gmb9e5yGhKjy4QLhCGLJCJlKLxko1omK6s7cJCcGtqyxRlWrnMqLCWGyBUenyS7N+wroBQVVbOgBzJHi3iVHY6tvgKwtEaWxNU8IXIvTdsXtkfCnBL4gayZFkR9OSLIUfCd7WhhaceJqHu2puW5grrd/qFjca/fjTbNw5e/E3U4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB6802.namprd10.prod.outlook.com (2603:10b6:930:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 19:05:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 19:05:05 +0000
Date: Fri, 25 Jul 2025 15:05:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] btf: fix symbol BTF ID lookup
Message-ID: <aIPVXuRuOvRLxy3C@oracle.com>
References: <SJ0PR10MB56726C5DD50A9020370699DAC25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <87seik3yme.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87seik3yme.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 30aed1f6-555b-4c0a-c3f9-08ddcbae2a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CN4+Tz6k+ThXG9mT572gcDyHfGwerjLTHZzUNXexm3ZPWnVNPtare0IV0D0b?=
 =?us-ascii?Q?fefZsYPgDB+uWNJQexakoyoABQIHVuOTP7s3BkbcBW4sVFAQL7DA5Gw9UsoS?=
 =?us-ascii?Q?gXyyhAIiK+U/GpqjktEvzWGKk8O3etKIOr0FKbFxagGoKy2a9Uqh/fHSYFzx?=
 =?us-ascii?Q?XcPodXcoEZmPg7oNNY3D8p1RCVgmJDROtXnPdrcJ6d7xKmOdhM8kEIc6R2j1?=
 =?us-ascii?Q?rlJ+d6+7smEyw3+st2yHpKZcs326bycGpt7qCvn9Tp8aio1wBQ6OWuf7W3n1?=
 =?us-ascii?Q?vf6shBsevRinu/2Bg1gjjqTHl8PjMB1nN12vI34Hbr4S3F7iWERUCWYLuoAk?=
 =?us-ascii?Q?wE6LHdL535A25ZZmo3ZXFEjTdbSYXQ1F1TjIKp+ODE2n/jB2uONWslDbTWP9?=
 =?us-ascii?Q?aysGwmj26He8PeOzCdgquhG0Fo/SpqW6KpPOThYVKc2M5tkYMt88IRTwFgi2?=
 =?us-ascii?Q?cYlV+tecDwrnRKPTGHZZf/DWsf2Yh5487g/I15gb1lf39OxUrkvbYGRolZuE?=
 =?us-ascii?Q?R5wOtLV1mzW4VGV0AzeyadKcv8Z7jWkzwPIRHxUAIxIz5CNYHganCe1QJtpt?=
 =?us-ascii?Q?dE2QIgxwbFOXCcrKuT9l1STjmDB/M4geakyzc2o1HEiUvNMKuoCFUQ76tUst?=
 =?us-ascii?Q?ROoP9O0tUxu14XHUcvnfqitGo84WS5UZMTcctQ5e0ne4b9HhWKTn0r0+FFee?=
 =?us-ascii?Q?7DVlmZPvZ9YhqdfnD/T6/sU6bk2SXvl4VA1gjfUVhOTk4JoFE/Sv/T3NakJq?=
 =?us-ascii?Q?6b7wlxhaDGhCEJYQTHd9YaIxFNfRAhAwQh+zuz9UlqtzQ99fneoIGRhxHxRv?=
 =?us-ascii?Q?ZdlxJ+aSCqoKHlhtfcUXCFE1336ZXSlYJuYJHFikUKvTCZgs/echnArdAY6f?=
 =?us-ascii?Q?VXrq36f20qEIA64xmmWEk6ZwjlA6pyK90Ny5jI2bfOhLT1rbH2PYBJGaIwTe?=
 =?us-ascii?Q?/GRoysZ8AEyBxknBba19LFWFyKUDHC3I8QVxvgR/GZfzpZrrmaNcNjNCMtLt?=
 =?us-ascii?Q?tCc7RakU55NZEJslFsII15/yzGzO419J8OKWK0PPjn2Cb/xKinIODfq+6Pbb?=
 =?us-ascii?Q?qB2n0/QOh/d9++0PGRMO21i8I39PhEDiZY/FMn9PUTq0Yq2Iohdktgy76Tj3?=
 =?us-ascii?Q?xdHTEMwr04opU6gNMKsSw99L+BKYcnZxhpcZq+mV3ZMo85eRma+gOQQBKv+J?=
 =?us-ascii?Q?BkaxX2ieSdEPFHz0OrHcVMKA8HGiVf9uNA+FxYzzXe3yRNHX39L/M4W2BwM8?=
 =?us-ascii?Q?k92OATZUKbH9z7l5nVNFmw85C/Vv9Lhme56Q+QtpZqi14K7RABJcXIiOqDGM?=
 =?us-ascii?Q?5TKCy/Jp6eM9HMfQ0XtldUKrmxlXBPX6mLD+3FDmRWCfRKsEwifptnfghNK5?=
 =?us-ascii?Q?ckc0geKA6Z649WfrPF1DupJfhyk9++SMfQNpKB3A7xZcmeh0JZGajqY4pxBi?=
 =?us-ascii?Q?FvCQPEzQnuA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ia1OOO9TpCAmVIPz0cM1T1x6avr8Ci2tzNt35yaLk3kvyxdPiQatjqzrS+Ds?=
 =?us-ascii?Q?XMw5bo1Dg8HIQhmrLZAjtjEvxPZ0mI+L6i2v8taxcLbNDmfSmbYZpj3HlgUz?=
 =?us-ascii?Q?/yAV7CgWuaWi5u8HNNiptQYtzijqiL6cXwTWdxEJOk7IZC7Rh8gOQ3tu8bfO?=
 =?us-ascii?Q?GM2Eb/TxufmVsyuLezfGtLh66UQ7hXca070RCcaZ02APGJqs4BxjnJn5uXwT?=
 =?us-ascii?Q?NsUkwTN/n05Gel95+a9Qo230/ruMLe8Q9cb2TI+h/pUmO+761CM/qoLOwtkH?=
 =?us-ascii?Q?rtdVBFQsNwJObciAnhgMkcO1ONbtfTFkTBdNK5pg5n19Wp0qfQwZdCoEA64F?=
 =?us-ascii?Q?ydGz4UCbm3rYDgLmM8FNu1paetPmP8dBLr4RR5gXgWSiR69KDej5tc/ftkz3?=
 =?us-ascii?Q?nxvHQuFKvJ8DaGJKRalhLY2bfwuWC3T7uRLeivVKdaNX1XQ3IwJOcgsOkA2b?=
 =?us-ascii?Q?pngQSNYflSnTFDIEVk1O/27hU8yt1QJJWYTaLnRzVeQdLyIFqxTheHuRj7TA?=
 =?us-ascii?Q?VxQ1GGx6F3FD/uwEmTTbDDKgIDcoQ6GUNl5dbwx6jlBOdmzqbnPEPZJocYf/?=
 =?us-ascii?Q?GwZ7GuPa0NwnoGVVprdeHq1mePcjWDUdYKGkUcSvq81BD02kHOs2+pi/qFfk?=
 =?us-ascii?Q?CkWNHVizQlPueex5UQzQgPG4Hri/7wGA6PLZ9Rtr3F54QgkEUX286MZ0V+cQ?=
 =?us-ascii?Q?DqMwdpHEiutDHJhLEfIvEJ3ThLux0nY9XfV6mn064lvhs7VktZ95w9W8xXzQ?=
 =?us-ascii?Q?16ReKDhl80nTLHvJwShuH1QzTQiKRksyVTzXYglNxtrd4C+hFjsLOwiPp3sB?=
 =?us-ascii?Q?5DvT9ZTPfe0fEeo/RoR0xbGvs1/6F85TPpWhqO1xi8uqS1w73b2xWVn4USb6?=
 =?us-ascii?Q?HzEXXOrnklLaMgO20q2nnsTa9D87q85zRgee9vo1Q0E5zpRXju6c+ARwIsyo?=
 =?us-ascii?Q?pWdYSYd3jsyoqyNMcoz8S6MvV17p3LI7Jq7P4i4YjGsjp1R9eqCB+lYwT9tQ?=
 =?us-ascii?Q?7xFFG70Vcp1QYhSBzPQP4iPgpW4zMw8cwgbkzyYnNf0kl4XVdvW8wC5evAGR?=
 =?us-ascii?Q?cvUMEqRTt+/OI0fPaNM0msFx1rebQmGKSMaJPObjraiDospJAoa/UYzHatua?=
 =?us-ascii?Q?SwsrrGll95qyskzW4b8bXvMKqgILj4WnHYrhYQo9GUnysm1fmBgts99kuJrI?=
 =?us-ascii?Q?NSpq2oPHaTa1zfyKLKfv+GDcWIwpho+8N8prb/fLfM2mz529+3lnMSfTiZDS?=
 =?us-ascii?Q?49qjPQeLhxOYeFbxBPzF8+2mpKiFagpLZz4kKWe5iTFdFMZ4OsYIdLG8sYJx?=
 =?us-ascii?Q?JIdFNg19EgxSDD1xLh+gEyRonBdRPRlBaeU9l800Kf9I4ai2eMzjTciUwlYh?=
 =?us-ascii?Q?cQP7A8l2l2yjpX1/4qix2fSU9LYfGeDiSPmq3fLOWzq3eYNxnYnArDwMpiI0?=
 =?us-ascii?Q?QzMKELraTWgU/KcqkXLKu/5Jx83m466oeh8+WJQsMyFg5YRx04TcFocpHkKV?=
 =?us-ascii?Q?YzNH4BergEyr7fkytimjKcxTo7EFBr0NLhlgEBYsiX7tEzN7Y0o3Ol6cZa1z?=
 =?us-ascii?Q?5/tHn/R7f6aG7TJfWftTrODBsxpw0+pdZYerSTt5QaqL/A1X2K4HNyXp2CD9?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fvIzBUZAkGDS4kuy4WAUEsSaXP0+lVzlKVDRzYyzU1IUTUh3geWqpvazoMa8SnsZBvxuQcCE6KMlkvzpxAYUe11gOCCMRHJHPge8E25kHM0ZNAmhtgoil6PB/Q+Nza7brByi3I8P1YXOkdBJ+oHCmSCSIQXRBc4nopUR4I42MJLMgRc9X1WIdtzx7qKR/m5SMCMAyDt7A3i1bgA605YCQK7PNCHSfW/jfHgkeo3Om2hUzmg2kNSLbWf4EBBckjTGLM3hp88WGqLm+XGAYv0T6p10mfEx3KjVt0YtwsvHBo2sbIHlK2KGaREdtkJEkmzhiAmGxkAmFqsNNXDEmFGw4znuUcH2kc+WPiJT5gpJeIcSBHurkggBxrtQMTuBxiEq25nSgmKDctB/TA9Zq3Cnsg0XPDdMVXZk1pxdAYcbRDZoCR/e+IbKTlax8lzjHF1Fm++5zHZFxOrDpy4io5lasvBJxEEUoL6PPNqPb4ui6yrnDwlAbtGoOG99P7ulPcZ3kgYmP7b2Nt4YGow9yBcruGZEozmLkqXZD5iarPcZlnfsQQE7GZNlMzh3NPdblewbVNswTpVhV/HabX/W9fzY3S2c1IV2sIX+z+BkYe+ZJBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30aed1f6-555b-4c0a-c3f9-08ddcbae2a88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 19:05:05.5979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cYDLbIsDpGQkmmDXpeGnSAXIwV/FPaygchzE87Q+I8t89fom9tlyjeJ2TSZdIvhALyuOmDt6xWKaJbn4AIXPGpHwFLMovCiwKdVzUwtfEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6802
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE2MyBTYWx0ZWRfX0vJLQt3AJiRY
 52lKvzPvOgJVjqAXmHEZM9kLq/yBmU/THZTblMVEgepuAHqMlpo+zbMrbNNfxHOeCDGA7Jg0RG4
 tOhTnGS3kTmOXCPLsh2yaqfPosCHUBGmntyL1nBzXUeL8R5wSEZ4kqGsQDXSCZoOuqPOH4iJowu
 YauWaZT+KVi8oKih8aX8CfPyvl6WWhy7k1rUuncOJWHtBW0B4CYiv94kvmHRN9VIfLigqnaBNAS
 Gc4LzilfWvO6wXPCkPWe5MZKt6De45Mu0TZQVNF1jdGZYQXimUugUwlHJViAUJNyWYN1botUt52
 d808v8iCQbuHttxev/fb2Ff2Sn8e08pV8iOmCOUa/ecDz9NgRpmeJt9GveUDP9VUa+PKdjlpve8
 Zc4Dx8IZ03+CZVJBjP5LG0IGO5JkE1KyvY4LPn6zbipow6Q01gIGRY4Qs6YKNN2zoVnhN3e7
X-Proofpoint-ORIG-GUID: 4SqFG2GV3rMHA7IDnHi0HNq_MVu74Fn_
X-Proofpoint-GUID: 4SqFG2GV3rMHA7IDnHi0HNq_MVu74Fn_
X-Authority-Analysis: v=2.4 cv=JIQ7s9Kb c=1 sm=1 tr=0 ts=6883d565 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=IRJyKPlXnpx_o-Onie4A:9 a=CjuIK1q_8ugA:10

On Fri, Jul 25, 2025 at 07:37:45PM +0100, Nick Alcock wrote:
> On 24 Jul 2025, Kris Van Hees said:
> 
> > The logic to perform a BTF ID lookup for a symbol did not guard against
> > BTF data not having been loaded for the module that contains the symbol.
> 
> Oops!
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> This seems not to do what it says on the tin (though what it does
> doesn't look bad).
> 
> It's not guarding against a module not being loaded: it's doing all
> lookups in vmlinux rather than the shared repo if the module isn't
> found. I guess this is desirable (it does increase the set of available
> types), but it might be worth mentioning that we're doing this
> somewhere, given that at no point does what is actually implemented
> guard against BTF not having been loaded for the module that contains
> the symbol :) maybe "push the code that decides which BTF to use down
> next to the code that loads it" or something?

Yes, it does, in the sense that it forces the the data to be loaded if it
is not loaded yet.

> There are a few rather odd hunks in here, notably:
> 
> > -	/*
> > -	 * Ensure the shared BTF is loaded, and if no BTF is given, use the
> > -	 * shared one.
> > -	 */
> > -	 if (!dtp->dt_shared_btf) {
> > -		  dt_btf_load_module(dtp, dtp->dt_exec);
> > +	/* Ensure the shared BTF is loaded. */
> > +	if (!dtp->dt_shared_btf)
> > +		dt_btf_load_module(dtp, dtp->dt_exec);
> 
> 
> If we don't have the dt_shared_btf... load the dt_exec? I mean yes this
> will probably load dt_shared_btf as a side-effect, but why not check
> dtp->dt_exec? (Hell, why not check both?)

dt_exec is the dt_module_t representing vmlinux, and thus its dm_btf *is*
shared_btf.  And if you look at the load code, this *will* initialize the
shared_btf (not *will probably*).

> > +	/* If the module does not have BTF data yet, try to load it. */
> > +	if (!btf) {
> > +		btf = dt_btf_load_module(dtp, dmp);
> 
> That looks good though.
> 
> > +		/* If no BTF momdule data was found, use the shared BTF. */
> > +		if (!btf)
> > +			btf = dtp->dt_shared_btf;
> 
> s/momdule/module/

Thanks.

> >  	if (base > 0)
> > -		return dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
> > -					       name, kind);
> > +		return dt_btf_lookup_name_kind(dtp, dtp->dt_exec, name, kind);
> 
> This definitely looks wrong. The intent here is seemingly to climb to
> the parent (the shared BTF) if a lookup in the child fails, since you
> don't have anything like libctf here to do that for you. Replacing it
> with a lookup of dt_exec isn't going to do the same thing at all!

dt_exec == vmlinux, so this will trigger a lookup in shared_btf (which is the
BTF of vmlinux aka dt_exec).
