Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B05380FD6
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017060; cv=fail; b=EaYk55e4Qk66m9/+VtNYx9pvM1ZMZyNgB7FtpGNITsBQXWGU2UHjeSLUoIvONzt5Ls0+gww/x3yD7i0nCXTd85dcG9z9ZjXpg9wUmqpBEHhaZ75XmeBYYZLcBpwNm/pNyUjp20vvRHX7GLATDpMKsUJcg4XdEUoRDcSF6sW7LsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017060; c=relaxed/simple;
	bh=HUyCVszGJS7Bcpki/1G28oz6GGoB+tE6DeNt/P7qOg0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dhdnjXCmgvBNPpm14qXAYNaczsGY4vq/CBxEfTJiOtxo6agmuzgEFlF8Qs2nm0BqZxZKne0Exksza57fs3WwMGypmzrmw52PIMp+00coVByKcMSiP0k0ocAgfxPx0cwW7gax5ad6WIg9gDSI/ydhKioZE3GdXqqgwR+ZxGjpddU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RDRcMWOY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wsvgwAhp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RDRcMWOY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wsvgwAhp"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6937e2Ek640228
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Dui4xuaisjSKjKjakFrIaSJrtO2UuHZmIiWKDICULx0=; b=
	RDRcMWOYKwzjPJEaP4QrNifDezgAHX+K8IB6g34allFqTuSFrPwlKX89nSqXv7MF
	83b96cyrXtgtK6dYGG4XiINiz2k4fl3hagL0Ng2TXt2fT8vsRchfOF6i6Gk9aKB1
	OBR43+nzjzlFc1Lt4pfEBZMDDN2GVvNTRV2ei33vadTJIdF1UOYMteP/2/gnGt1v
	OBX4HqDJFwKVdwO4FQlwSqGlAJDichiwhUnB+ZEI7Soezsfp2hSqCfrdTJ4CZ0PQ
	l/uaUrWCarn36ISq8TnDOBDgSK5hWDGFwKgS72103r65h5O5FbSFi9G2IZPi0DdZ
	K7aQHIr/dKwJqVN9M+Etmw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2t8rr3m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:44:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938Z08o018507
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:44:17 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r58efxy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:44:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yooPItXo4sAgusBYyq/TDbi6vVyCnHGyDO8bJoqqh8q9kWqYazcMgPu29H2VoHe1JPLoLGGV8dlyAQ959CquqJixMTr467yOpBORQUXLnses+zShJV6quTs65mElIQ0B6gzj5sTAu+MJ+1O+2ZiqyRRIzOE5VqG8pUjAKmHQaQQW8eHphTyopt8qN+YjgoXngqR0l4CQzuU1OfoMTZb4/6fRGWxtZCYYz1E7fOzIum2Hn9gcoTVW9/FhLIg4rgNYWQ8wR/VCkad0w53XvIdLbYnaMwlMjF6ZGxcrO234pAdr7+UbDmmVYlJKCWj5AKYgWo4l38NmeFStQOyb7UJCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dui4xuaisjSKjKjakFrIaSJrtO2UuHZmIiWKDICULx0=;
 b=Wfmgl30XnFHRGDfhVnx0eT9o5jCRZenrIPcJpAp7L0zy9Zil1JjQV/27wIEwVc6iGWSkucALDsH+8sF+M4xcNAlaiiUoKFmkr6i9qNK/C5LvxzfLNCxg4AEGDd15bXGeuN/0qXFevnG+tiE8I1XHbe0V//61iCb/uZywfHf/h3j7l4+AyhjmQthR1EWRjcrnIAGoRfd7vQDskKrPkWyA+YT0QMRGCRvFsI/9NP+JVXsFNhU3lHW7C7Jh3J8DY0ZF4cy99d3xkv8Dn/OeixMghvtIxei0G/a5xUYtevfwaBYfTqC0CGNqAEjEpRXTanmKNCxIxXaEa9JjCwtyK56Vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dui4xuaisjSKjKjakFrIaSJrtO2UuHZmIiWKDICULx0=;
 b=wsvgwAhp9Q27cBECatEDIzer2Pa1n9Lkoxdd1mPNpijQbXrPna5Iw13by61BYI/HdUL9KHKJ4e98hMWl6lE6d4xC0wO9JF2QSAqBLPxe7gpXSoZxoeAsYq5Gvf98cjdIa3eNNXOJRq+84xiM3jSGU3SMVcOSGUXoP/K/pXMgsDQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:44:14 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:44:14 +0000
