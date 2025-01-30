Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588DF1BD4F7
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235591; cv=fail; b=RHs7RsK7s85n3+a9nOoRxuee3voYaZRklwekTIWlDoCZ/URUR0YntPM0SsXMJJUv1D/U5HAUyoxzSXn+BAA4ioziGEXr3RZDDGTrTOuBt8jCuaI4UV+YlnoPDkXQ84aZl7RJIxQrPjbfbpK6veLGIDzzq6E+ozwI3JuGVnc9Mfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235591; c=relaxed/simple;
	bh=hrKGliNAZG4NJpk7smlSyGX6vN484v1feDhqbRgQMxo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HYfEKH10HD3mhGIa/V1wflhv2RDaAoabWR2aNpV7bIZY17FQeYc3ZApY4wi/8E+RxugEi7lRGSIXcfFcRJtg96jlMcq2ForM6coVk8kIxjSXqCc33rHObXorcSVphON4593NUClNnsfa/XT3oR9gr9GneQQ32c7ERM7c6LzRMvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FD1nwBp6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tFunjy3v; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FD1nwBp6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tFunjy3v"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UAbkcK016399
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1/Jgq5Udd7jWharcn895z3aI7PsRFnVAwajdj8OTFps=; b=
	FD1nwBp6rI76y8vsz7ekk9vuFMn14SRmvnPk3C/hwkiPu4zwRUWRAqWh7hNlx4x/
	gC0NFfLQGX4pesqQDt1vAHqdCU+9nfs6q9GtT5dJUCRRvkooZtpzYUB3vrx/dI6c
	4cS21ympH1hcyclRwAAApEXoMdthhMrIqcZUKLvLLeUNNPNjQINpATVDtZF04k+s
	PffRllJX607K2h7I2THNdZvA5f6/g8UmrbIbKvJlRX2SY69qSAjRK32pg/2v5XoK
	l7XjocXDQwWdQJr/PMCdnX4E1mfS0lMlZXxMAAJiYB4f0L6FsAwZgL4dzotN86U7
	ETnmJrsN2p6UK6BDxJmZ0g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g7tu8225-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:13:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9kYpC005676
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:13:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdb3c5u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:13:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiOvsdgUySR1y3kpmH6/px9fVemZvi01OfLDGeczTExaYLy0LfdBzMCnaMV97arTBa1S04eh1mpn+KO9ArZ7E2AhD7Pa7DJDBs00ZmrGk2R5gnD/GsLRXonl6NvsMLCl7ZfN+Kp+TFa4r+ZJYO8VhJbuswjS3UqfZemMlZLetRYO7+Fl0nvi8fk5R+H1KVR0shcNPGEhsIrBGE+Wb6CzSndbB3dhg2wVOKBmokzwIDqcixOtckkdPu2r4QNIfNqMumI9Ud5ZXSABvKiyC+VgSKFd8SK19aDcqKM/gooNDp7xIi0YOy/l6AjElebx9tnHWJJXXQBDY2T2Ubo7Z5iGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Jgq5Udd7jWharcn895z3aI7PsRFnVAwajdj8OTFps=;
 b=vQ6xJ70bsTH5gXKjZIiYV+DEy2faOf6Vre0QiIkjXyiaiGQL69ECfZfM/Z2j8yTkkbfvhsblg2yP0S2hyjFCCf2QgKTTyXr4TPF7V1OpinKbeoihKyLl1grmiiQHNgjVKNwI86NyW1yrHezUjUA9qgJZYiu71Qem5tuoxaSpmBOFF2qD9I+ND8EmEiP+/8EEwgUkwOaGx9W35g+/US6zFv2cadVZtcRuOm/pi2aDh+LTqm3tBkOGduB8TSOEPnprbxj8DkAlzfGi3UkuNi/LpQWHKkcjlldRvpU9S+5HWsLTURmhN5k45ZT4RpoPQOdnT6ssC3N+zBYZhHzOQIrG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Jgq5Udd7jWharcn895z3aI7PsRFnVAwajdj8OTFps=;
 b=tFunjy3vBBe3fOhj9ct4zYp3gy3ryI1q3GNTAoLWxlPFjJMaYp7dq+qGQk521O18eF3VmlZFoWT5MTeEtmD6aAiOh/HR9CUA7EhKboz7lcz5L8RtVe+JMlAY8RYbGpcsiBwr1a4QPYaKolZ2DpxAf7OxAK3v4kJkINf0gmuCkEI=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SJ0PR10MB5662.namprd10.prod.outlook.com (2603:10b6:a03:3dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 11:13:04 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 11:13:04 +0000
Message-ID: <407bef64-903d-43a0-a5e9-071eef13c27d@oracle.com>
Date: Thu, 30 Jan 2025 11:12:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ELF note-based USDT support
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250129145522.512341-1-alan.maguire@oracle.com>
 <Z5pKUy5EOa7U/Ita@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Z5pKUy5EOa7U/Ita@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SJ0PR10MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3128ff-687d-4938-9a6b-08dd411f1113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDVmMElrRkRXd3dTcjBFcWlyQU5PaUN5QVJiaVhBbGpkcVlvMTYzZFJOT3ZN?=
 =?utf-8?B?R2Zrc2I1aU1ybkIvQTkralAwODM3dXFNblhscFM2c096U0FyUy96R3hYSHlP?=
 =?utf-8?B?eGluekVaWVhJdmExeE95TGpGbXRhbForR2hrejY4bitUaEI5NDFCQzZCeFJX?=
 =?utf-8?B?OXdNN0g0MmlEZmxpN3pRME14QUlKdElCZEtSb2N3TWltZytMK3hrZWpaMU5v?=
 =?utf-8?B?NXNoZitSUWI2SHZuYlp6RVd3MklBV2hQWWhlSFczUmpzTU9yZ2xRWUNrWnVn?=
 =?utf-8?B?Sk5ZdDRkN0hkdTEweGNHbzFNaFNyREc2QmhEY3AzcU9ndFVMeWMyMXpUaXpD?=
 =?utf-8?B?Vk9oVmdpa0Z4MS8vQ1VTTkF3eVBkTUMvT3dyQ0VscExkV1MxNVBHRm1zUDFu?=
 =?utf-8?B?UFRmUDVMU1JsUUVMZlBiZlJTdGJhV0hmbDBKVUQxa2RoajVFV3cxWEVxMFJj?=
 =?utf-8?B?WEVyOE5ZMm5HT1JoODZWbkY1cUJ6aHhsRkpwTmlESnA5WnAzZFlFZUM2MlQ3?=
 =?utf-8?B?U0NvSEFKNEpyS3pjS2NTdzRNV2djWkhmR3JKVlZJcTROWEVYRWVKNHVxZEpC?=
 =?utf-8?B?WWkvd09salZXUG5KWVVCeFBPNm1waVRJWnM4eWV5L1M4Y1ZXMWlNL1lsOUxG?=
 =?utf-8?B?aUJoa2R6MEIrYjU4bnFGN1FRd3poSVhhY1hrQURVSWg0cmFKd01uY2lqUjdU?=
 =?utf-8?B?UFZSQ1Q2RHExQVhJdUt5bVBYd3djRTZUM3JIaUdYaHBsZWZaT2U1aFpPQWla?=
 =?utf-8?B?SVhydmMyWURxRGhTRSttT2pkRlRVVXA4Q2NkSHl3V3A4ZnpQL0NvYkcrT0F1?=
 =?utf-8?B?cVgrQlE5ZFVhVk5WSmJkNitSS0VkT2VPNzdtT0htMjNsRmpEbmxRYittVVZM?=
 =?utf-8?B?NHJNKzRwdWhyZm5pL0RKOUxpWEFkZG9RVHN2NUxPU0dOdGFmNm1CelE0VUlD?=
 =?utf-8?B?YU1XM0tQNlEyV1J3YUgzeVRBTDBZcmVXalkzTkFrQldrWjFWTGh0TEtPc05O?=
 =?utf-8?B?SmRYd3VsRXQ2WWE4ZytxN3A5K1ZnZEJzN0lnaktTS2Nld1pOMm9odEs4aUhX?=
 =?utf-8?B?bVB4RU1QOTNPcUdyUXdJQW00bDNRQ1ROUkI3eWppSE5WUGJ3YjVIMnJ1Rm5i?=
 =?utf-8?B?bHpIQVdFVld3Q2FpUzc5VlJYc200YnU3OFdtblNCblJaNDRkYzBwdlJYblN6?=
 =?utf-8?B?V0VXQkMzQWJnTTF6SXdvSklIZzdMaUVaQWpjU0F0WmJIOVJLcFVhSEpRN3hx?=
 =?utf-8?B?MnF1OUhIVXRTVThUb2RMb0ExR2U2QVZkd05PejhWWUZzd2dMNW41N3JDYmMv?=
 =?utf-8?B?aUgzV05DS2NMd01KR1R6VTRVV2E4bGZTZUIwS2xCNVVPbE9wME52Z1pKNnJk?=
 =?utf-8?B?L2NNaGlJT0RCc0FVOXBRbGdINmVGODNvRG9YVVBzTU52aUJYQkRLam5QQnhX?=
 =?utf-8?B?Nmoxck9IU09OUk9MVXF3K1lXUkhMZ3h5UklHTEE1RW5EWm9QR0I3ZmNyQXR3?=
 =?utf-8?B?QS9aaFpTZDAyS25zeUN4WE1KQ3N4NFJCMHhoMm9PTWZGaUJHb1Nud1dvdHIv?=
 =?utf-8?B?REhYMXF4NGpDQTBtMlBmdmNFK2RXY1hnTVllK3MxeDBIYnlwVkNyZkk0RGVJ?=
 =?utf-8?B?WStUbWIrd0l4TndDaUpLRExPQTBIb3JpRWdqZHFsd2FJbG5vTGVTbWFUVEM5?=
 =?utf-8?B?RGhnSFhQcHdCSE5tVlo3VVFNelBKb1B6cGt4cWZYYWRxR1hyR3FmZmI5NE5X?=
 =?utf-8?B?LzB2bElzYnNHbmEvQ0hkN1VjNllRSjkyUjNtU0tocnBibUxrNGc3TFVaQWM1?=
 =?utf-8?B?cVR6djhkdXJMSUV4MG1CWXFWay9hNmRLY3RKSldlWE4yNWVIdG4ySDNwODY3?=
 =?utf-8?Q?E/aTWbVGErdhS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmVHTUhWZlN4bk5yZG8xbDNCcCthVkpjUy9TSWJsbHV6UGNmSklVc2x0MU1B?=
 =?utf-8?B?UGVKaDM4aGFFVm1mdFA2WmhJUTljWkp4NGFVRGRIVFlwTTc5cDlOa1ZsakRO?=
 =?utf-8?B?MHR2bFNMaDRNTzlnMWY0OVY2M2JWRW1yeHJlamlFYnJZWW55bmtsZGIvQzht?=
 =?utf-8?B?YjBCOE9pTjU1RzNqSjRMTWJ4ampZdk9xV0ZsQzFIcmFHUklkanQxZ085ZUZj?=
 =?utf-8?B?Q25nM2ZjOGE1YitqYWZ1MmhvaHNsVUJ0NFJmdGtNUW1VbHRWRHhzZ0tjWFk2?=
 =?utf-8?B?S0l0VWtyNy9NbHV1Q1BUeUFLNHVYZU5jS3VwOXl0Z1VKNEJtZWZWQ2dVcCsv?=
 =?utf-8?B?WWQ3RitHRFBQQmFqdjFYUDRNMmJvaU5WWS85NlcxUmtpekJ0MlFZejBOY0VX?=
 =?utf-8?B?QUpPalFTUlh3YVg0RXFtVm1WVTROVmhZYmR2UStYUHFRSFYxaUFRRGZadUlz?=
 =?utf-8?B?L2gyYllsOHFUQTk5emg2aWhKdk1kS2VLRlFjR3hxeGQzVEswNFNBb0FLblI0?=
 =?utf-8?B?Nmlrb2daUWNna3R6NTdsWk1Yb0haZHFtUFk5NzU1cGkzMmNLTEJRcUlJajJ3?=
 =?utf-8?B?QnRTS21uWG1WQlRlaXZHL1JGd1BCVnl1cnFudHloOWgwN2lNTUF1bDlMeDVT?=
 =?utf-8?B?cFZxRy9ueWtGM1o3RzZJUk9vY1U5MG9rUUZNUE0zUEd4MmFNNUZWUDRYcFho?=
 =?utf-8?B?Vk1rVU80MzBaTnFmYmZKc2xxKzNOQ3Q3SlpUNWJUQ2Z5TC9oQnF6dm5HYjEv?=
 =?utf-8?B?SnhlKzhxd0NMZlFCS0k1SE5NaVV6TG1mNmhvbmZxY2FXOXBmY2JpR3NWQ0sy?=
 =?utf-8?B?aUU1YmtJYUVvT0tYbmNWMGNVbHZYRVo4a0s1YWdRekF0cVZxZFhxVG42ZHFI?=
 =?utf-8?B?TWF1RVQrRUlKbS84K2lMTXVXT3FlMXBJa3VXV1VWZTdqSkptdjFDQm05M3d5?=
 =?utf-8?B?d1BJTmtLV21LTS9OWHFZY1J0NUZ6ZlEwZmF4YzBxWHRuTFV4ZlBOYzV2K1Ez?=
 =?utf-8?B?ZDJmZWVnYjM3VjRZRFZ6S0RTYzhMa2hLVlhzRk9aUTc0Y0swNjVkREZ5RnJo?=
 =?utf-8?B?RlA0b1pXTTlqYUJMaFdHSmdNWVkvN2Vmd3NHc0VaeUI1UDB5NWgrbDR3aVpp?=
 =?utf-8?B?d2pFRzl6YWpxTStDeXhOSXVKN29jRkZUeW96ZjVvREhYOVN3RjJPQldvaGVF?=
 =?utf-8?B?VDNqenI0MkdFSkh6N1pYOFNrek9uME9vSkJQd0kweGZ0U0xKbXJHUXJOeFNk?=
 =?utf-8?B?MDhVMkdrRGNHQ3NQK1hQZ1QvSzRWcVozMDdrL1FaWURYOEU4ZzBmbFJ3VzV5?=
 =?utf-8?B?dUF3YzRJNEJOWGZkckZsRU5SN1JxYWVFYkhwcmFNdEMrMHQxbFovSXdsSk5F?=
 =?utf-8?B?K3hUQVNFTjZrK2wxNldMdjdIanhaNGdzekx1UldXODZlUHpNRFRrVWMxS1F5?=
 =?utf-8?B?RElkTDlJb2JudzFHUE9pZzdJcllTbzQ1K3BXZTFHZHRod2VXWnhGMVFsSmJo?=
 =?utf-8?B?aWdTWTNuaCszYjlyQTVlVG1rUnc5ODdyUHJjRnU0MWRaNGFPZkR4UnllQXh1?=
 =?utf-8?B?bktSaW1rbXJBWDdPaWlOVEV6Q1hSVnQyUlVUT3BEWmsxRC9EZUJKTS90eUU5?=
 =?utf-8?B?M2ZJN1ZXRVpwLzJ6QXhXVk5IWTJHTGE3RXBlN3hTbGhqK3Y1eTIzbHg4Y3JF?=
 =?utf-8?B?NjVWOXdSVVAvSVpnbmV6L2dFbFNnbHduZy81dzMyb3QvYWJ5WG9HeHhTVUNH?=
 =?utf-8?B?b2Z4bGFLcXN5K3VsWFFCajV2dVl0QUhFVzJ0amZMT0R4YzNyVEhXaUprTThq?=
 =?utf-8?B?WHVyVUI0S1RPWGQwenVXTU91ZVRqUnA1R2NJTzBsbHVoeGtoSFc3b1pvSkxF?=
 =?utf-8?B?UjNDY0VRRGVVaWQzRGQrTHRxeE1raVljYnR0dU9kV0JGRjBFOVNGUVIzK3I1?=
 =?utf-8?B?NHNVTHdCT05kVXV6ajFpMW40Q3FRNXRrcGhlL1hmTlluR3dhTWd4aVh3U1Vu?=
 =?utf-8?B?SXpvZWlKZnZoUWhKRHliRVQrZDFGU1pscytRaE1oU3B4Ym1HaUl0SThmbEYr?=
 =?utf-8?B?MGRWNlZKcEhCVU9lVy93M2ordXRQVVRGaHdCU0ppM3M5SHFPMXlTWmFmbnRs?=
 =?utf-8?B?bDZPeG0vMFRMK2xJRjVIS2dhdWlieE9wMW5zVzF0SEppZS9mVS9MNThRTm9y?=
 =?utf-8?Q?tQwbbQb3hM+MA3924qI0LHs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	34NDimpvYRTBO+Kk8M+cnlR+rQIjiSai3XTUHXf8I5vegKwDXK1LiMpQ1yGRxtTe7qDgUqcu/PctjvYLe2joFQHMugflhPRokZ+p3iE2o15cb7rrGFF12dIuIgiZxNMjT1lMFbNEkhrrZHfl1O220rL9bggGS+bjVOSXmsWxj304LJFmJQa88UDJBhtrIRT6ZKqZLe3tQww6Ac/WNcjLyWHO36qp4Vv5+QYIaiPRKiBMgUa36HHZGXE2U2yISkEZMjy4jQtyqRGxHBv5hFCQxK7HY2fiHtfiGV35j+SPRGTJlxiQxjP2g9xADxhfpSHrcpXQSvK6JVZ6V1tDHERlCq/hnjogsQykjXWB8K18+NoIGGl2mpZr0d4hB2Y9OGUyYhDAi1kEtp0+OAcdliTZZFYF28umPtrrgAvoI3T3GFN+G7Y3tzK2wyKO/CwMtbZOPz+hFicznLknDDHco6VXxxMOB8qouvt0IpFofeSkB7Ef9DKC1gVdHvXneZc5QF/MsHGYMRkaGxVBCl8mM1KQ/9T42gX+nmJpM+Uudhh49ipjgcF2Tf9B4s4M/OhbKNfZALp7hfOI8y4NqD4knA8N6mKCFz38uuXzx+i9XYseBcY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3128ff-687d-4938-9a6b-08dd411f1113
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 11:13:04.4878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ucf7Cye040Z3UipwCVLCCxdh+rMJg6icowETTF9D1Mj9FXPBEy6c6xhlfePweVj/74yYkidX3cm9QMNpUeQbKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300086
X-Proofpoint-GUID: yzCj1oIra0ou8oGnISyWeWLdLjcDKWFW
X-Proofpoint-ORIG-GUID: yzCj1oIra0ou8oGnISyWeWLdLjcDKWFW

On 29/01/2025 15:33, Kris Van Hees wrote:
> Thank you for rebasing your work on the newest tree.  That will certainly
> help review them and move things forward.
> 
> I would definitely rework the commit message though, because
> 
> 1. DTrace has a specific understanding of what USDT probes are and how they
>    work and stap-based probes do not provide the same functionality.  One
>    example of that you already point ay: they are not discoverable - i.e.
>    they are not registered upon startup which is why you need to refer to
>    them directly by provider name (with embedded pid).  I think you need to
>    be very clear about the distinction.  Using STAPSDT or stapsdt might be
>    a better choice than referring to USDT.
>

sure; I'll use stapsdt.

> 2. I think that the commit message fails to highlight that this support is
>    to make it possible to trace programs (and shared librearies)that have been 
>    built with stap style probes.  I don't think it is in the best interest of
>    DTrace users to build their executables and shared libraries with stap
>    style probes over DTrace USDT probes, especially given the significant
>    advantage that DTrace USDT probes have (see 1. above).
> > 3. While I can see the point of mentioning how to add stapsdt probes to
>    code, it also is a source for confusion and thus is probably better left
>    out.  Since this is a compability feature, surely those wanting to use it
>    already have executables with such probes or know how to create them.
>    By including it here, you also introduce the very unfortunate fact that
>    stapsdt uses DTRACE_PROBE*() macros even though the probes have never really
>    been DTrace compatible, and it is only with your proposed patch now that
>    they could be used in DTrace.  The systemtap project shouldn't have
>    piggy-backed on DTRACE_PROBE*() in the first place because it causes this
>    type of confusion and complications, so I would very much prefer not to
>    highlight that mess with this patch series.
> 
> The stap probe support is very significant because we unfortunately do have to
> live with a world where there are multiple ways that such userspace probes
> have been implemented.  And given that packages are released with probes and
> people may want to trace them makes this addition certainly very worthwhile.
> But I think it should be clear that this is for compatibilty/interoperability
> purposes only.
> 

Sounds good, I'll rework the patches accordingly.

Alan

> 	Kris
> 
> On Wed, Jan 29, 2025 at 02:55:18PM +0000, Alan Maguire wrote:
>> This series adds support (patch 1) for ELF-note defined USDT
>> probes in binaries and libraries; patches 2-4 add tests.
>>
>> Basic pid-specific USDT support is added; i.e. it is necessary
>> to specify the target pid in the provider name such as
>> "example1234" ; future work could add pid wildcarding.
>>
>> ELF note defined probes are defined by including sys/sdt.h
>> from the systemtap-sdt-devel package, and are defined in
>> C programs via
>>
>> DTRACE_PROBEn(provider, probe, [args...])
>>
>> See the tests for concrete examples.
>>
>> For python, go, etc, USDT probes can be added via libstapsdt [1]
>> and associated language-specific bindings.  This allows users
>> of those languages to add USDT probes too.  For example, the
>> following example program adds a "pythonapp" probe "firstProbe"
>> using the python-specific libstapsdt binding:
>>
>> #!/usr/bin/python3
>> from time import sleep
>> import stapsdt
>> provider = stapsdt.Provider("pythonapp")
>> probe = provider.add_probe(
>> "firstProbe", stapsdt.ArgTypes.uint64, stapsdt.ArgTypes.int32)
>> provider.load()
>> while True:
>>     print("Firing probe...")
>>     if probe.fire("My little probe", 42):
>>         print("Probe fired!")
>>     sleep(1)
>>
>> We can then trace this via dtrace:
>>
>> # dtrace -n 'pythonapp503211:::* { printf("args %s, %d\n", copyinstr(arg0), arg1); }'
>>
>> dtrace: description 'pythonapp503211:::* ' matched 1 probe
>> CPU     ID                    FUNCTION:NAME
>>   6 286628                      :firstProbe args My little probe, 42
>>
>> [1] https://github.com/linux-usdt/libstapsdt
>>
>> Alan Maguire (4):
>>   USDT: support ELF-note-defined probes
>>   selftests/usdt: add test for USDT note-defined probe firing, args
>>   selftests/usdt: add test for USDT notes in shared library
>>   selftests/usdt: add test covering different forms of USDT note args
>>
>>  include/dtrace/pid.h                      |  29 ++
>>  libdtrace/dt_cg.c                         |  47 ++
>>  libdtrace/dt_cg.h                         |   1 +
>>  libdtrace/dt_pid.c                        | 466 ++++++++++++++++++++
>>  libdtrace/dt_prov_uprobe.c                |  19 +-
>>  test/unittest/usdt/sdt_notes.h            | 504 ++++++++++++++++++++++
>>  test/unittest/usdt/tst.usdt-notes-args.r  |   2 +
>>  test/unittest/usdt/tst.usdt-notes-args.sh |  51 +++
>>  test/unittest/usdt/tst.usdt-notes-lib.r   |  14 +
>>  test/unittest/usdt/tst.usdt-notes-lib.sh  | 145 +++++++
>>  test/unittest/usdt/tst.usdt-notes.r       |  14 +
>>  test/unittest/usdt/tst.usdt-notes.sh      | 121 ++++++
>>  12 files changed, 1406 insertions(+), 7 deletions(-)
>>  create mode 100644 test/unittest/usdt/sdt_notes.h
>>  create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
>>  create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh
>>  create mode 100644 test/unittest/usdt/tst.usdt-notes-lib.r
>>  create mode 100755 test/unittest/usdt/tst.usdt-notes-lib.sh
>>  create mode 100644 test/unittest/usdt/tst.usdt-notes.r
>>  create mode 100755 test/unittest/usdt/tst.usdt-notes.sh
>>
>> -- 
>> 2.43.5
>>

