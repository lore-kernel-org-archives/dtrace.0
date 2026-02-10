Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B816FBF
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681774; cv=fail; b=Wyj/hdKVc2iHADqXEgDK4chB6cC2G6MwmRB+3QJEjxSPNDu5gv1XDeTkJjlNGUVTTFLBQAAAKBDvUBOLK+OunAmeEPZtNgZUyNC7/E53L5K/9BJ9BkXR+B/Hs/q1laEVj8ydiNBAJYM6HW+UlqmChIqnYFochFKIyXa/VbE3wG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681774; c=relaxed/simple;
	bh=4we7Y/et0rcOodbeprilthQ8JkJ9EfvTTCxqzSCQh3U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BvckxUnzE0GCjPb+xJw5LoEZ4wPWG2GLqFr6hu9ofTe67JRVpIHYgp2fh+3w8NoTl/mQTn40vri7/zHS+HXLZAEwU8H71nDaBE8lksGRYIy7zCyTzrZ2pKVOjeSnUZuipzBLu7BVqlwmGjvSVVUacJ3lr2vFDiVXGPmVqP9cC44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gF75tY9G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IOvr/5kY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gF75tY9G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IOvr/5kY"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Le3XD2924633
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 00:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=g6XOrFTYQPMS/y/r7qZik0M41r8xoIn7YuDagbKPXzQ=; b=
	gF75tY9GTmlYReqW/pNRIhsKKO7DpsM8QstHfPfb572uUGxGKydoHx8Zt8CSxW6p
	Tr2pOzigLgJietjYlFqux2D/BmEjljg0noVIOt+66gXxecAek2OlMEkMO1rZQy6w
	cZPFGZK5YEKici3Im8quGGCtf0jEQSB+8fNAogsSQUlBCV4PaklqtwMxQCnywtcq
	+dFfhQZj0n7hMOJNjCFNUzqZxHO2swcC1UKp+F1ivZCZEye0adh2+u/mHvqZpMLR
	+FdOfmmVVyP+dI38E/ovufMpohRBkokewZyjsHv2uZ3WJ5FFE5uVso87k3xWbDL+
	gmhBl2qtQ2sOtYTUzGL+iA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xf3u49j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 00:02:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619NMEUm000438
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 00:02:51 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uudqukd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 00:02:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uppm7+DDsS2alB6J5+5kEZmCSVF0ykwBl8eqkx7s6kQYQE53Ff/va8g2EXRkaG4FlfCuSM5wsIjn6g3h0OYz10Ye6muTPRRHdmPLr2sYTdmKbQKAZ4mMx0LYCg/t8DszYzLUSppzVyxgps/qYsgAZhliGZWKlQVuDsLkLy8IPntKZLbaqZql+wPUFDcwY1vJBZOZkuHXYGv5Vi8OtyFPMjQS6f6SYOcHxjhAsAKVvlcGPoBwvpL6nZqiGE/0YGRY/3pg50mZmpq0D2Ik+9Wu/oAZtMiU35iJ/xSBcYjCuTW7EgjXQxFCBDDKwTQnZGyT0RAW1pu7q1x/18jV1FaoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6XOrFTYQPMS/y/r7qZik0M41r8xoIn7YuDagbKPXzQ=;
 b=OSHySPEIYlCyZftMay+Gj6pDWV3itZupWVN7WLPpkfHwxVf90d+P7j3wfy716egzBQXyrnWgfQfRMvbymUg6QDoQsld/KtPwyd1QWEgJANRWfVhjNFw/9KFGE6wHtNc9wxLAxY4RqDSpa65CRz7PAycbnCJq/b5CvsUq0sjlnNC4frfHYZbEN93cflFBiHcctUelUW1XnS5aMbx848O5jD0TDWc/UQHSfPR7U3uywWDt1sIBLOJBsCWoy8mUWsQ2xKjKsWAfJWMrWDYvBWERO8PZXYksL9R9pry7Z4X/0hrMLI6Rsn/0tUJnY3qiXcyqVVXeA2Ps+O6cdIvgXD5qxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6XOrFTYQPMS/y/r7qZik0M41r8xoIn7YuDagbKPXzQ=;
 b=IOvr/5kY/HvRdRnvMxrk3LBz4fFOxAyqqDg9VNAXUhdbbWrSZ1zQFytIZI1hE+My6OgX/Rw5UHkpwLXQS30wPwLECTu/RtExkXOKvyoJ0kpp8o9bZtRc0ii8QwjRLUU1nEoDkYX703LDXEEjYhLPuVsjiw9KykOs+BmomLdVlH4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6366.namprd10.prod.outlook.com (2603:10b6:806:256::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Tue, 10 Feb
 2026 00:02:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 00:02:47 +0000
Message-ID: <60c1bfe9-f613-74f9-8e35-5b00ea4ad54c@oracle.com>
Date: Mon, 9 Feb 2026 19:02:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] test: adjust tst.pidprobes.sh to account for PIE
 executables
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B4C2136DC1C1BBE9EC54C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522B4C2136DC1C1BBE9EC54C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0052.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 920c0a49-cf3a-44df-95d7-08de6837b8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUR6dWExK3NHQ05aNGxnSUJ3K2k1bE5BQURsSm43MG5uWVEzV0RiblZWeDh6?=
 =?utf-8?B?aitEeTIrRDIvUXoxMHBCZDF3Y3V2YzRSNnUrb2FoTFQ5d3pWd2ZRcE14U29C?=
 =?utf-8?B?dHNjM3BQNnoyamxmSC8vTGd0K1B3MjlsMllqN1dWL1RZaXRWaFR3VzRkcDdE?=
 =?utf-8?B?UmFXMWwvd0F1bFUrZTcvck5uaHJOa21rN3I3OGIxR3RrbGY4VW1Md2xFb2Rn?=
 =?utf-8?B?SFZvNEtkdmV2Slhsc3RPYVNtOEpsRytzSXZKeHM5SXVLdXlYVStHenNIZWRm?=
 =?utf-8?B?eVRiWW4zSmhVbGZFMllKb0taV2RlWTUvUXJyd3pEbGdDSFVnUHExQ0VxbEYx?=
 =?utf-8?B?MVJKSTF3anhlTFVVVVZoYXZmWW45Q1cxa1E3czgvQTZycTdmT1hlc200bmNx?=
 =?utf-8?B?Y1BudCtsS25KZGVqUW9CTlhjL2VSQzl0c08xMFg4bm9aQkZPWitsY3hyQkxl?=
 =?utf-8?B?MVE3bVpLUVR1M3IwVFJnQzIyaUkyUWtzdkQ4cXhtRkp0cUFYM201TlVMRmFr?=
 =?utf-8?B?YURMT25WeEtaTXdBVEJqaE80ekZaVVRIejZibTNBQmlQNksxN0RXT09kbFpJ?=
 =?utf-8?B?SmwzNWQ0QXZCYzZXUUNNZkIrNG5MbTBtRmlLYWg2TEJja1NLZjRLeGt1ZXJP?=
 =?utf-8?B?d25iRjFSbE4xSmh4OGRybUdHT1k5UHlkdzRUZHc3OHVJcWsyenBUeHpqczRO?=
 =?utf-8?B?dzVSZWhMc2FsaThiSHY2dDZvUXVHTGZNM2w5cjgvb2NFQ09MOCtiMmhqWTBr?=
 =?utf-8?B?WlgyOUhjeWprMlFDN0VLc2VrdE1qcDRaQnZVK3lnRnlDKzNoLzFQc2xRWlky?=
 =?utf-8?B?TVJQZFk0Q3ZjdFJ5SUl4K0JrbFN1TGkyTkdZV1RIOHZuV0k0UzVZUU0wRURa?=
 =?utf-8?B?dkZ0ZXNaZUwzS0pMYVdOdmd1MW1XemtMeTRFNDZoM3k4YXVjRmtGUC8yczBm?=
 =?utf-8?B?bzdSOC9jQ1ZONWZVUkZlNkUxdjZXM0xOT1dNbWFDdi9LaTQxV21LYTJJbndT?=
 =?utf-8?B?S25WT3hQZy8xd2dMRExzQXhDUGVHd0hCbkdMM2lsVkF5NDYxRnVtaXUwR1RD?=
 =?utf-8?B?K21QdlNBNzgzM0lOaGdHaTAySHo1L0IxanVnNlBuSVhVdXVKQ29Oc3BBcVRx?=
 =?utf-8?B?NGdkWXNGTVFDNnQ2WDgzN2pUUmg3d1dIT2UycmtOaW5EOGFFRGVleEthNEpv?=
 =?utf-8?B?VlZ3UDNjazU1Mzd5THd5b0dKa1FYOWVwVVlpTHNlTzRFcjdvLzhkcTFlUG0x?=
 =?utf-8?B?UnB1K0daQlV4MXF1RXltOFBLd0JqNEtOTTZSR0xtbGhYSnJhU0FLZFpsaFZh?=
 =?utf-8?B?aDJHaXhRWDdwOEVIRHZ6eGhGaTZhbWxiaUNsTDAwdWlPbUVFLzR2dFp2Y2Uv?=
 =?utf-8?B?NmZPTjZVbGtwR21hV1RzeXNEUVhaTW5DUk44SzQyaVNwRUwvZ255QW52dWxB?=
 =?utf-8?B?WCs2cnBCeFllY0FndENWeitVZCtvM084U2JDcmdtYll3TkExakRjMWxmblB1?=
 =?utf-8?B?Vm5YZGVuOURZNzZYZlJJWENkQzdBODNSOU1LL1lXR0ptNVl6VUg1T2lQLzBU?=
 =?utf-8?B?Y0d5VC9pQkg3bDBhdkM5NUlGY2hWV1RFNUlNUnRRWUNYUXhiTW5XekJRTmZT?=
 =?utf-8?B?QnZUWGFmdWlEcmVyZ2JWRGxFREl1SjFyNStTczE2T05CSU9IdHVIVW1STVJo?=
 =?utf-8?B?c00zcmNWcnlYUmdGRXRneEdLVXpoaUw3Q0tIQ2crNVVmc3RSZFVUTUpqZXIr?=
 =?utf-8?B?aXRQT0pIYzRYdGFJbGwvR0thTW9PRTBuYnkyL3lybGdnc0VOYWxUbm5SVFM1?=
 =?utf-8?B?bUtIQU1waWZuV1RzaTBwOWxhWVl0MzJPMHRmaTZFVjVsTFJ1Y0hYZm5XYTZB?=
 =?utf-8?B?bjFTMHBRMXUzUzcvMjBVeG1sM2czVHc3SjhTRExDQVVOaGFjUVpCeXJ6Zjc0?=
 =?utf-8?B?eUFWVUI5c2MwZVV4QjFDdXIwQ2pYSDJLdnNJRTArd21UYzJFZUtkcEk4SXpB?=
 =?utf-8?B?THJWdVV2dVNjU2tNNW8xb1R0YytUN2k5M3lVRHRpUlVWVncrZW90UkY3cHl5?=
 =?utf-8?B?TklrM0pHenR5VUx4TVZBVitRbjd1VGZvNGVaSmk4UFBQOGRtSTJzek43SkhE?=
 =?utf-8?Q?9BPo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXNEZnJBMnc5YzRPUkNjY0ZOTFZLNzFoT2tzNXdUTVoydFpEdVJXYktnWXpR?=
 =?utf-8?B?NDVrYmsvZVpRRjJHUTFDbTBDZnIvU21MUmlZZ1lvZzVONnN2dElmQlhabVRh?=
 =?utf-8?B?MzhLbUp6NVZDNTVmaDJ3MzFrQ1Q4d3FTMWRPWTMxUkxtOTJHZDV0RDlYeFdL?=
 =?utf-8?B?c29iMFE0ZFErVjI2cU1HWkkzY2FXU3N1OXlJamQrVW0xMzlpMVA4QWxLT0xY?=
 =?utf-8?B?cXZuZ0VweVNvVXJrTTFPUXE5VjZVY1MvTVpXbTd4S0ZnRE83WjV6WVl6aW4v?=
 =?utf-8?B?VW83UlA4ZTYzb0k4L3pxWkJlNXM5TStBMi9wZDlEaEtYaDVuMFJCYWN1Rm9k?=
 =?utf-8?B?aFpYTCsrRllGNnBITmFhV203T2I3QUlhTGxRV0ZoTjBleTY2RjVQdFg3ZTlS?=
 =?utf-8?B?anBBSnhDaTgxOXRacUNEUjFGOTJoN1VCblJaSGFOQ2dWckdNbytSaFRDK1BF?=
 =?utf-8?B?NmNFajVyYVlQcWVoblBhUWNCZ29xQnhQNW1qRTI4L0w0U2MzTkRJZ3g1WHBq?=
 =?utf-8?B?OWE2NndEQUtjenN6bCtQVzNsbjFPNWRyS1BVV1VUVnVtQ0NRUmJtamhNVXRW?=
 =?utf-8?B?bDcweGpUNHpKekYwaDdzZHFlazIxWHcyVE4wQkFVWmhHVVMrYUdrTE05SE9y?=
 =?utf-8?B?TCtPaFExeGJYS1V1Y2NhRFh2cUYzdzRQWGZaMjRLSjhJLzZFNUdBQVViKzVF?=
 =?utf-8?B?TEUrRkN0V3VIZ2dTMFh0aTBnZ2J3NVAzY0czQURjSFB0bkMrWEF6UVJLc0I4?=
 =?utf-8?B?eEtVWXdzRHdta0p6VFRJN0dJN1FFK21vQmpMUUlGZWtOZmQvS1VxQVlxM1dW?=
 =?utf-8?B?SXE0L1pwbHZrWmZzMjBudUdhNHVLZUU1NDhUMXpLd3JpVzFjSEZPSEhxU24z?=
 =?utf-8?B?VU8vV1lwUXJsbHM4eFRDdWJpNUtlL2NvZ2tsWDMzVis2WHJ1V1FoYWZra1Zt?=
 =?utf-8?B?YVF3QTNzRGErYjB5clBkN2JOUFowMUxNU3FWS1orV0xtU1d2UzFzTmlMWUZ2?=
 =?utf-8?B?S3VuczJqSXMzMldkdmRrZWQ0Z2xSekg5RXlPN3RpekwxREoxdjg3YkdjV0Ru?=
 =?utf-8?B?YVdzQ2lKQWlYMndUOFN0d0ZSMnA2Wjh1R0hEQ0o1ckx3QTg4UkNKK3hUdkp4?=
 =?utf-8?B?TDJzcW5QUzlkWmpuZU1jeTRCWWQ2eG91emNHekthVGRVN29EN2VSSmxSLzh4?=
 =?utf-8?B?T2Zwb214THZkWlRQVXQwQTFlcmF6Uy9SRmZNdmhGMDEzV2dqc0J4NEdLYTFX?=
 =?utf-8?B?MVQ1QVl0K1NXMkNMN1Y2cFJNUlZ0RXFWbWw4QjhvbVc3UTVZQ2w0aU81Vzlo?=
 =?utf-8?B?N0YzdjNlRHJldDJBOXpEUUk3OWxRYVN0YzNCMGMzeXRWUDZjcG9Vd0FSLzIw?=
 =?utf-8?B?RDVYYmszQUtkd3ZkMFdITEloQlFKQWZ6L2EveEJ5TEt3NnZmN0F5dzhubVlY?=
 =?utf-8?B?UE1BYTJmRzdzZE95Y2l1WFhvaTJIQ2xLd2lVNDVEbzM4eFNjSWJBZnpTYW9p?=
 =?utf-8?B?WHNjZVdHSWJSdjhlOThzMjk1VFh0Vnc1cHR4YUVjekhQZDNqeGt3U2dCemcy?=
 =?utf-8?B?a09GSlBnVDdKcXpRVWtzb0FyRDU5OEJHRklqc3FjQmZaZmVSdFh4NThReXdP?=
 =?utf-8?B?UVNnakF4c2RqcUpJM3gxUFRGdW5vR0wvNUd6dXo0UHA3QWxXY0dhelgzang4?=
 =?utf-8?B?a3Z0emxzdFc0WHN4dUpPa3k4cVk1VFhkNXF5eTVTVzN1UkdvUjQ4RzBRbGsv?=
 =?utf-8?B?QWRsNEUwN2swaFZMTE8xekc2VVpJUG1udXM3UzdLSUdjcWVmWXhidnNYam5V?=
 =?utf-8?B?MDZqY2FTbzZBWGZCb2RDcWhjbHl4Wm9NMWJlakNWYU5ZYVV0eUh5UEVoamxa?=
 =?utf-8?B?aXJSQkVNeG5kaEdDZWQ1T2R5bzQ2N0l1bitORXNEdUFIcTlRUGFibXNnRVdJ?=
 =?utf-8?B?U1Y1akJOSUJaOUlpUnk0UmNWckZSTWZ3Z2MwSTFseHprTUhHZVpCVUs4YnhM?=
 =?utf-8?B?L1ptZHUvYnBBWDNMWU83TWxBckhpNzMxVndZaWx6ZWVtU3BHdEo0dEFSOHZX?=
 =?utf-8?B?ZCs3TUowQXA5cEpuaGVwc3VkamFFSnhHcjk5eHBpM0dNNTY1SVNtcVNWSVo0?=
 =?utf-8?B?SzhqYkFXYkI3NGp2b2t1aTU1VWRLTllCYWNDc3hlbUE4K0FvSnkxcS9IUU5l?=
 =?utf-8?B?Q1BpTXI4NUpNYUZVRk5oLzJyTHNGQkhSd0pqUlEvVkxkbXhMWC96c0svM1Bp?=
 =?utf-8?B?bmtWVm1DME1INC9Vckl4Rnk5YUkxNGhOUC9TS0E0S3lnNGxzVlp5TGthajF5?=
 =?utf-8?B?Tk1haG9TVXVZVmdDSTQ5RmY0endhOFdKVGxpdVl2c2d4UTAwemRLQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lJC7vOEBixWB1CTpE5SFHfH1BSdh3mAgDhiFNEtHTJzC15XpgephTH7IH9roNOLYjGbo9pkkL8wEHfrxadBWm1SAWXP9sQbCaoDBRIyRXn6ivS81KqUSwjQuqs4CqM0YVyMxiKHvyt4x+GZFI5kRxVCWajXp+i6kwXn6AG0uNt5T5XTnwSiqs9PWKrkPsii40A/6IY7U4IqF7txT+/08NynLNN9uWnEQxNON0vGV+93yFukjDH4rLYCY8wJTLYr1JeqIcufZIY1ziXZ/QHjIOCP1WU8RY1Z+kaOv9Y654XtCZo0RiCHpoD1o1p45TOREEnXMo8dAK4mC2iprAeEbHDqFJDPSEUJ/90gdTDa1+tRibKEOIGqDydaCbuJEtxZVV911p6gamSXGBlSIJTFcgByu/rFPjWda3rlCdft1qJqheNSEWH8bhxrx0ebIVazd6cDhvvYUyN24S4QytiNhiGrSBU3E9etp+kqXCWKmTnuHplTaQ+OqW+yCBJ45SgCbb2kxmdkFjUPdg+HEJOdrhubLS0ycwuWYvPt4a7n0DojEFiRpgAn+tQGX5QYrb2qG5/b7DENTnV7FUdPOzgN5BwDUa852xHu6W1V3MU6MT2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920c0a49-cf3a-44df-95d7-08de6837b8da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 00:02:47.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HPAKwoEzqUnLVHZ2GAOao8dy2zj5fQdH+YASgiw2RD0VTID+fGjxE164OfJukmRV/nzjsugRmTFBEY9qXkRZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6366
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090203
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDIwMyBTYWx0ZWRfXzXb3uhVE9hAO
 zL4BkQtcS01yc1wlcnRoWmhgkW2ZYqov5IvIEUy7AWp1Ql5NGrmsy0EFxirUQVTsPsUBEcrIngx
 nsOvF/eW+Hi2DJti4ls3YTQO418wtg1lNi4VbNPgJVLPcTVn7GJiTaWN3Wv2HpE6FBtg9oaoBQ0
 r70DpU59gwFdOQ6+1bZHgX5HL4uQNQ5lf5AKrVVWGbF/+hwGE8FvYb5saefQw2YOFd9X08nUgq1
 RWsP0z6DJcFR6ZP5/a/rHfd9plD5kaZpSumZI4i+VaEwuQYGA8iTVokutzDkRpsdg52vpwW5GSS
 D1Gq9gMtDjQsn+mbWRfU64GSZPGsYuwYNfLBYibAo53B/E5b7f7MFVnxASUhxB9UTtOQ/JZ+Low
 JMPlHz2P1fmuXk1SnlMxmE0vEY5R56vuQv5P1u4A6Ljo8CxdUfu+P2EhfB6snKJm8PYihpWn3jm
 /nh2NilqZ7yuqjVD0Phu+vNDFyru0xrDKIDf+vsw=