Message-ID: <9a74a266-e59e-42fe-9966-d6297f9d4bd9@oracle.com>
Date: Sat, 3 Oct 2026 02:44:11 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/2] test: Fix path to sed
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <4c9c500d983e53f187539a7c8314e36d@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <4c9c500d983e53f187539a7c8314e36d@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:803:1::16) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 5080b13f-794a-4f76-300e-08df212a80a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+IElplh+hpJj6EhNcyMytHjNt0mMRuVVrYfqPYBg/oCZcyO30KJwd0KmImwfSviryuv5NjkZY5PejR85HqBaEXTt2vwOPyekXMAokX4xFM6HSQedgjKiWSTmZbkzH6yOp3I/W8gWhlKO+yfv7uO4bmDI9XYcku3WggRKqOuLPYxcpafp/l6lHYxVLSbyMOxCTtClNR1YD/y6T7E8lPZf1lywwkwQoUfwjECTmkXWj7HwDMXFffEVZVax6M/KztulJzymw00d8N0kWvC/Rx8BRjtv0aWY7vC9rnD3vNWjiYco64hGwxuIIQrOewJ7aTDWN4qcOLpD700KDRLiarnlNdxGCY+aPrmCW43M0MdXoZAeURfZroG4AmzRiHxiUkDPvDzeHClqa0MwCNF89v3bZBy7IADAPZDrhs25/EmN2Z+ML4iYo21kRqbBG2x+euarHtMupg2ajpslowI7EGGvCx+ZkuvO1FoDulSR8Pmgdaedxt7V96pZaK49SWS9KEDCuNQtNFwh0lC2P6TZQb9KItu9s0bTFPWN4Fg7xsy83sbtn+07m5y84Lq2CV/xB+2jTOCkcBI+yytNjC+IzSyL4Z0dpByuaEj4QjmGvHLIwduxi5XpDbArvvUkUS3nycvRZxw/QOLEujfXYIvGdlySCubcBg/IDbCjPvN6UWbjDj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3VMNFFuLzVXWnJ5S0FrL25MbkJyMGRCZnVaTHJxSjNTb21uT3B0Nk5aTkho?=
 =?utf-8?B?dUxQNkJGWVpka3NhNVd3bEFYNWZ0NE0yN3NqS04wQ2pVZ0hScElrbjBGc2Fn?=
 =?utf-8?B?Z3ppNmtZeVNkK1plTmgwZFhMenRRWTBzUlJYNG9iOTJHZzNTY3NHUzh2aFJH?=
 =?utf-8?B?MDlrZ2Rac0Z3S3ppbmtDdUxRdkxDaDRLNkV3Yk1kdmxNNlBMOG5PM2hLVy9U?=
 =?utf-8?B?cGtSOGFBaEdhaU9pVVBWa05pUW9rWlJHRit5V2k3NzhJSUZsSWM0NnZhbTB6?=
 =?utf-8?B?WU5ldzRNdytxL05ua1N4SG9yVC9RZmx0MmhxYTVocnlVdmJOQ0J4RG4wZWE3?=
 =?utf-8?B?VDJMelNqUUhJMG8rWDNKM1BCRStCZWdmUGFKUUh4ZVo1ai9ualNrK01Tbm0x?=
 =?utf-8?B?S3JUNHE1SHYyWERwNk1Uc0NHekU4YmZnM0NNY2ZGK2NjWFVKdE1QZzdCTW8x?=
 =?utf-8?B?U1pLU0JMeUk3RmlHR2p5TTk3a2JBWTRSOWFFeWNYdzBmWGp0b2FhWEpXaG1G?=
 =?utf-8?B?V3lCTTdnaVRrM2VRR3FlbU55Zk15bThvenhvbkl0NG81TDJVV3dxbHhLSUc0?=
 =?utf-8?B?M3ovTEpFME9YYnpyWEhmMUlpMStIUlJuUENLTHVwdFEwUGRPaXIyN0hJbHhu?=
 =?utf-8?B?a2lPcllvTGNIZEJ5ZmNsK1dmQk5kUVl6SmdxNWNRMGZpeTNQejVyQ29uWmtB?=
 =?utf-8?B?VE1hcGo0M05wWkNma2JZYnk2OFgxVjZqN3BweWhtb004UktHL3ZPNFgwSGJI?=
 =?utf-8?B?SFFXRlhRZFFWUjdpNng2bUN0U1NhSDY5WGtIZEc3MGt4T0pZRUdrOU0ybWpJ?=
 =?utf-8?B?WWtGRWtRN0FXU1VPckxjRUgxMEduVWx1MjhxczNPQzBwSlZBY1YxMVFPUks4?=
 =?utf-8?B?a1gzallMcnZzK2JYdGErcHEvQXhjSEtONkJqZ2xEUDg0U3JHZ05uRENHVFV6?=
 =?utf-8?B?RjNjSDNmOTNmNm9pQjRDRG9TRTJxbmZnV1FMQW5PNEtSd2RQcUpiMnBnY2lC?=
 =?utf-8?B?TjlxdGxSWEI2NlpKNzdEZVh2RW5leEFJeFhzTThqaEI4cmZWcmtJZTRFV2lW?=
 =?utf-8?B?bjJLUUlLNU1YaGlkdGVKUEFSVVdkK1dyWi83ZFd3U2xxeFlReFZrVVBqclVS?=
 =?utf-8?B?bVU5QU9laUw2dlN4cFVOR0h6L2JoZC9CUzQwRnpHM2ZsMVNOdllXdXlVckJj?=
 =?utf-8?B?MXdONkw1NzR6cDZNT1hKRUowZHdITXhRQkQydXk5NDZJTTNBelZ5VCtST0ho?=
 =?utf-8?B?WitXRERyWloxcUpySHkyU1BiVVMyN1J5Tk5EWDJGVnVKZlR0TjQyeDhNVmFi?=
 =?utf-8?B?eTRhUkZjUGE0MFdYb1JNTVk4Nm9zV3FNb2JSdlNBcldIY0pvbkdNWDRLSGZk?=
 =?utf-8?B?S1RoZS9SUzNLRFYyMEw5OUZUVzBlSFdycUFKRUV5Y2w1MVBMdjlIcVdoclF2?=
 =?utf-8?B?SW4zTVBjWk9qSHhTWE14cG8wOVJNUkhQQkRNNTRPM2x5MkxRNzlEbHNuTUNt?=
 =?utf-8?B?dlVZRGM2ZnN3d3BqTlJnZWlMN0dnOWNDSWJVYnB0b3RxQjJIUUFCOW9tM2pM?=
 =?utf-8?B?MlVKUy9tTFVtVUNEbS9pdlRaenkxWGN3azZwS3pMWFNtajErdVRpdmZaalV4?=
 =?utf-8?B?MjBCN0NqcFErMTE0RmorQWI4QmVCSll2L2JKRmZUM3JoUlY2aHNaVW5YcDhZ?=
 =?utf-8?B?Uk51TkJrRmtzUVZ3d0FVbGl5Mkp0WG8vYUNrQThQUyt5Y3p5N1dRc3pqSXVQ?=
 =?utf-8?B?QlBWN3h1RVYza0xwRmZwdEJqUERPSVQ4M0VXSDhXeU5Wb0s4K0xSQVNPcUt2?=
 =?utf-8?B?Zldwa0dLNktRblkwZlk3ZVV6c3I3eUZTWTZRWUhKZWNKUUNjcHVxTHhpaWJx?=
 =?utf-8?B?T3JFZjNTWGpiNm90S1lCb0JTdktJbFllTDU2YnNjT05DQ0hqZFVQYlAxdjEw?=
 =?utf-8?B?TExHRXlWR0luZkxJNXpNVHg1YXRRK1E0dFpnYmllVk1qTW9HSU40a1FqNWcz?=
 =?utf-8?B?elNqR3RlK0JrNS9OOHJVZTFrZ1BhREVzMVdIMWdETW1tV3V0UTE3K25SaWwx?=
 =?utf-8?B?cDA4cFRhYzZtUDIzQldDZlJRT3dSZGZMKzBmZWdjanZNTkJnRHZoWnJkRWpU?=
 =?utf-8?B?RTV1elJnN2EreFEyWVFRcy9CdjlWV3cyL2x6UmhGcS9uRDU1VU51Y2VQREg3?=
 =?utf-8?B?cTEwczYvaEY1SUdzZGt6Q1VoWXpyY1NtdlFEampWaUU1RU9EeTB1K09KbGhm?=
 =?utf-8?B?dGJMUm5MMVcrOGhLbktsZzNIbjhEZ3B5VDcyU0hQS2UrUUx3bHFXRnkzNE5S?=
 =?utf-8?B?YjJBWDYwSkVrS3B2U0lJdzI0T0h6SGNJd0hmYVF2NG9lRG5yS0xqQT09?=
