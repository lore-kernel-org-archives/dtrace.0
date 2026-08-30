Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F853A5E89
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788087014; cv=fail; b=K8ck+CrOX9hbDy1Ab8tj3MuxE1pekNdEituP9CE7P3w5Hnj3BFFhaqq/QGXbPsX+5hKzw4gzZ2v9Ts2xfqsnJQ9npE0U9qneteCYgFM4+p5F/RoCUm3MiOUb2i5b1x5RaXsv8cf6slkokqChjEewlCgDXUBwesXjTeupFM88UTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788087014; c=relaxed/simple;
	bh=oOTWbQENSh7eDS7iW3AbWMmNIQvz7UJX8CvQIy/HApo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NkwcKvODwOKG+dMrzrK0sWD3U0qKaDjBUO+EY5j1uzMSA5S1JWz2cAkBJOcTKTj495U6RRTXwFYVMnlYNZHxxOiVbUVTf/ZAKghf9VUPF2ZbX7hGwXZgpS7uqFdJhkHUrOXLx/OkRDwjI7IWbg7VNjIAY19BfvgrxyEcfgKSWxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IWvUG8NH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PVWObTHp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IWvUG8NH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PVWObTHp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9gC3C2953824
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xGUp9Imlk2wSq1XS14D1IsJ/SpfsbMe9nzxDYN0ooLo=; b=
	IWvUG8NHQujadq5CzzvOCTHXuedXw6gv4+IVJSoV1sAokA1DrNFTrydJC4ITG6dO
	FnRjW2A/IAal8gfS7fEyI4ensk2biAxMIGAXodvur5RuKo0PRhppSgcrmO4ZAiWL
	0yEHk9pwEGDu2NGcn0o0PfpDpgWs4U6b+HW4vZr//KZG8URWFmexH7jODv7Yv7pq
	+PNmsPbM2acd1hAAQv8SS9EQNMAz+uNx+99u2j9M5bEi79BCKx0Lb8tO2zJmdrA0
	B8tOVpmvTCzYRZfH+M+QX5uLsl2Br+55iUt/FBlSN3BgJQx5mQH71/+MNKcZHvO7
	3QE6ZOR6pWe9CCbdJW2y1g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbq1sh7ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:50:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67UAj1WM022286
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:50:08 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvc3u06-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sun, 30 Aug 2026 10:50:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eavx3IdJ1m+dz2Ml0AuVyuZZY01D+VUk27pu7OiqROsI2sAqH1+AZpf1wMUPjY0/o4qLVqEwym/Ntzg4NE35afmMTb2+lnUhq0klVgtYMFS7IZhxP3q1cUqfhGYCA3Dga0zKtAzYmZoi/YIHCMKb5pVO8cwIF01JcuEbzFi3V3rV3t0dnWkQUi+ch9jHdOLAvrcfvhI6ei0bg8h56l73L/gbMF9iIJUiJ6hg8MqWEhrs7DyrWpfuBG41bcOdVLHN5jBBe20gxzN/B0y2/loYMUp4QEmMPH8k4sWOW4mq1jGgKyeSqFmz2DUL6LU3ihDlSAuOExo3PR12Y19mGgwVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGUp9Imlk2wSq1XS14D1IsJ/SpfsbMe9nzxDYN0ooLo=;
 b=K5pRG4yVFJ0Q1Vcx+qlJ6zXI05MtYBdzJ2OkUbYOQa8LOwxmMEO9V5Tuj7I52wh1LFYGZ5wSlLZXHJwmKc/5PUdtLMvZuuKaJLWYYFqAmzkTzdBa7apVxXDiu5GCh5GC6xQicfKr4lVhipx39v0pBRlfL6yUbPAo3AcviVt+FpRG/IaeSDnJDhvGARAMcb5vd9x+e+4FpdkSWElCh7AYQMnnVzSOAvt5z4Kj+WF5epGvk9qUvqthJiNj7eglf1tm0YzhkJ4b0uxeIJNgpG5gPovVbrQR46Ny/bX4efw/yiWh50zceYwHelZzdcF+gwPI+Mga5Vsx5AWEbALqgQHpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGUp9Imlk2wSq1XS14D1IsJ/SpfsbMe9nzxDYN0ooLo=;
 b=PVWObTHpl0tW33vAprf0HJQH2zPYtlJ2aA7pnelaBW81p5vxJVqb77LeV/PwRLBRJp61D7ab+IBJCe9JN3WntgVWuY554FsQYOxAcv7pKQFkj/1pwxjeIjZhS17nnejrqgHU/zWT9Ukm0jNru3uncDxdRMRFdSkD3ovwqmWOEY0=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by CH3PR10MB7562.namprd10.prod.outlook.com (2603:10b6:610:167::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sun, 30 Aug
 2026 10:50:04 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0382.007; Sun, 30 Aug 2026
 10:50:04 +0000
Message-ID: <553f2985-7b31-405f-adfb-091f0759b823@oracle.com>
Date: Sun, 30 Aug 2026 11:49:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usdt_parser: fix parser pipe I/O error handling
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <546e942ec601bcbf992ee08c77cff42e@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <546e942ec601bcbf992ee08c77cff42e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To DS7PR10MB4909.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::11)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|CH3PR10MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddabc91-96d5-4af6-209c-08df06847290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	RyIgobW4d7g19rwGrS51nT1eCF32ijl1JvbtBjgLgjE0B+Nu5/Fa/NZQL0jhQe+IM3pPitQpF63FMYjJShmKZsp6aeJKvH1wJJyHCcMZ6zSnexFWdLwc5/fy9VJhtzrbCcma25QNyZMjVJ3WqKiQVlKPXjW+OhbmJMTBKaP7U8laxNAkV6Pl0oCgtJ7aiW8lCZFd4JH0BW5aCKAyglHv6gs9xKku0W7IlZXZ/lFwVpsl0KKtT8/XFGiZmaBzDsq5g1JED2MAcPhoULnZ10kDNWu1GOA1VfoKd6BVfRQq5fT+CHfCMQ9qbn66Q44gpCyDe6e7Id/XwEMQHrYSoJ+tAjsiNQOfqfvGLtlwwqds3LX5UL06hY+zr8oHBF1BruZfpcThUlR7HnZHyzAVzlo8qpZSegGCpiqvv6zP5ubQl9kuybf4SsCGlDQt3UYjpXA0lbIltbAGrA/5w9WHVJ5UUNChBARgbrecrzklC2N21XlrhG/cEUlTNCBqt1mbjuj1lXT9Rr/PH9rUnbu7rcPvRaxwV336bJBXSX1c1paNitKxuiK5vZxWBqd5v1DLkYKx89SR84q0N58DeDx55iM8POkmspquPi9MWt88GL5EY7ojOEfWRz468AKhi29kvB2rCXmGA9CbTmGGsqogdOjbyGUmn6g6x37gkgNR4d6lHio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2hMd244OE9LbmN4R21CMWpwdmZNQ3luR1VSOGJxRmNDdzd4bzhmak8rNUxa?=
 =?utf-8?B?bTZlSXNGQWVaYXRTN0FsUnZGVUFtVXFsUFZodHI0MHJpZWtIYzNSelpxVEZv?=
 =?utf-8?B?UHF0L0dxc2lPMWVFL1Fndzh0UExMTlpuNjBISENqZENXcmhyaGhhc1RPV3ps?=
 =?utf-8?B?aHdMR2g4VXlTekhRUFVYU2VHN0I5Uzk0MUdFQ200aFgrWGQrak1RdmpDSkhP?=
 =?utf-8?B?ZVg3T04vQk1nRmVIdndGRXJzVjlaTWlHQVVLTkRhK1Byd25wS0FZWWRPdHFx?=
 =?utf-8?B?K2gyTHhhTXAxK1NCUVJHaGtsUUhFcjRLY2oxamVJVldDUnFBYWp2cTJlZStv?=
 =?utf-8?B?czQ0Z1VsRnRtNm1JNDF3L3JoNHNyRXNTcG9QQXlpenBvcUxINFVObkRQbk5l?=
 =?utf-8?B?TllxQTlHTXRRcUhhZGo4ajh1OTBsUVF4Q25ZS0hkeGtzWDRWYTNBdkhCTFBy?=
 =?utf-8?B?Q2I1ZEJpa0VGT3NBeWNwbWR1dlVtcjFYYVpYK29CektYUWxLS3o0NmlTZUYv?=
 =?utf-8?B?bFZjYlhMN0Rmc3BWK3FmMyt6akFBQ20vS2hnUDl3MFZzT2NJN0J1UmdmL2s0?=
 =?utf-8?B?M1BoV0pTaTRRcDhWUis0R1dWRzhYQWo4dCt0a0tGd0NTVXJyU1ZJOHVIaDZN?=
 =?utf-8?B?MmZMeFJjTnliUTVWYko1bVA5S1VHNkc5cEJXSllDTm80R0RXSk1SWG5WMklT?=
 =?utf-8?B?K1N5VlJEYmlOQUJHRklPTmgvN3p5Wmk4OFB0K283UnVuZmV6V2xmTnNyZjNq?=
 =?utf-8?B?YWFnbDVQSGJyekJoZU04OHJuZDU1UW1LQ1RsSmExUDYrcmpOejZjdm5FdWw0?=
 =?utf-8?B?MnRGcVBRZ3orQnlFU2lmQ2lBL01wbGxVYWFYVlE0SGFWS1dDWUJ6MGJzNkV3?=
 =?utf-8?B?Y1VFSHlMQ3pBM3Q3MmVacXE4bGkwazdSWUxoeGpMeHZ1YVhoVUdMRGFBSDNG?=
 =?utf-8?B?ZWRsOUFXQkNKcHJZZGYxbmVtZEtOL3hkV1gyZnF3ODYyNUVKU3hPVm1ZUGox?=
 =?utf-8?B?b0NQUHlOeVcxRlFyaUhoQjhPSHIrOUd5MVZYcjIwVzdhZUdibWR3dXZZa2tl?=
 =?utf-8?B?TkhhTEFId2dVWTdzOERRaEpPdWM3WS9BY1VhZDV5OFE5V083V2RNVXhpRjJC?=
 =?utf-8?B?c3p4STJpcFVDbGJTNXB6a2ZxMjZXTGZkbTFxalVZR1Z6Y3VpVXBERFNSbVhn?=
 =?utf-8?B?ZlQ0dm1pclpvYStBZ2RsaXN1V2lidGxpdkVWdHhaWVVZQ3MwOEdlKzVab28r?=
 =?utf-8?B?b1dCaVAyd2M0RTJxQUdSdkdvUTc2c0tBSmV4M1NGcVFlYVpzb3M2ekZQSEVv?=
 =?utf-8?B?cTZDcEJEakdiWmR5MnFEWlM3Sy9KWnN4UTRmWTdEay9OcTh1NFFyL2xHelQ3?=
 =?utf-8?B?ekdLdXFXNW8rbXFDWUtnQTJCaTJoQzVCU04vWHJVV3M2YitDTW9XSjlYdXhj?=
 =?utf-8?B?SVN1MG94eTUxVXF2b0xITDA4ckQ0d3FaTVRRMXZ0Wng5Q1FzUS83c1BBTVJJ?=
 =?utf-8?B?R1p3RTJ1OS9oV0RZdnNtZU1GbDRKeHJMczZ3VjhITTF2aDFlMlRKYTRHRU1K?=
 =?utf-8?B?YWRBS2NpTTdOSmpxOE1XMkxlQzdTL0lVU3prcmJzS2VQMENkOHNDZ2liZXBR?=
 =?utf-8?B?bHNjKzVwRVJ6WkREeTh6cG5EZ0hHM01jMHRYdEQ2Q0lCa2lxQUU5Q3k1QnVl?=
 =?utf-8?B?aElCc0tHdEk1R1dNaGFrRkdiMnhjeVRGUmVMeWloM0FyckJVeUhKbjFtWEd0?=
 =?utf-8?B?RTdhZ2tSTjFlczBtRmFLZVBvSWo2TGhQemtKTDZYKzN1MUs0MGNaYUpicThu?=
 =?utf-8?B?bU10SHJ1d2xLdFJtQ0s4N0ZITFVEaG53RW9hckFGZjBBTlI1eDRhY2hLVGRY?=
 =?utf-8?B?OHM4cU1QeHBkTEZoRGc1Mm43K1E5cW5KeldTUjlrTDMrdXZ6VlpONlpmUWlP?=
 =?utf-8?B?R3RIejk5NURNT2RrVEtONGhoOWNMdEVpZ0xJNG1HNW1nMnZ6dlVTZnhmb2po?=
 =?utf-8?B?K1RSb0xrWDVFR0RhSDNwSy9CaTA1TFQwT1dYcnNEeVhLWmsrMlhJSjRSd2s1?=
 =?utf-8?B?MFZzM1VCUmdCV2NwTjFCb1R1TWw5eU9vZFF4THd1ZVJJQmZOZjVUUnpEc1pC?=
 =?utf-8?B?K2JraEw3UWZKQzFUN3BMa2crU0w4ME9UaFBTbCsvOExDd3dPVUpGejdMSjRH?=
 =?utf-8?B?ckEwZmdlS3VETzFMZjREaHpTWVdXNDlnNWNTeVdlVmtXYzJHV05ySEVyTVlF?=
 =?utf-8?B?cjBNNGZ5TGNjQkQwcXdhRkJTTmc3Sm9QTHJQTnh1YlhmZy9XaEg4VE80VkV5?=
 =?utf-8?B?U1FqYlpJYmVNaGlRTE14Sm83K1RmQ0xDaHR3RDFuT1pieldZRDh0QT09?=
