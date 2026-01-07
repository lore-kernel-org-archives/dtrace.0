Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC742F5A13
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 23:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829503; cv=fail; b=qrM2dm+1qNX0Si7hj/VlNuVrsVNyfJUcBsXsF3OBnTo1F3V6e/shtnGy7ecY3vTaUb68h5oQ++5S7bdKX19cPA9cWQQUDQDwg0jrkwJ1k2QZqrzxBh8Ssks2XFhiFayVYJOqJhD/HSKmkuS2rbeGrm8JRMNggNKUWx4ou0Ok3Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829503; c=relaxed/simple;
	bh=V70/lZXppAviDI1B1BRsDoQIggTxLfN/WobS2AZ0/Mw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CwNBuE1lGk1gQjz7QGzH6VAUf3woaCi/3ggxdmagUOGW477b5tBEnT78PyBXaNZpzDD8lhVvz/iBTN18P82pCVOh+iyt0PjW8/Q+hHhuYoPoZItdJhv6W8RYtdAOEIuyuyjjkyKFkyax48FAIGsGNSOlsNbwT9uMKb1JpRP76Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jDmwhAdN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FZO2CQMS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jDmwhAdN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FZO2CQMS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607N5XpL3497081
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 23:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7FZKJY9HM7XI/QIJXE9GSKC82bTkc6Zid39QgYhrngo=; b=
	jDmwhAdNmYPwJWQiB0jzGcAxoHYwtYBo6ch3M8b7Qiu+i5J7iiaFd4L89hT/rmY+
	oPEAmNiVt5gZy+GcjnBCjykRkjzKtF+csZncohdbDi2NVkvrAfLgUx4oN50eBBZc
	kz3YPEWQE6pUPuEChUZF4mGC8aIyWEnSOD3EUK3ZvpoUMKIpYx1GQ8/4b9EnA0Jx
	fNRttjjNQgmLX1XrXePLnHz/xx8a2MH3EkgcTuOKQLxN6RS9LJaeggXwc18z5wYE
	FYgDT42HG0zK8xT2pyr82XxSrUE9vaNbmnPPTzIuinlWXQ4B9mkT8DLGIT1oa+9d
	GlyqLExn+cRHysllFLluXg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bj0ug80vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 23:44:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607LjkZo027436
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 23:44:57 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besja6hv5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 23:44:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV8AIRsAEbRE32zUYoabKj5v+8gTixqG1oHR/Z8Zk4BYOgR3JXcgX+ux+2ipuZkc74vVuPohM3Af5aRRzHTTnISud6I/pBt3eeaVvpCuZ6AaJIj5huzdc+6lIFtDo7swLaWOWSvqQqgaTda80XvYd3z1J3Va1eoOKoWoI8fkKbQh+0XcoR4oYF5a26uVRFSwYrXrgd3VXKUjuBHMAvszO9k6/1CsHfwFVmfcmYTDrZY7cHDdl+GLNb+W6DINY68tHWHDfNr3NPqfLqnem5MZQ6q3rkA/Y6C/65Yrv5BF+0qi5+17sgr97Gs4qq5R1bFKD5fxugJ2ZfE93LdUL3BVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FZKJY9HM7XI/QIJXE9GSKC82bTkc6Zid39QgYhrngo=;
 b=mku//tsXGjjtShcQfLOx6QqxGOYF1wlh1AYpHq0ajdgF8al4uEUVtG4/HjKaLAaSplTWBuIHD4kF+H9X7dMsjEerim2b9Efk3SK+Xg5dyyBgaCcjTSm35Xh2cSHjcfgfEmS2CmtVgGJU6oyOk6w2N7+mqf4MeV+9uSRfOt6mROMOReR4CFrgj3b+Yc5oRnyXoefg0q+h76EbYXogoEjbY5JIUe04CIZTSaW99oWQRU0NLBe2qdWxItjNq5gHruFI9VpLuRNKaH6KRDofY7lkterGV0Em2QK0HW2+1OcHzKlYlKMY6/Bam1pU3vk6Q3/Mko0oBxCGCtJnN/PJHcRKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FZKJY9HM7XI/QIJXE9GSKC82bTkc6Zid39QgYhrngo=;
 b=FZO2CQMSQ/vSMv4HHkBN7jdjNnsAwWtI7qtS6UbIe4AOw6n+d/73vztOxx6xaY1RNBswVoaCn20PBM90W+lIEXVkHPVSnbrp05LBnPNaC4pPJQcFgGVL5OsDb4fB+01FGtrkPMpXTVi/45RNfuUJsAuZTxgN+IgjWT8M1NYCk20=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB5727.namprd10.prod.outlook.com (2603:10b6:303:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 23:44:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 23:44:54 +0000
Message-ID: <5569d57d-da23-2b61-ec0a-2c8091f57c7f@oracle.com>
Date: Wed, 7 Jan 2026 18:44:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB752234D6A8CA009C7E01E158C284A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <ec40b0e6-c7d2-acaa-c8a1-f2385aac1452@oracle.com>
 <aV7ke3WwP7G37pnu@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aV7ke3WwP7G37pnu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132F1.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bccaed8-d8f2-4269-b930-08de4e46c1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFVmRElRUnRncGtPZWhQRk5xeEFHTVQxQjVNc1VQL2ZNb2V6OERNeE1CM0hH?=
 =?utf-8?B?UnQ1OFZ0VjFNdXVHbVBTM2VZK0lsSXVieFlTVzFHbEFoNVBGY3NGVmdsSmRL?=
 =?utf-8?B?NDZBVEN6N3E4d2dONDFGR0tab1FXdkNzTnY1VzgycTdZRUZpdFkyMmlLd0pO?=
 =?utf-8?B?Y1kySTFwSVY4QkpObW8vVUMyMWdXeVNJWk01SmdsK1FBQlMzaXZVa2ZmK3BN?=
 =?utf-8?B?cU54TkMxVytHM010ZzRaTjlWZ1hZRDVmSEd3ME5EUkN1dG01Y0dSWW1PbFNK?=
 =?utf-8?B?cy9UYk9sQmcvVHZESk9lbEoxVXAvTFFXcnBpdHU1Y1JiczgxTzJlOWpiODI1?=
 =?utf-8?B?M01QdDdzL1BYV2pBNW1oNlJEZlh5WExuUXNmZzNGeDZUNEZST0Q4VllBSDZx?=
 =?utf-8?B?ejZlRjFNMmNBQStQZGlYcnA4alFoNFlLOHp2MHR5dFFvQ1ExVnc2VnY5QlUw?=
 =?utf-8?B?bGpEaEhLanRoWG1jWHVsRUNsRTZQalpPd3dDVUU1WXVEaks1djlpN05oUHNW?=
 =?utf-8?B?aFVyZHM4U0xJeGVra0FXVDdwWnpLb2dBMWxSeHRWNWlNSzl3aTM2ZmNVYWtr?=
 =?utf-8?B?YlVZcGZTRGNDMGlxcy82ejAwRjNmWGIzSWFlWmNnSllmdHp4Ukp2ZFY3L1Fp?=
 =?utf-8?B?UEFKVThxM1lUaWhDeFdqNmt4NlBsQWUyRzBZQXNzTVlaZ0cyZ1F6U29lOGdD?=
 =?utf-8?B?Z0Y4b1JmQ3JqUDJwOWNlbVA2U0FKTUM0YnI3NTFQQXRibWdneGJ4TDRpemZE?=
 =?utf-8?B?ZVA0ejBmWmhXYkFabzQ5WXR0amlFbU04Tml4NXBRQytKL0VSNmVVRG81YUN4?=
 =?utf-8?B?cDJkMGNldGpaTUJxZWxKU1FGNFJyOWxKY0daRDlrenppWXNtUFZ3dVNpakpl?=
 =?utf-8?B?cTlJZVQ1T1ZzMXE1NDhsY1FkY2NhMkNUN0NnV29xc2ljbEtTMnQ3YWo0K2Jt?=
 =?utf-8?B?OXB1Q0pkeWRCOW9lN3hJUXJLSkFwcWU0SysyQVkzbk4venk3VUxJRGNpRlV1?=
 =?utf-8?B?SDh5dVQxQWFzUFgyYmlibHY3Rmhpc0NzcGhmNmpTQ1R1ZEhjdzViVzZyZmlW?=
 =?utf-8?B?U09XN3E4OFZuSTRmV3VtTjljczhPTk82bEp2SHRFWXhkQ3JSS0tHSGQ4NUI0?=
 =?utf-8?B?T0wvMVdNa2xPTTJvdHp1ejN5bm1MSUVPbmk1Y3ZIaVhkeVo5MCtia0hjWTl6?=
 =?utf-8?B?NnJJaGlwc21nTEY1bnYwcW5UVHNCK3pHUUR3TUJnMXN2U2xFT25ac1I2eThG?=
 =?utf-8?B?ekFjVGlpNksxZzFJSXNPNDFFNm1VVm9Gei9waWhjcU9pNzRCbHJmVHFSRmtQ?=
 =?utf-8?B?TERvSzk3MUpBYzN6ZnNPUVcwMkgxV1hlQXE2QW5ZZm5EWS9ycGpoMmhWZlNZ?=
 =?utf-8?B?blJmWnR0ajJlajQyM2NRSkI3L0tlemZRRjk4VXlMVFBCRHc5bzRwcHdReFhJ?=
 =?utf-8?B?djh2QU5YVkpKN2Y4NWlSRWxLMFFNR0d5MWhwRTFoVUd0cS9CZ1RPTUg4VE5R?=
 =?utf-8?B?SWxMdGFmMzVQWmVuVkZ0YnQ5NmJjSGQxRHQxYVlUbE1TN1RiWmhXYjF1Rmpi?=
 =?utf-8?B?TWRndk5QTjNHSUxCZ3lGY25aQmtwQjJNaDRhQUNDWklKcnhwNW5MMXBvNWI3?=
 =?utf-8?B?RElQQ0tmcGh3UHhRWE5zNWUyNHA2OXkrNkVzWTNxUlU4dUJ0L01yVmpib2hq?=
 =?utf-8?B?ZzhHUVVLOTVTZXdMazhGSStvTWIzRjYya2F6UnA1T3J1UEswZmlCcnoxY2pz?=
 =?utf-8?B?VnVGVE80M3BUVnJ4Q29BQ3VlT05HeEpoZmQyU2RNL1c4OVZ0Vk9tNlZLOURF?=
 =?utf-8?B?RS9LNGNQSFRYaVQzR0NHSU52NG5LR2lDK0txME9mS2JPVWlXWWR6RUJIWkJQ?=
 =?utf-8?B?cFJmZXpNZUMxYjQ3aDRaTUFVM2NQaWZ1WHptbXhyWkJNZjh0K1NhaWxoRE1h?=
 =?utf-8?Q?Kshfex8LCFWkhO04lPJ2UaP48aGFBuTE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRxK1drWkp3QlptbHU0ZjI3SVY1RitnYlVHN1RBL1R5NUNHbEszc0sxS1py?=
 =?utf-8?B?U1ZLdmhhcC9yRDE2emg2aUpycThZbVY1QkFDSjI2SGVaaHp4bHhxOWp4ai8w?=
 =?utf-8?B?Z0N4Rm5oRmY2cXdYYWc0RTBrNUhZOCs4T2pmM1p6Ryt0Sjd4V1lCMTRuR2tK?=
 =?utf-8?B?UFBmZFBhWkd6SVZybWdWYlJqYlQwc3lVVmV2cmRrTVBxZFoyUlBGU3g5Qmdi?=
 =?utf-8?B?Sy9GSys3SWNRaWg4SFRPK0xUdlhNbjNGUVFVaFlsMHBoeXBHaWFLUTg3TzN0?=
 =?utf-8?B?MVBtL21HREJOWmo0bURpVEI5NWJieUViSWVMKzh0MWQzYmpsaUttL2VSdWFn?=
 =?utf-8?B?UmtSNGN6UGozdXovTjFjZUd3bXJMN2E2eEl5Zjhhc3ltdlNvUUE0YlpWdkc5?=
 =?utf-8?B?c3BoNXF0NkltSGZwbGEreHljYUIycDdWMkwvR00xNm0vd3drcFloWVVLWnpZ?=
 =?utf-8?B?TzZqODlhY012Q2NyY0oyV0cwaU5LVXJmVG1PQy94VUh3K0tua0MwZFI2RFpL?=
 =?utf-8?B?OGE2SUtsWElMYkhsQkNjaWprUVV1eHBybVVaZ2JkMWVvWWdHODJ2SXZ1TlFq?=
 =?utf-8?B?Nm1vcEFwZlk3U3BSUWVkUXdGK09hRDdvRm1vcXAyOWJWcUFMYzAxcHhSUlFv?=
 =?utf-8?B?cW5tb2pPM3JrbGJla3AzTWJ1VDRGeEZWVEtiemFqc1BKcWV4OTFyNTRXN2hu?=
 =?utf-8?B?dUJFUUUrelQ0eFhqcmxPakM5SURGTmgrYitlLzlOdFhTU3BwSUJPb2kyLzVa?=
 =?utf-8?B?UjllYXcyY3VNemU3TjFraGRkUHk5TzRLckkybUpZSzVIeXlxbEhhb0hxYnR3?=
 =?utf-8?B?UFdsVkdHekxGNFpxOEhGaklUT2EzOHpWZlNYWDJFeVdieXF2SFNkL2pCd3Y3?=
 =?utf-8?B?bi95K2pLTEFOL3Q1cS90cS83SytqSWRNcUhWeFkyTktleGpNbTNpS2Q3WFpq?=
 =?utf-8?B?ZVNlVi9UbGprcml2azI5cDNiUmxzU0JkdVpLeXNIWlZxNnhzclhDbE9QTThT?=
 =?utf-8?B?SSsvRGlRTzdQeEpPTFcyK2M3TlRYditkRXFrTVhlWGRTMHVUS2FNRGNwbVlQ?=
 =?utf-8?B?UFNaTm9QZ2phdlErNlQ4WXFIanZOeUgxRXA5UG9HcWVlcGN0ZzFHNGpRdy8x?=
 =?utf-8?B?eHFlNFhrQXh0eFcxYWtnYjduNGFpUm5hcEw3NTF6L3NXc2ZTUkwyb3EweWdM?=
 =?utf-8?B?TjlpczYvSm55NHNzWWJFL2JLL0RrN1dGay9pc1RZc3pCaDJNZ011aTQrMGV6?=
 =?utf-8?B?ellxSUNicmgwOTNwZ1BuZVJabWFkYy9NczNWQnVabFZocU9zZE04MVlpbGlU?=
 =?utf-8?B?ZzlxL2hDNGRvMTNnaDNTalYyUk5uUXN6RWhSN3ZjSE1oeGxuYVZQUU1iUkZp?=
 =?utf-8?B?Qml6UzdDSkpINTNYdzMxbTJROWNFTDFVN2NhNVB5UWUveWVjTy9nYmhES0dJ?=
 =?utf-8?B?RXRxYU1jcGluVjd6QjQxdzhkY1dXZmZndE04VStZaGpXTXRqYWZZUjRsWGxi?=
 =?utf-8?B?YWNYbXFWY2xwKzRLM0U0djVTdWNKMmJaMlJ0Y3Y3ZERxbVY2QW9DTUZEYnFj?=
 =?utf-8?B?eE5oZUVGUW5jMXR4YnZFQzF2NkFqd09GaHpDYVdpRllSMVJ5U0ErbjIxVlBi?=
 =?utf-8?B?TEg0bkhPMUwrN0JWcHNPYmoyYW5lNFJjSitGcE1aZ3UvSnBsRk8rRDNaTzZq?=
 =?utf-8?B?UW5DNmdobEU3YlpxMytRNkY4b0c2L1Y1VnZhaktZRWdteFdtSTdZQWFGdlQw?=
 =?utf-8?B?S09mNW9WdjRpU3pnTGN0WUNSMm1SNDNhTGdBUkRuMTJ0aHFnbEV0bjFmcnZG?=
 =?utf-8?B?KzdFdldLUTZrMUtnSnJxaHRFQSt5U2l3aDRWY0pwWmxSWFR3SUpIeVBPNlR4?=
 =?utf-8?B?a2hSZTRSbkUxOW9OWGdRTUFFL2I3cDRpa0FnRW11cDZLM3JkdVNTSWc0dUxT?=
 =?utf-8?B?OTRpaTVKMEMxcm1oUjZDUTEvZnRTdTlZaHBnNGtyc09DOHZQbGQ3Y25Ka0xR?=
 =?utf-8?B?dU9qckRvZXpndCtJeFVFRCt2VndubDdKbFVTV2JTZDdsZ29KNlloN2RWMmZS?=
 =?utf-8?B?czJGSFhtWDZYdTNySUM5L0VnMW4yeFJiMnRsTzJyckRQakhvelY1WjVYWkp6?=
 =?utf-8?B?VVk1a2JibWhFemZmSUJFaVdNcFl4TGUwU1RhdEoxUXh3UFVjT1NIaHdNd0ZE?=
 =?utf-8?B?TDhGd3BrYk02QldZSmswZ2VuWHNvOS9ZLyt5VTRyYWlVTVAzTkJQVGtuQTFp?=
 =?utf-8?B?WGxkeXlHWHk0enJYQmovd2ZWd09OQ2F2NlZEYTFnZldWZGtmZ1hqODduWkZS?=
 =?utf-8?B?eHI2SVIrR3VQbG9jeE52UFRDMGZHOWEwUEZoTmtVb3ArRlNVclFmdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PRv9BHTLFUwIvtklzhcwVWApGopr9eQq2ZQlXX/dUrJXeeWMegQEEEaN+JXEHJW3eLwz8s/6KPuKhZKraDUvyWeJqD9gkml98F53JQPoFbTSa3V/lbPQV080UvqpEn+K20typ6L2TmRQdU0keZ4C/6ZQM7repTbXGXVhKzA0xeOZqeSYjOJUprhIN1xaEGB1nLRevWtGfkijvERDprr5GnYTeVpzWLJqbIRv0Ior93tAJX5nbEYkSyeq9r+EaI1QiSMh3pxjdm2ZoP114A2zu81cyTKshv4ywuhJUcgIbNU1oARs7UufjfkEa08vIN8w890nl1kN6XzXmb/jihxpJK92sXvFpX3FyekkEtgJW0mxwdo2+CNC3TYh8G2N3nsjVqTKryovekg3wYgZP22AjCQIsZHodkxF6lXPAOb7NVsiOXvVTFXjA3IP55FH8NhUAf9qhNbb9XAUVkQyuXsEBWsNNt4hX4Qp9cIX2erXFK57yOy6u8RgjmewZ05Ls9zEUO1E1PKtE0v6GJqY0hQGSLYocyle5wRNlJYwG7vWO39fgtGoWTUfsVIoObD4KJVz8agtywoFoAA1JF3StplISqAHxP2SjVbUEa5IUyenhKo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bccaed8-d8f2-4269-b930-08de4e46c1dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 23:44:54.2518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwhTiuPgauRZXU9qwBb81TzZigvVk1pGj5muAzI6RtG8gazYGFAhGY+3RYyyUXet+QSL2O9We2UyQ3E/M+GZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5727
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_04,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070189
X-Authority-Analysis: v=2.4 cv=Joj8bc4C c=1 sm=1 tr=0 ts=695eeffa cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RvJtXPB5KsxdAfVDnjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: M6WlY-c0ex1doFyowAqo7YdAg8cpq28v
X-Proofpoint-GUID: M6WlY-c0ex1doFyowAqo7YdAg8cpq28v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE4OSBTYWx0ZWRfX//WfHG96v60j
 n9YpSkXL8hb5oMS6okZLg0/65vDYan4BUb3f/XjoLL7vrw8Uz5tLveMKCmmN21PRe+qx/g9sJpd
 C798SmBz4stwOLRgFBVGvaoH885tDkEFXDP+qobCcxnBtcxWTZwxDIxnNWna7ZUUI1vrvOJ/mK2
 ZNeOdVFevjl5IdeXPwQaY2D5xu8juxHgi//T+3X/oRp29h0Z8x/NS94zFelbgBwChD1DHbLh5vA
 VFxCGh3YN7JcyITO5C1hK+Zui/mAe/DwWs1tkOZ40LOPM5pZBk3i9Qw1Y2pbE2dvGhUZxjvLkqG
 F46BQDoVEsivlblwMXEggqkcfrvMRtb42OuxnOl5/mPOIi6CC1gFqNbi5rRTS5R934pJqr87jYJ
 n6KDNwv8JWGWwWR5ZWVlnzLiJMwZ5O7lUpM6Rdq7Mxyqz+mGoYfaugh647IPJjwRRJPpRN3GwSm
 nf4pPLdvsAUpSOdvalg==

On 1/7/26 17:55, Kris Van Hees wrote:

> On Wed, Jan 07, 2026 at 04:30:57PM -0500, Eugene Loh wrote:
>> How are the tests running?  Didn't assign, pid, and pgid need the -q
>> removed?
> Tests are fine.  Those tests did not need any further changes apparently.

I'm confused how that could be.  The tests were not running with -q, and 
so the .r files had ":BEGIN" in their output.  With this patch, the 
tests run with -q and the .r files have not changed.  I just checked:  
the tests fail for me.

>> On 1/7/26 11:28, Kris Van Hees via DTrace-devel wrote:
>>> diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
>>> -#!/usr/sbin/dtrace -qs
>>> +#!dtrace -qs
>>> diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
>>> -#!/usr/sbin/dtrace -qs
>>> +#!dtrace -qs
>>> diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
>>> -#!/usr/sbin/dtrace -qs
>>> +#!dtrace -qs