X-Exchange-RoutingPolicyChecked:
	JCUD43/61FON3tC9jGvQYd89SKQjRjs/swoIbhdLI4p0D+WHn0RMmYYAxYPAd1wd8gXl53swOOjZJK7J77u5P43CGr+3fe/D4O7Q+fUYgQp4xTvuZrY7duxzda/Lao+kTW2q37VLsmu7qQlJN7NRnh53c614wJK34J8/kU5GgR4KJZZGq7ezEZPtCdL8ulhhYuBaEpEYSZPD+gmpIRnA3OUotkFUHh0P/+XHREPcV6+8sgHII4UCAVtLCXTXsPAv6U3kohjTQKzdAb+FVr+OwoZmZhvWsqG7Vm1HCFsf8xsDwaY6v7RMZr7pSnOHjRS7A7rfQF0aDK2yOz89D9jhjg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ndHSsYffbEgA9Z8AMrosxbQK0WqADOb4y7agH5gItM04HQZ0G0a+ELvDf5Mhe7gjzPB0qrwrGCO1XPqT6FpHE2pFG7BQ9cwiNy/8CJ1T7Euv5wzfbDUOv6KHSQal9uI25kBjoiPtCfW4skDgMPfERz5ejwLuDEFejc52UfCDJCo98J4uNi4HH1UzMXJMre9rtFH6fDsnc3VnMxIwfXlw3R1vh+etpb9odrGcU/l60wgMOqtYeUXbo7bcNgMzvO6sii8x3FvMSCnHXbOBhd2k504o8UQhpHn7d/J/bLrndnv9gUyEGMhgFrKzL0p4z+t0FS10hxkkeNifQNR/J4qB5IRWNBksMMDYUPzDn+K2zdabc7xikiSfdVCgcmfoc5OCTVk4VpXQeSxbPAMgQ+OKryTqd7Az+x1r28RJWjk3BNgZbqSrZ7uOsh0d3R81Ipxqzvzs9uKjS1XctLSKfhCEDhgTug22ilY9/hq35greH0AT4CNURePwa9QBzHBamqM5XMQgEejEQuJkrQ967LCihk+4k1fQt0rNCgQgEeiJEMRBOKbS4aHrx8+OPCAuipvDQVPZo5+YdohzR8MmlM3H9IkpcIO4aW05zxc1jVudJlE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5080b13f-794a-4f76-300e-08df212a80a5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:44:14.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U5lHfD937Zjr+eaR/2WnXMVTyeY/wCTHDnQtOsnt01V+3b9CBwAKY7dp1vChfyADnIx/7vswgEh2HXe7ugs4aEhGI8JxvHevBGZBMNYEDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfXwwnV8TeSd1U0
 tM2OC8tyE1J2zO7r3PH0wOdfVhdUKCEsuEYynP1DJz7q5qlUJ9HybBhbFaFle7EyNdFfMQAjQ8P
 Z6fmA955Lcfh+hkX00fdl0xNqFOxSrkNXQthbN0X3iOaBeHu2b2t