X-Exchange-RoutingPolicyChecked:
	Xl16NDi3r+hywrCon9yWRRq4ZDpEQNkCnCrZKQzRjLttGQ9rjkogOKBoR4igpsyYLenG6JE/F3M/+T8TPDE3tP76dAQC9OYS/e7w1J3WxSCtdrvFto3sKZVXSs6e6MFvxj7VVqIZ9omgm5O5jNePR6DoRbf/D60KD2Rtr8m3n8FG96la7QPBASN/XSe2JbO9l2Q0SD888Sosuq+Xc+k0qD8uNl1gNCFfzqZZNcvS+73i6MUNAZnwTSD5CyHbhOK2UVbwZjmY5oJCrYb4Tl5zNdPMnC/jpRpTibkXGvIyajk5CsLBLhPUZIPpbcY8Moi5uvC5tNJhLtElpv/CkBrkbA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lmSwix8F4Ub7jl2FVTlvyr/1KaEkmZI0ugm84B2Cl3+WkyzCTmlv9Uju1gRQ+VsOqHGMWYoNXjB7ngjWN0Hy3kAabc1ooK8YPRiScJXRx3na6EVB4IXM+f6vROk5LXB3Fad9HkZgmFNj09ELv7RV5cO3C1QkYJQCVBalCUYooB186xJVsUTl0Aemk2iSjqZ3S7H6JUmpw0khsCCKdDilPJX8NWUMPomasrOCpD1bO+Q2xMZ2HWwK2Mp8jTkje5Dwip1SYlLZtrVDmB0d56vUJmhJXaqqbmLGGRpoasBo50b7emXIUifkzyBvbs9nRLxc+QTKnjwcSJUmIAVsGtxdnQ5QIlRgh96+UvVrDOJLUkqKp05v05RZA7fQERjlSqNyvol0DBk2u1miHklknbrbsxPDe4dUY4S+hxN7TREz8mve/isZQQJOa+l4SLgDDrbOsblypg8ujSSy3Wos/883/A7dKGLBs5kXSwixHUKACsZ52cHCeOEKEF613h9Yn37e6n0bTEll0cWYOxO4xcVT8IqX1qDtvvdTLgGb4JWiYyGYum0YxZ+F0XtaOe/NFds//mc1Zsazg0OrwBNqRhOEwMMqPA28g44rlbQNQfGwPxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddabc91-96d5-4af6-209c-08df06847290
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4909.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 10:50:04.3448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHq3qm+jXEfFaRM0USpcKbwsj0xqjnmnji3mp9lgjYAyKD/cqjqlHXYbUpw9DXsoQq+PTidBelyAT/fcuJ2xjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608300091
X-Authority-Analysis: v=2.4 cv=Vp0Txe2n c=1 sm=1 tr=0 ts=6a940ae1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=p98pJ6cXIa90VjdpBE4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA5MSBTYWx0ZWRfX3GnPYA797Q6G
 IcdRh/pjpJcInHr6svaMpcduNcRI3Mb1GKNHA5w50qMNMQI5utB0X5e229oI18Oh3XsPrkfHQeX
 w93C+8+XE8sGP4mf/Py+Yi8zNXUwq/d4XsDMSclKGAgyJIXv91ooVFqdNQ0xCQQlZBQAfSTV1eB
 6rmK0UhFlsMO2OtKZ1TuokCVf/pLltcwEA8ve8m6A+ufm3hvqplnybFKLpFbeE2nr/iYLcfsYD+
 kchlGbla29erDr546nW5U5rndniIfjRKVfgP8hMdgF6sv4We0y3JDD/aM4xofEI6ZjwbD7R7z24
 R7m9/vWMSopi+df3/iJvqZEzYLlEf4aKLRWOYb/75sSBhco22psQkDXp+w7htpP02lKPmidtpcZ
 ARwXLiga19Kzw4i8BXV3hFiBvU5TXxPL0fxzyzZ7Nn6dMwKLw19RLOAfjSVYH0iHuyI2/S6YyqF
 Wt9+ijVAgMk0iqwMm4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA5MSBTYWx0ZWRfXwJCz2f5GbpgZ
 xHpuqVhJaTrzrTERE4OHX55mWgSibduoTxlWxqxhn6YPljPuPzR0ErfgX0KmHouYI4vaqcG85Xb
 2ECnOLSgY3uLiiDwKdjJwKcbmhu6gAaGXnpqg1wpRRb5aF3uR7AN