X-Proofpoint-GUID: cXVtOhqrHauLnygXt0ok9QbottFqdyUj
X-Proofpoint-ORIG-GUID: cXVtOhqrHauLnygXt0ok9QbottFqdyUj
X-Authority-Analysis: v=2.4 cv=KLNXzVFo c=1 sm=1 tr=0 ts=698a75ab b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=PZVtxhc5yeh9EiXs5L4A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12148

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though s/reults/results/ in the commit message would be nice.

On 2/9/26 15:43, Kris Van Hees wrote:
> When the test executable is compiled as position independent code,
> the comparison with expected reults fails unless the reported PC
> values are adjusted based on the actual load address.  This is safe
> to do in general, because for non-PIE cases the adjustment will be
> 0.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/usdt/tst.pidprobes.sh | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 24fbd518..80de5140 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> @@ -119,8 +119,11 @@ fi
>   pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
>   pc0=`echo $pcs | awk '{print $1}'`
>   
> -# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
> +# Construct D script:  add a pid$pid::-:$pc0 probe to determine base address.
> +printf 'p*d$target::-:%x\n' $pc0 >> pidprobes.d
> +printf '{\n\tbase = uregs[R_PC] - %s;\n}\n' $pc0 >> pidprobes.d
>   
> +# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
>   for pc in $pcs; do
>   	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
>   done
> @@ -130,7 +133,7 @@ done
>   cat >> pidprobes.d <<'EOF'
>   p*d$target::foo:
>   {
> -	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
> +	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC] - base);
>   }
>   EOF
>   
