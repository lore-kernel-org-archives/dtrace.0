Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34423BF96
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 18:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394706; cv=fail; b=Eufkyb/XnWb60Tny/ttfTfvXyYUqI4qwOHgrb96usIMXRBq5XXp8YvaJN9IBAq961S2E4bwAZH+Y8aPPY4O3vrLewIpLBEcbFU6qNUgiVAaL1F92ZjEyh5hCxsxdcXJ6/CruAkLR+UZso/7Z24trGEDnB8fGoLwoqVC+3Ie2wDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394706; c=relaxed/simple;
	bh=VDf4G8dFHoYYwDqkyyDmRE9e51Br52UQnPJcgZ8HRTI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fTUvqUzJ1W0Q+9HhNy4haeRqoWUAQgo9pnx1VjQYNXKxEax8zIk0lksup14GVEiFc6hnuTLoC5a9Rxp6r1MBnllq4AADVkXd64hWbzMXQ4caTJ2ImHJdXpfW1sQD+ZUZI93Raj1npd9brBUnIHdd0AXPPXgsxkSs0nBrCH2QRKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eDzcwJOk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lesm/jck; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eDzcwJOk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lesm/jck"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Gfiw1000739
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 18:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5pUxUwbb+IHcRZdeSW8E5cruJRNPXkj+S6k/PicU/Go=; b=
	eDzcwJOkRyQUKpWeBYFF00q4Vo9fJatWojpUOcHJQn8IN6UrKhoFwtajwJLU9F6m
	qxd2tpqoqWbbCHDGnEIL0YQHw/7htJZ1lT+fyoFfqDKIYENtusdg+wbhVwyS5948
	qMINDOFIrmMfiXJEdOCAoQlszxBt+JrotWUyJkfLpu3EzzXahC9hOVsqaHJWcSzK
	35sI0Jfs4K7jbpHshP57sb4mLDTv1jT8mm0SHDsKbvIw01unXsD0kLFdN0JkLOAF
	PhmXUJzZtgSOjjbHKhkmfBzH7TRLYv/haKaZ06nlAqWNg4fqRhhoAlq02s6mOZ2S
	/AxOcpTPKO+C7u4PPNxCIA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af5dgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 18:31:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561I2536033644
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 18:31:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua67hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 18:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBNaLWiuotQMQd7iPlroZoQ/Gx1/KDDA3uOWbBbVIBNjuZ1pm7mSXnyKBMELjV1wLiIiRkSv9Y4/dtps4tqbqsDDXtMbSoFTgpnvIDfw8lKM6JDza2eO2fHcm+ft1z4Ru7bbs2X51uX/HM6hGpCdzGXwNBWg2hYKRaA5ivHwiImC51qymYgsukX8Mg1gbo9CnDpFuRjVAPqTw6Wc75GFF0v2vaktaonOQ1lHMKkAvlXdJIMr3+4xVDj2koQmaTcMlVPVye7xvnF1b+kQ8XMPJdTs1zzeLkLh0zu5qe3YJ23R8kMoHPxLsBE2jyUbHV7CZJ70ncuaYABPb9AcO7dGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pUxUwbb+IHcRZdeSW8E5cruJRNPXkj+S6k/PicU/Go=;
 b=YgwLWc2fLGl4sJyjZ1vTwL8OE5z83pvGgL3YKnFCuxcOsMPFmGjaGTSn41IXXmXxsEQsNsK5F9+xuBER2Qxb26eYjUs2buwFrKNJLNYHiOkSk1uYwPbZdGhr1Q5U1lPacSDyiP7HLZhYdpdMR4L77cl8GCnBJNIexMrZV+TaxH3oDbID0JA6EkVzXzlTcyrOJroNpABlLyZ8bZZ2zii1S/ZNJmXyuvj3K5YrquFtwtTgjTINFgW++QmSqUyZO+H8XApqHTTS4+ZYHla0W0MJgxwIKhujbhYPDvkde2HRmck+c5Z2oVrwITSYWsZ1EOisvSRoKDjk/2iX1VAybk8vhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pUxUwbb+IHcRZdeSW8E5cruJRNPXkj+S6k/PicU/Go=;
 b=lesm/jckjV/EnCdJoEhrfX2wmakQMiFaYMrymlFNKhpyZhQorvLfmZVJseHG3ba2ddJlXg/SbO2GV5WoIzGAv+FB3pcKA5gg7wU1L6HhU5L7rzPN9VVQm/5mSh0UT85Nd+MnyYx1noElwpPFPJN9zPhMz2F3fH9x8y39gWiG6gE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB5208.namprd10.prod.outlook.com (2603:10b6:408:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 18:31:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 18:31:32 +0000
Message-ID: <4a079f61-5806-68b8-9051-af918a822adc@oracle.com>
Date: Tue, 1 Jul 2025 14:31:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] dt_impl: bump number of TSLOTS to 8
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-3-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250610135813.15746-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9e0d24-05b2-4ceb-6977-08ddb8cd8086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzJibGpPdDFlOXprNC9aSDFxV3ZZbndFb3ZGYThjb2xtMGtJTllxNDFJTHpV?=
 =?utf-8?B?NkdybkZKbHh3MlZNbEFTQnRFR0R0R2pMeGZnTW5ZQ1p5Zi9iK2d5Qzc2eTVP?=
 =?utf-8?B?VFNHeE1kQXVJanpURyt6c1h4ZDVlWFg5cXNqWnVtMVg0OWc4RkVscXVCMllm?=
 =?utf-8?B?YTFCQmVPN24reU9UcUxLa3ZiaCtEVmVicjFLam1TWTZHc1IvbDJ0N09MdThG?=
 =?utf-8?B?YkQxZEFwcUE4R2xlTUZKZnh3cjdCRVIzTG9xdEtBbHdaVVE5bkh3RVVob3Nz?=
 =?utf-8?B?R09YaGk3SWJ5MnJoTEM3YWcycTEvNWpzRkExd2ZvNEhnY1ErZTZWZWFwMlZz?=
 =?utf-8?B?dE1naXFuRitRM2JjRjUrLzQ4NG1aaVk4TnN1L1RCNEVkaHFudmpsa0pRakht?=
 =?utf-8?B?eHZuK3IvUE1PZ3lvY1YwekxPL2hOQXlCSmM5aTFrVHJuSjZFV1J2bHhjelFY?=
 =?utf-8?B?eVlRaGNFQlBaazZpL3RPSUYzR1VlbHdBcXhZTlVaVGtHVWU0WUEwM3RMNWFR?=
 =?utf-8?B?Rlc1L1ljVmIyZjZrZjdsaWVZZ0t2SkkvMXVmR3F0ZXExZ3dLcHNraHBkTEhW?=
 =?utf-8?B?d1NwSXBWQ3oyVEFkWXdhWnZHYStvSmhvQ3N0SzFIOUY2V3Zjb0VmT1ZrL1FO?=
 =?utf-8?B?OWt0UjRiZmhVYm8zejYzVTUwbFR6cnJEcFBHUjEwNk5abkkyMWE5L0EwRHhV?=
 =?utf-8?B?UWx1ellqaDdmaVB5Tk5uTXB1L2J3OHlxV3VaVk9WdkYyZWVYdG9VZzA5L3Ez?=
 =?utf-8?B?b0U1RWR3QzdVcFhkUHJmNUVFV2FGTHJLblFHT3J4dytJM2RBa3R6dC9kZ0lv?=
 =?utf-8?B?a3pnblVKMUZ2RUhmY0NPdUZYUjE1MEVCWTN4M1pDbGV1dHRGamd0WGl2b2Q4?=
 =?utf-8?B?RmRWNUZSMDUrQ0VwYUdyWk85ZmF5bkJIY0F3Q1Uxd3NrY3pWYzJJaElnbnFp?=
 =?utf-8?B?T3R5Uy8xQnlLS05rM3VMZTcwZzBzNmo4dVZDMmkzMFF6aDdRWHQrbVlEV2RE?=
 =?utf-8?B?NFhXSHFPbXZNUSt6enh5M0pHOTg3TTJ2YTJqMDhoNm5LK1lLMjRySTZBUmNU?=
 =?utf-8?B?UXB0eG1PQ3dxeEM0OWV3WkZuZ2Q4S2EzeHI3MjlFTDBHOU93cXRkS3MrSnRW?=
 =?utf-8?B?N0ticUlBTDJxb3QvaHVsZTQyemliSyt6WFNOcE04RTVxUjBwb3M3YnZURGpY?=
 =?utf-8?B?RmdJYTlRUUw1WVY0RkxpM05NdExQKzRXbEtiUDlRdzlrMUhUdWovOVJqbE5B?=
 =?utf-8?B?N2VIZGoxd2t3ZmNEOFBRVS9VaGpjcEx3SHh0cU55d0s4VExxcWVEbGswQkNp?=
 =?utf-8?B?L3NHRDlNN25pSVcxTzluR05rRHJwNHFqSVBhTTdOS0dmRTcvNUtFSE5CQ3hj?=
 =?utf-8?B?YWFIVEcyYkhqNnBSUW14RFdOMklnVGUzdm5iZjBkUUFSU1RUVHgwU3VlYlBR?=
 =?utf-8?B?dnd4RUsrbTlaeFdtNmszcTVWMjB2NTlvcStheTJoYiszZTArUFVFRXJRdnJG?=
 =?utf-8?B?LzBseE5FWldIQnhSaFlaZjVkdG1aTVNPZzdoaVRvZjBaNEd0TDBIZzgyNHdT?=
 =?utf-8?B?QlQ1TWhqcmxTeXRwckQwN3VaY2k1VnJPS1RnZndjdG1pN0I5U1AxVlJGK0Rr?=
 =?utf-8?B?bmxIRWtTOEdXd08yTE5mNFlCcHFlSGFucVNUUS9rc2dGNURkSHhlY2hMTHNz?=
 =?utf-8?B?ZGluWFVZUGMzcUYzY2dLQzJaSGd5NjZUR3dsZkhNRmdTWFQxNVNnRTVHTDhF?=
 =?utf-8?B?OG9IWUI2b2U4aVBFUDltQnpoOVBvYVVmay91S3VXMnBIUUdKdDN3WVFWb3I1?=
 =?utf-8?B?Nk15WkZtYU1lNmVpdTUzRDZzYVkwVitXZG5HcjVzcmpSeGtKTTRqOGM1ZjJI?=
 =?utf-8?B?TW9kYWN1U2Q3T0w2cTQ5OWJqVy9xUXJaSkxNSlFWclpGMG9sdSs0K0VndHZ4?=
 =?utf-8?Q?30L13L0bBUo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXQ3UnMydFM2ejFqVklaVGhTT0JtYXczSDA4aENldkl2ZjVQeU1ka3lXSXlr?=
 =?utf-8?B?QUtNWS9YeEpXV09LeXRxWWhPUE4zeDM2MG5jeCtqbkxEYUZ3S0dDZjgxSi95?=
 =?utf-8?B?WkJVTUJKczJ4S2VrYktZY21KNGtVL2tWMzdEaWlpT091anhmRTY0MUI1OEUz?=
 =?utf-8?B?Y1g1Y0R5d3NSVkZLbStaZzJHcDhjYTkzc0hVb3JDOWFmQTNMRmxtRy9qdlRD?=
 =?utf-8?B?QTJmUUFyTGJqS1dUQjJmRmd2Qm5VcEpBVlFjUUlzdi9UazhNNmg4N3pnaXY5?=
 =?utf-8?B?ZGVXNURsc0FScDErMzNxSTIxRUFEUDNQUXVOVWpZK3RkZFVKOExubHhPMlRM?=
 =?utf-8?B?Q2wyMmxaQVQvb2E4bWpPWExXUHR0UE1SK1Q5SVFBNEl6TXpiV0ErSWMrRXlS?=
 =?utf-8?B?Z0xPT3BXeDJ4cG80eXVVRzBpU2RLVC94MFpWOUswU0pjZ0s2TVdDZWZCWDIv?=
 =?utf-8?B?UEVHQlllenIrOFJNRENyQklDTStGVitCMXVuYTZlL3RNeUh1MWtyN3dLcGxZ?=
 =?utf-8?B?RGlHbklNeU9qdDRXQ3VnYVJDZjdsMWRPWkxCcnB3bTRjNG5kQ2F4UUZvZ2px?=
 =?utf-8?B?RlV3Z1pBb1NBNnRsUWllZDFXRHkvcEFudHFqU1Vwamg5TGRaZk5wOVdPT042?=
 =?utf-8?B?RU0zcTRnck90V0t4bjZGM1pUTk83T0FWa1ZIN3FFK2xFMlRzVFd5c3IyYklm?=
 =?utf-8?B?dllnQW95d1Q2L1dvZ2REUXpJSjU3bmQrbEpDVGlOejlaTG5VaGIydGU0cTI0?=
 =?utf-8?B?d1lteXk0QXA5eXJBRldCSkxYNHJCSE9JOENVa0RkUHE3VGRZbkJnaHBhVmZK?=
 =?utf-8?B?M1ZrdnExTGlpcGx5ZldQeVZEblVvdUs4eWVBWUw0OHF0MGY0K0dVZEVSbU4z?=
 =?utf-8?B?dGZXQ0xFa2E1NXV5bEo5VlJkMnN4OHowby8wL3BHZy9SWGdvVXNRN3pRSFM0?=
 =?utf-8?B?clNpcXdwY3JKYWdVYlUzbTIwdC9OZTVMYXFBc1IyYWwvRG1NSi9WcjlJQVRl?=
 =?utf-8?B?QnJwcXpQbE04STN2b0hNQzl3dFBwdGpEM3dnU3VzQWFDRFM2bU1wOTU2cmxF?=
 =?utf-8?B?M25wQmtuTjlOd1NyZXpiWWFXRFVZUGRPdjV2d0trSmV0N1NvK3ZQWWdGZzFU?=
 =?utf-8?B?L3JIa1NKcTA4STAremNZVFRySFhvN2pGYW8yRmMrMmhaTHVuTWQ0dm5vWGxX?=
 =?utf-8?B?cWROZ1JSOFMwcXZnWTlEaXpnVmZiMHRqeXUxOE1TczJSRk9DaHo1REdNR1M2?=
 =?utf-8?B?ZGtKcnJYMUNLVVVFSFEvUDBoWUw1dGtHekcxUWFjMG5PUzUrcktJQTdReThQ?=
 =?utf-8?B?YmhkS2xxY0toNC9BODZFNEptKzZGbnpUWTY4bEMrVmdoSzg1aUNqRzVrQnFo?=
 =?utf-8?B?UVlGbWV5L0ZGVUxlK21LUGtzQWxVWXJVQTBGUGJKL3Y1NXBUM2Z6QWE1eExO?=
 =?utf-8?B?R0llZzE2OTdEQzR2d252ZTcrRW5sUGVLcW1zZzZoeHVtSndEVGRzNnVlUTJo?=
 =?utf-8?B?Uld6Zy9YbTlXMnIvQWFrVm44WGJvaTMzRkhrMmlCOVYzM1A2QTM1MWtldVVu?=
 =?utf-8?B?WDFjcW8zallUVnZPaDVydk9JL2JJamp2d2E0cFR6R2N5TWxmOG9HYmRIeXZC?=
 =?utf-8?B?U252cWF4d0p3M0UyNnU4WE5Kd2d0RXlxV250M3loV0lEY2lUdFJpM2c3dG81?=
 =?utf-8?B?d0pLc2p3cWV0WExzc01qVStlSWdINzczbEtSR2kxZWk2QjRrc3VmUU8wRDJN?=
 =?utf-8?B?cjR0YzFlT2xncjhYQS9pUXk0eDkwNWhnOXc4OUNvYjUzNUZTRXQ3a2ZQSUd1?=
 =?utf-8?B?Q1owU1VSanZacW9RY2NlR3ljZ2RxelpJbmtZMWJHYzVGWHNBVjNCQy9VSjVD?=
 =?utf-8?B?Z0lQMW51WlQxLy9SQUZHYjZQUWR0bk40TWw0RWNvS0htYWNtSjlOWERCMGYz?=
 =?utf-8?B?b2NhcWh2ZERwNjdCT1lDOHprbmc2T1pjSmVTdDdwdVJEL3p5NVRmcS9kNE1s?=
 =?utf-8?B?OTVVM2NiSGRmejdRMVFBcmFaREw4M0JtS292OTJsQlB0Vnh3a0xMb0ZFdjA0?=
 =?utf-8?B?R05uMWlYcElCYS9wWGZaMHdYQmxRVjVRSTVVMk93VmlhSGJZR3BUZUxjV01Y?=
 =?utf-8?Q?g6/cSGqo5VMPvkeLiYwO7gzNH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Cjp5ZokJhsBwvLtZht2oL/u/zeYNqCFguwH6UwKrZL1UbmDQiFwlqQmj4CrhfFVxlUl2NI/gJ4/oKUlq0SxRNZL+Qh98jRUFZ1oqc+QzXgR35VZCxg+QiqfmGVASS22J4jFmHFz1XUe8iWHVCU7cqfs81jjLgiYLcgZ3XmcCZqF7jV+zOeMEHCtVtLC5jDwZwfHyGeY+RR/bSmP2FEwAtoXfi0OKkuw6hel7v5YtlVceilu6wXl8HgY7LsA4311Zlqw2GRJtGlZeElsVYtaaiPcF7uvRyOn73/osRANJWP3wVNyLG0QbAez4NouAH8FfwTWbiqWgpFB/4YtOT8TvsQq2ZaK7Ok1F2IebyOHfQSAAXGPetx484bYjw6Mm4InkodBkoKcZ7BdMynlOT7RpaZ15DlGmBceqEOB/BU7/qd/aBYPSYH0I6UBachL1Cn1eJj+4RpJTUuisN69fzHkh/QJCQGoeKWFgA8zILId8VWvZnaLudrNuGEnKZtqEi+R/wnrypB4As3Y5WJr0nCF4ONDUdPd1S3ow1MtukB/BpfeDxv/J+dRu6f7gz610snhj3N3iIa/0Qe3ZK67g1iJK89otT/yI7XMhti3VOJpQq18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9e0d24-05b2-4ceb-6977-08ddb8cd8086
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 18:31:32.2276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LB3sYtBF0hnFtHW6qo6vzp7MWPEenHQoqeA/kyMWF6q/zBliArc8HNlRX6abfWmvJe/Twp8GfAEJYdxmTxT8BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010128
X-Proofpoint-ORIG-GUID: PxpebM7oVLHYokor_D8-J_QOMwMPlKSc
X-Proofpoint-GUID: PxpebM7oVLHYokor_D8-J_QOMwMPlKSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyOCBTYWx0ZWRfX+Hd0+/2FEyFg JeFGJ5tSquIfNX/GHaEHQ0inLEOo3INR+gzpzLmGkJilkTJWTdzhtKlabzlaboIDM40Ae2+qAxC F6gF/9W6KNUpe3gWGtR9wUFuUiYvOJwfkFvOB40f1V/mv27JA/4IDbCejtpZK/5R6+kqZY0nKKG
 HYt/2es9/CZ5L9f2DFkcAtydGml4O4m+Ut4B8qnMLNJq7YH2HaIdknnIfl4lHvwdku7dhpys258 CZ6RcTjlK+JkyxEDuqpBa7BBOCiN/g1bsz5BlJ9yKmzPo4CIGfm1JlGhhVGYk+QEExkHXLneaXE a5RgJpjhvadcPxDg9tiuSMxOTfu+kC262Z/U4GaStUdDBn35fSXO0/EU4tNwByVQkW+sNFK8bpG
 VwjMhgLktUd3/JPzIrpI22Fu577+AAkIa/8gG/qL3izKBcTYBnttl5qa8kNXi1UzSqyzFfeq
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=6864298f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1CVCHE352T1q7u5B0KYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Very simple patch, but one key problem.  The changed line is preceded by 
a huge comment block that goes to excruciating pains to explain why the 
value should be 4.  So, I'm fine with the change itself and I think the 
"Because of the complexity..." sentence in the commit message can be 
dropped, but the comment block in the file needs to be updated to 
explain (with corresponding pains?) why we need 8 (not 9, not 7).

On 6/10/25 09:58, Alan Maguire wrote:
> Because of the complexity of the TCP translators, more tslots are
> needed.
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   libdtrace/dt_impl.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec5..10424f9c 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -218,7 +218,7 @@ typedef struct dt_kern_path {
>    * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
>    *   and a terminating NUL char, or STRSZ + 3 chars altogether
>    */
> -#define DT_TSTRING_SLOTS	4
> +#define DT_TSTRING_SLOTS	8
>   #define DT_TSTRING_SIZE(dtp)	\
>   		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
>   		    72)