X-Proofpoint-ORIG-GUID: wWKYoTh9ZOTQaL9f0EBuwZ_ptvrb24ox
X-Proofpoint-GUID: wWKYoTh9ZOTQaL9f0EBuwZ_ptvrb24ox

On 28/08/2026 20:09, Kris Van Hees wrote:
> Use ssize_t for read() and write() return values, return negative errno
> from usdt_parser_write_one() to match its callers, and cap the reply
> size advertised by the jailed parser before allocating host memory.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  dtprobed/dtprobed.c          |  8 +++-
>  libcommon/usdt_parser.c      |  2 +-
>  libcommon/usdt_parser.h      | 13 +++++-
>  libcommon/usdt_parser_host.c | 84 +++++++++++++++++++++++++++++++++---
>  4 files changed, 95 insertions(+), 12 deletions(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 81b28e6d..9ce941ee 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -935,10 +935,14 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  	dt_list_t accum = {0};
>  
>  	do {
> +		int parser_err;
> +
>  		errmsg = "DOF parser write failed";
> -		while ((errno = usdt_parser_host_write(out, dh, data)) == EAGAIN);
> -		if (errno != 0)
> +		while ((parser_err = usdt_parser_host_write(out, dh, data)) == -EAGAIN);
> +		if (parser_err != 0) {
> +			errno = parser_err < 0 ? -parser_err : parser_err;
>  			goto err;
> +		}
>  
>  		/*
>  		 * Wait for parsed reply.  If it fails, try once more; possibly
> diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
> index 1dc2fffb..18808b9a 100644
> --- a/libcommon/usdt_parser.c
> +++ b/libcommon/usdt_parser.c
> @@ -71,7 +71,7 @@ usdt_copyin(int in, char *buf_, size_t sz)
>  	memset(buf, 0, sz);
>  
>  	for (i = 0; i < sz; ) {
> -		size_t ret;
> +		ssize_t ret;
>  
>  		ret = read(in, buf + i, sz - i);
>  
> diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
> index 99fc3033..a8298cbf 100644
> --- a/libcommon/usdt_parser.h
> +++ b/libcommon/usdt_parser.h
> @@ -178,6 +178,15 @@ typedef struct dof_parsed {
>  #define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
>  #define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
>  #define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
> +#define DIT_BASE_HEADSZ		offsetof(dof_parsed_t, provider)
> +#define DIT_EOF_HEADSZ		DIT_BASE_HEADSZ
> +
> +/*
> + * This is the maximum message size for dof_parsed_t (header + extra data).
> + * Parser replies are derived from one parser input block, which is already
> + * capped at DOF_MAXSZ.
> + */
> +#define DIT_MAX_SIZE		DOF_MAXSZ
>  
>  /*
>   * Host-side: in usdt_parser_host.c.
> @@ -187,7 +196,7 @@ typedef struct dof_parsed {
>  /*
>   * Write the USDT definitions data to the parser pipe OUT.
>   *
> - * Returns 0 on success or a positive errno value on error.
> + * Returns 0 on success or a negative errno value on error.
>   */
>  int usdt_parser_host_write(int out, const dof_helper_t *dh,
>  			   const usdt_data_t *data);
> @@ -250,7 +259,7 @@ int usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data);
>  /*
>   * Write something to the parser pipe OUT.
>   *
> - * Returns 0 on success or a positive errno value on error.
> + * Returns 0 on success or a negative errno value on error.
>   */
>  int usdt_parser_write_one(int out, const void *buf, size_t size);
>  
> diff --git a/libcommon/usdt_parser_host.c b/libcommon/usdt_parser_host.c
> index 80dcf10f..939c66e7 100644
> --- a/libcommon/usdt_parser_host.c
> +++ b/libcommon/usdt_parser_host.c
> @@ -18,7 +18,7 @@
>  /*
>   * Write BUF to the parser pipe OUT.
>   *
> - * Returns 0 on success or a positive errno value on error.
> + * Returns 0 on success or a negative errno value on error.
>   */
>  int
>  usdt_parser_write_one(int out, const void *buf_, size_t size)
> @@ -27,7 +27,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
>  	char *buf = (char *) buf_;
>  
>  	for (i = 0; i < size; ) {
> -		size_t ret;
> +		ssize_t ret;
>  
>  		ret = write(out, buf + i, size - i);
>  		if (ret < 0) {
> @@ -35,7 +35,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
>  			case EINTR:
>  				continue;
>  			default:
> -				return errno;
> +				return -errno;
>  			}
>  		}
>  
> @@ -45,10 +45,72 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
>  	return 0;
>  }
>  
> +static int
> +usdt_parser_validate_reply(dof_parsed_t *reply)
> +{
> +	size_t	min_size;
> +	size_t	payload_size;
> +	const char *payload;
> +
> +	switch (reply->type) {
> +	case DIT_PROVIDER:
> +		min_size = DIT_PROVIDER_HEADSZ + 1;
> +		payload = reply->provider.name;
> +		break;
> +	case DIT_PROBE:
> +		min_size = DIT_PROBE_HEADSZ + 1;
> +		payload = reply->probe.name;
> +		break;
> +	case DIT_TRACEPOINT:
> +		min_size = DIT_TRACEPOINT_HEADSZ + 1;
> +		payload = reply->tracepoint.args;
> +		break;
> +	case DIT_ERR:
> +		min_size = DIT_ERR_HEADSZ + 1;
> +		payload = reply->err.err;
> +		break;
> +	case DIT_ARGS_NATIVE:
> +		min_size = DIT_ARGS_NATIVE_HEADSZ + 1;
> +		payload = reply->nargs.args;
> +		break;
> +	case DIT_ARGS_XLAT:
> +		min_size = DIT_ARGS_XLAT_HEADSZ + 1;
> +		payload = reply->xargs.args;
> +		break;
> +	case DIT_ARGS_MAP:
> +		min_size = DIT_ARGS_MAP_HEADSZ + 1;
> +		payload = NULL;
> +		break;
> +	case DIT_EOF:
> +		min_size = DIT_EOF_HEADSZ;
> +		payload = NULL;
> +		break;
> +	default:
> +		errno = EPROTO;
> +		return -1;
> +	}
> +
> +	if (reply->size < min_size) {
> +		errno = EPROTO;
> +		return -1;
> +	}
> +
> +	if (payload == NULL)
> +		return 0;
> +
> +	payload_size = reply->size - (payload - (const char *)reply);
> +	if (memchr(payload, '\0', payload_size) == NULL) {
> +		errno = EPROTO;
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Write the DOF to the parser pipe OUT.
>   *
> - * Returns 0 on success or a positive errno value on error.
> + * Returns 0 on success or a negative errno value on error.
>   */
>  int
>  usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
> @@ -118,7 +180,7 @@ usdt_parser_host_read(int in, int timeout)
>  	 * longer than expected is better than no read at all.
>  	 */
>  	for (i = 0, sz = offsetof(dof_parsed_t, type); i < sz;) {
> -		size_t ret;
> +		ssize_t ret;
>  		struct timespec start, end;
>  		int no_adjustment = 0;
>  		long timeout_msec = timeout * MILLISEC;
> @@ -151,10 +213,16 @@ usdt_parser_host_read(int in, int timeout)
>  		/*
>  		 * Fix up the size once it's received.  Might be large enough
>  		 * that we've done the initial size read...
> +		 * The size is bound to avoid memory starvation.
>  		 */
>  		if (i < offsetof(dof_parsed_t, type) &&
> -		    i + ret >= offsetof(dof_parsed_t, type))
> +		    i + ret >= offsetof(dof_parsed_t, type)) {
>  			sz = reply->size;
> +			if (sz < DIT_BASE_HEADSZ || sz > DIT_MAX_SIZE) {
> +				errno = EPROTO;
> +				goto err;
> +			}
> +		}
>  
>  		/* Allocate more room if needed for the reply.  */
>  		if (sz > sizeof(dof_parsed_t)) {
> @@ -171,10 +239,12 @@ usdt_parser_host_read(int in, int timeout)
>  		i += ret;
>  	}
>  
> +	if (usdt_parser_validate_reply(reply) < 0)
> +		goto err;
> +
>  	return reply;
>  
>  err:
>  	free(reply);
>  	return NULL;
>  }
> -
> -- 
> 2.52.0
> 
> 