X-Proofpoint-ORIG-GUID: 8EeGKf299u9ZtSx-NTz98XemHbanSmCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfXy3VMnEpa4GxV
 YFe6jOwP0waDtpH8z0MdPQ406p3CdzKDLN8b9iZhqP34IVIvnI1h5ggF4HHZR7M5+2c3ilV6dct
 x7FcGggttsqkVULAvorbBiYWHfymFEdCw24yf4vvxrHXVOCUi0JvBOEqLkkkUoSxtWE9EltDCJ8
 HltMNFhFrezEu4rPVwQOX/18j1ET5cDRrz5k+z1txF3j/dT4iwiV99t4ivnuJel6QqlM3oPZ8yC
 JIvKlgqElAk4GKud12ByZNvTJeyPIP2CQWlm30aci2/c3rqp6ngJjV6TxCvXk6oF1T+teQ0R6Fn
 gj5GscFT1MsMEe6Rv+q6VH6PDQRcNDsKnY6ZRnPw0mmqyBJPDff8y0CiJkOBCbloGdxXt2fMRPx
 ocfGTPEJB8pAjCG0qbItPPUaB5OCUAOQkTrQafRvp09/En/ts42HNY9eGFTd2tHbhe8q7LW2Vh4
 e8qE6bSX5FguFJ8SYpQ==
X-Authority-Analysis: v=2.4 cv=Ys2a1IYX c=1 sm=1 tr=0 ts=6ac0c061 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=KtWhpml6NpAU_BQSLVkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8EeGKf299u9ZtSx-NTz98XemHbanSmCw

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 2:53 PM, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  test/internals/libproc/err.bad_sh_link.r.p | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/internals/libproc/err.bad_sh_link.r.p b/test/internals/libproc/err.bad_sh_link.r.p
> index 6eaa5447..25c87dfe 100755
> --- a/test/internals/libproc/err.bad_sh_link.r.p
> +++ b/test/internals/libproc/err.bad_sh_link.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/sed -Ef
> +#!/bin/sed -Ef
>  # Fix up DEBUG lines
>  s/DEBUG [0-9]+:/DEBUG:/
>  s/, [0-9]+\]/, NNN]/
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

