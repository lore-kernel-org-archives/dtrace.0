Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3051CD3F
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466778; cv=fail; b=fnSiKUGQYc+pofUCr9XEADqq+dPmO1juqr0mVJ0bL82iA6lsQnk+XHbnIGEcRZ5zKH2m+ol+rSj4yIXcx835pfLvVQ1FZdMpw6Mz1MNDb3BoQhNGJbUGtmycvHzGKLlP2zskUNE0jQb9BDl0QRgq7NSxStIMlNe648lyYJeL/Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466778; c=relaxed/simple;
	bh=T8+zvp/pE7mGTlkdFV7wgrj7JkdGU8qcaa/5OxTCApc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LppLkLZ6nunEomH4Q9A6eotpLo+f4Nl68/7NRLfDOlRyyvxfoablSBLQjfxHrGCaxKxfKtuEmfZQ6I2amyrlV6v1TANzN70KylGoUrYTatCIRDNPyNdHVh9zP1mHMOwnNTQlVmdPnd7sRu7DPxt2YiHR+ZXtUmME/uVLYulG8Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fdrbUVsx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uATQxooU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fdrbUVsx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uATQxooU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTdA006662
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=9IeorlLlnWiaTc
	y6kS6B/oujByW1psLLGQfbkKwgyGs=; b=fdrbUVsxehFtbM4Ipv6yxIA+jlFzGN
	ig+3tvJBPjQ0qqevIG931sGUCSsoN95AUCL0aCA5cbyMiu0yUF11EC4Fz6Zl+JbN
	JB+IZt5RiEpkkqGITmjuMtivM44G1Kx95Hx57vDvbfPnyBaFMO6UJrsk6lnOTLdC
	uCDZUz07ugIQ3V3R9QTA6YDv10BXpbEEPPQ3F1WJFZiRIHZgOLvE1rpAS6jIyeYS
	0UqCBPxGTZHYEzxpdMa8ORmC0RnHhEVhSvIMRHqns77TNtd9GcJB2toFUhJ4/aXE
	7dw57bofXDxHSHoVj3h7LR4oqyQaxwVRmR23C1Q+WwrvU3R0Om5UsDlw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8j5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3702g017832
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29vb76-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3JqHT2BLuKQPRhZhnLygtK+ri8UfgLurSPHrU6pUNx5g/fd8frgIJBrLGO7EYCUkA4eRbXLvVEhoxaZOwBEYzrt3Fl81SPFwI/cer5rRL07IEDB7smLtE3V+1MQ9vCm5W6HKCHaaqmG9jcuMw5lbk6+0pSm3T0pEJsqjvZnizGZcdAg1mb8Si+VJ7yBznKRk0yHochVzOJ5WHsmz7ThzVdZM6+v63AEskgpwh8UZZSVV/BQPvKtgjY4s2q+aFqIIVgpwY5LDEmPFkT7gnVFXOOBAh0EBBSnEjU29pc6O3sWvNWLU0dVA96MrXUhELZnvjObDRUZCEyqaook6yi4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IeorlLlnWiaTcy6kS6B/oujByW1psLLGQfbkKwgyGs=;
 b=gYWoDOVWNhOAtjcB3hGFmdj+tMPv4c5hw/mcrXMLksFbBKARTGVgeg4gPBJQNbUhb0yjIgeBjNIF4rF2sdyYkxHDQ4bhSZCnbuQUhuDhPwG8qQHV68Lkyf3MnegNEei5fKgHeIhi7Ak8BzlqFdxlmSL6o7AcjPP9FwQpDg132o1RYnd0gvDqCusonlQUvMwWMRVtKv3cJP2Ts6YE94cb6foBmi1tXDDvvRBmIEaJ5u7NNiqDD7HY9XhMKI5gung7/5MjNC2khPs5dfLflteURkpxU528zN4cv+/OF9Cp5pAlfISO9jSs+KvFVv5/SvqBVWtsr/tMzu79KwuFEZfKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IeorlLlnWiaTcy6kS6B/oujByW1psLLGQfbkKwgyGs=;
 b=uATQxooU2Mok+tRwXQLL9Y49J67559aMosvZJc6LbKpHv9QQU6rh/nnDkWq/FG8+TVaSAtPsm/Of2HIcjwSoFZQt+eZ0ZLIxGk9XllQqnGHFHj216RnAnW8T9XRRBrlyAtQZhC9Q3fPs1HMyNO5DJqVElJw9R0m+OqG14gwp+9A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 31/38] Fix dt_pebs_init() call
Date: Thu, 27 Jun 2024 01:38:57 -0400
Message-Id: <20240627053904.21996-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 1978a7e0-fd77-4c96-025b-08dc966b849b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?frJkmbMM9jznPhR7EC0Y+vRAHVrQK1Kaj75XAiIP15X4TTLt4i2UgmhF7pjr?=
 =?us-ascii?Q?xq3Ip8a0JKjQxzdS15RvostQ59pZ38UQt42JYL75CXWnjdJ3aIJ/dQwvP6iw?=
 =?us-ascii?Q?dXZkzJkkpvURZsWYH0cugOCERNFnhzJMxG3eCPq7Ub5VD+1ilJdIyDmmm3n0?=
 =?us-ascii?Q?tpnLtSDoACqcAw7HyHkd31aXGBFWmXI6let5EGr2dWVvJ97LRTKTug3aup+u?=
 =?us-ascii?Q?xufZBynLsLU6wsCoD1ziwafmsIvuDSfI62SPVy0S9CzM9tgAOsqS8WMOJgOg?=
 =?us-ascii?Q?5RfGHjOZIuGzWJ5ijhP6V+7ZeM1kCZ7cSScQGnMouXVt6L7w3vs4zQXl+iEb?=
 =?us-ascii?Q?+4Lz6gsnDP6uElXs9pLkWmqr8e9gX+ZVCCx3MUarFP7jJnnbgnGMyatovXKl?=
 =?us-ascii?Q?r4LIw7U3rKGjcn3x40tPe+f3BBdmS6fE2U7jZLS8YtzWF+99/blXZYvDwkJF?=
 =?us-ascii?Q?0bK8nY/DjASqXU9FB87LuCGaOPMvu9aLKu+u57JRUSxos/aMQpp9lZy1NqPU?=
 =?us-ascii?Q?I/BbIV003gPvxECjXpuAkkqFQH0aafdH3XnyCFzs+JctbZjCVZudv8ZEX9qY?=
 =?us-ascii?Q?G8YhKaIAoTLqLgfVHwfYIDSM1+dVbxnsZrcTQQhYfM10eat/DEsewp5ymVit?=
 =?us-ascii?Q?+rrnoKzw9vPvNwwHdcdeFgD/mw6nW8Ss/IpUPyruuqMcNxjyx2lRFY+b+64L?=
 =?us-ascii?Q?NMA0JN5DPt+ks7LmANdPAikQ3HOAa/CNedl8CcvNwzr1iKC0tjjwmJ8d7NSv?=
 =?us-ascii?Q?FOMNzGpOc4MRtW/8CLcl2TYAVwRX43SJad5yORb3kV813Ah19OxCfJAYvCC2?=
 =?us-ascii?Q?YT4CtGE5v2kRHeIPBBgy7pHaggvXXmBrYiCjtE3JsFcp0ErfJbm5XUbz0j7X?=
 =?us-ascii?Q?U6w3h9SFWYySMshmnehuO6r9MwJ2cs53/EbxdYZdHviR/71Vcg80cx00Ipdv?=
 =?us-ascii?Q?QJQF3PlgVkRqEoMJK45KJkWfDe5wbNgsdCsLcEA+nuMNhqHvoqJjvmE5KpQG?=
 =?us-ascii?Q?CaaHnSHkrMB2k8TAn3EEeX2WbVh937YxgAPnsKfF0p1C0AEYGoVCgxpDd0uN?=
 =?us-ascii?Q?PXZueVIJkGkJfaXyUvPWrgiTeSbmBqZZbPE7YlFzeqCdWe6TAVQeRRmo875G?=
 =?us-ascii?Q?YQAJZYN2vxAr+7WqA1yZdJCod+3hlA3JFk9Q/VHw6Ayl9fFm7ZBNbwFegHjr?=
 =?us-ascii?Q?RbADbDzy2ilmT/dQq1N7Cupn5HbYDmsjaqAh9DABSL8LJADZ2Z7GHs2txjD1?=
 =?us-ascii?Q?Y+lsFWyL645B/OcsJddR/UMgn2vmhQcJc/fs3rWjRwd9SgiMpcVrQOM4BKVU?=
 =?us-ascii?Q?pNLNqpsVPKQuHrWzZREgUlUuROgd4WQhZq0nGUaNsu/U2Ay1+7eUfGpdSvou?=
 =?us-ascii?Q?60q9Go4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D5txsz5q7eEFuu14/ftdTeq0emkINHUQeITuG259D44NRh9UagAudIXErJKZ?=
 =?us-ascii?Q?qVHuhXAAvlfgoxqQHhzpWy8wZTcMYEf8aJO+QcvADXrWjmcGYtdksRB0Roei?=
 =?us-ascii?Q?B+wtrB5bQCiX2jYISKG/+EZuhs9LqAZ2TqT32KaHoXX605hJaty8VcSXnbpO?=
 =?us-ascii?Q?PYhBDBhcs+XUZwjayDNTEFy+HENwjJifzohLfwuxxUo17EIdqKPiorJqi5yl?=
 =?us-ascii?Q?Vjh4KrPkKXeS6LH7xwRPoIU7zzgmRsSEygr21m6HOdP5L6gtZkFSfPW+ixIN?=
 =?us-ascii?Q?mgz+8Wmk4kA5L+O79XkIUuXXhNzbHIXAY60O3prLqqjm9MWwikXc7Ime6li6?=
 =?us-ascii?Q?PPWQs3LoDVbiirAj1mxBUTVEW4FIXcOI4lp29ZdLeKaziDrsr2FSD1itzL2t?=
 =?us-ascii?Q?8vUnLrcqOxbfzLo7wwOiQioeRBpv/SEhXlonxQoIgmtmvANQ9SgXnWpRohor?=
 =?us-ascii?Q?JhAiwtxPutJo++UlIXJusvE8OjqjMOsI7DTXJ2ixoe/qWG3uhlHFriLkGy3Z?=
 =?us-ascii?Q?2Btbl+0wvOEi6nOv87PU0udKlCqtDQ5gavzbrJQUDeDnwRfy8Mgt7yUsLn+i?=
 =?us-ascii?Q?xHjWV+HskjNTtVgSXHeD/7+GgWQ+XEkSjoNoihIA2a5WCqvQysi7+gyli7um?=
 =?us-ascii?Q?HPTmdecwd/v//0sMtqVy6a/1tK1ItKf5a49hD9vASHKQAtmloRgETNtWoj4y?=
 =?us-ascii?Q?EaxNlyJw7XLUtAkHIH/GgKmv+zrauood6+vJYFjcryEHcIxKmPHxKXF2oKYH?=
 =?us-ascii?Q?MJjOYZrC2wYkXbmdaSCUbzf++iAoGiyX+ccVJ3LjeJxuVnxVjumTn+IXKXct?=
 =?us-ascii?Q?eSilMYBx8X5z/P+EOLrGTo8BcmPtGMKW/GCPzZ+n2AD1T58BQDOXNp3RSqv3?=
 =?us-ascii?Q?dC/p1heajN4EDazbxmf9mELjme/kcUh1PL53sBCb/diBHmJ4E4WlzVPYL3ms?=
 =?us-ascii?Q?C7pcGfGASrQ9r9i4vVZrOuFS+saQfjzktQV/o1YManuwH0YxwZU/XIOiEGrm?=
 =?us-ascii?Q?0FILNhdPF2JsARMbhC/ITncCheR6wUgJ+M+TlU516kifWCl5lOxkcrsUZxtU?=
 =?us-ascii?Q?dNXxdoiuEQlfElx5fOK6NWLk7gZ4Bktw0my2/d14hRr73REgB3nHA9ntI0fH?=
 =?us-ascii?Q?uSoBenclfEYiZZTpbAviD0se5r03H8sq9A/PQS2qo/WTbk5wv9L82joFlFT3?=
 =?us-ascii?Q?duc1rBav1Q6qaG1iqHnuG1e7rWMx3HBtIKQca4tC/3O9VUcbK87jhZGfsFsY?=
 =?us-ascii?Q?7qlJvaNvsALMhRbqzv+boK4YiXjSP7BJ+Rp36a2byD7NVjZpBF5HToY6Pbnp?=
 =?us-ascii?Q?9WH81x9jJci9G0RO2K7mziIxE3YRj8ohyKYmgLd0m5tol0BzU6/5VsS0wTuo?=
 =?us-ascii?Q?gF4CuFIXfHaRSzt0D9YSoxEbyuRLGf0HHtEIxY1dhdzW5RY70VMXD/IYt3Oe?=
 =?us-ascii?Q?cc9eKlK19jwDYkQph+WcSZOiyrD+L4gaC7Hb/n2/dsNVUN5ffDxx5l32OLUi?=
 =?us-ascii?Q?hsKf1oGgHPyoHN1kE/Pe06k4O+A0qp6CUhlGuVCwoeLDbLmE8dc7sZB8aYx5?=
 =?us-ascii?Q?6MKH3F7xR/Y8VwWO4W/7wRCnScsrTxO/5Iuv8O5J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YNtA5w//zsjLsA1mxV9eFsiFk1O8T/zvhRytcTq6jlaakfMUnK8cdgjyPsmsznIHQdrekT0Od/kOx7syZvYVJXmGvALYZAmF8g0F2w372EDURoHz3PDFo+ED9rF7QBgr4v8ngJY8SXmjWMzQtdMnKkNJZdp5wzVN4CVbz7XRPIFOpxEbgnMqkkv17TWIT9lcuCN9zCdwPdagbAzdtp8if7F+xMyudcAHYpQ5okJUwjTz8TIO+eVoeRf9tg07zSwSfG3mNIuQdbyXCfeHG2XAAXmhNZzRMpdWA+T0Ua0vq/hdhyKxqaqJ4dUzbtSpI5RzFG2Qh3cg0lYgmjcyi2RfQzwIVxwF4brba8oNDqebCD8JtCdJ3EruvTusXw6NJTyWjQj6VG17YnId+6IIfHB9rmeD9WUjC/Qt3wu4lZ4Go0HJun0WkLsmN5ag6ebx7iDCuPTOjx0JhL7k0FEPH4YtN0Vx4dObEUqmkllvaxqlVHbarA6yXY5qSV+KQQ+slrrex4ekHdX9O6n0EVfIeAjxfj2/dQfUlKyEY3YlfXVrn0VrponI2H8YiYJYMYwOMcn7WnMhcxoOOOtvFu/geP8F9IdML5x0fCS7epgAe7qKqR8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1978a7e0-fd77-4c96-025b-08dc966b849b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:31.2387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb/HDIhSF/IZlh7ZYyDXKMWxpk5jvOD/oKMSigE6kDB1GYL7BqddkvmS2pLaih5LoQkm7BQzHWU5Ur/9J53mPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: ItdPP3vBbUhTN1aywMaUyT_t-Jdt1zfU
X-Proofpoint-ORIG-GUID: ItdPP3vBbUhTN1aywMaUyT_t-Jdt1zfU

From: Eugene Loh <eugene.loh@oracle.com>

The function had a few issues, mainly with its comments,
ranging from typos to incorrect descriptions of behavior.

The function has only one caller.  The enforcement of a
size minimum was problematic in a number of respects:
- it was missing 4 bytes
- it was enforcing the minimum before the size was
    increased by the caller
- it was checking dt_pebs_init()==-1,
    missing errors with other negative return values

So change the function to accept a minimum and change its
return values.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_peb.c                          | 27 ++++++++++-----------
 libdtrace/dt_peb.h                          |  2 +-
 libdtrace/dt_work.c                         | 15 +++++++-----
 test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
 test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
 test/unittest/options/tst.b.d               | 22 +++++++++--------
 test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
 7 files changed, 71 insertions(+), 61 deletions(-)

diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
index 5268f089..4983ba91 100644
--- a/libdtrace/dt_peb.c
+++ b/libdtrace/dt_peb.c
@@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
 }
 
 /*
- * Initialize the perf event buffers (one per online CPU).  Each buffer will
- * the given number of pages (i.e. the total size of each buffer will be
- * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
- * so the kernel can write to it, and its representative file descriptor is
- * recorded in the 'buffers' BPF map so that BPF code knows where to write
- * trace data for a specific CPU.
+ * Initialize the perf event buffers, one per online CPU.  Each buffer will
+ * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
+ * memory so the kernel can write to it.  The file descriptor is recorded in
+ * the 'buffers' BPF map and added to the event polling file descriptor.
  *
- * An event polling file descriptor is created as well, and it is configured to
- * monitor all perf event buffers at once.  This file descriptor is returned
- * upon success..  Failure is indicated with a -1 return value.
+ * The return value indicates success (0) or failure (-1).
  */
-int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
+int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
 {
 	int		i;
 	int		mapfd;
@@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
 		fprintf(stderr, "bufsize increased to %lu\n",
 			num_pages * getpagesize());
 
+	if (num_pages * getpagesize() < bufsizemin)
+		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
+
 	/*
 	 * Determine the fd for the 'buffers' BPF map.
 	 */
 	idp = dt_dlib_get_map(dtp, "buffers");
 	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
-		return -ENOENT;
+		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
 
 	mapfd = idp->di_id;
 
@@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
 	 */
 	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
 	if (dtp->dt_pebset == NULL)
-		return -ENOMEM;
+		return dt_set_errno(dtp, EDT_NOMEM);
 
 	/*
 	 * Allocate the per-CPU perf event buffers.
@@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
 			 sizeof(struct dt_peb));
 	if (pebs == NULL) {
 		dt_free(dtp, dtp->dt_pebset);
-		return -ENOMEM;
+		return dt_set_errno(dtp, EDT_NOMEM);
 	}
 
 	dtp->dt_pebset->pebs = pebs;
@@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
 fail:
 	dt_pebs_exit(dtp);
 
-	return -1;
+	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
 }
diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
index e0f408f2..9ad23252 100644
--- a/libdtrace/dt_peb.h
+++ b/libdtrace/dt_peb.h
@@ -43,7 +43,7 @@ typedef struct dt_pebset {
 } dt_pebset_t;
 
 extern void dt_pebs_exit(dtrace_hdl_t *);
-extern int dt_pebs_init(dtrace_hdl_t *, size_t);
+extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
 
 #ifdef	__cplusplus
 }
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 69a86358..7a0eb1da 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 		return dt_set_errno(dtp, errno);
 
 	/*
-	 * We need enough space for the pref_event_header, a 32-bit size, a
+	 * We need enough space for the perf_event_header, a 32-bit size, a
 	 * 4-byte gap, and the largest trace data record we may be writing to
 	 * the buffer.  In other words, the buffer needs to be large enough to
 	 * hold at least one perf-encapsulated trace data record.
+	 *
+	 * While dt_pebs_init() rounds the requested size up, size==0 is a
+	 * special case.
 	 */
 	dtrace_getopt(dtp, "bufsize", &size);
-	if (size == 0 ||
-	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
-		   dtp->dt_maxreclen)
+	if (size == 0)
 		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
-	if (dt_pebs_init(dtp, size) == -1)
-		return dt_set_errno(dtp, EDT_NOMEM);
+	if (dt_pebs_init(dtp, size,
+			 sizeof(struct perf_event_header) + sizeof(uint32_t)
+			 + 4 + dtp->dt_maxreclen) == -1)
+		return -1;
 
 	/*
 	 * We must initialize the aggregation consumer handling before we
diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
index bb77e37c..f62155dd 100644
--- a/test/unittest/options/err.b-too-low.d
+++ b/test/unittest/options/err.b-too-low.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,19 +12,21 @@
  */
 
 /*
- * We use a buffer size of 59 because that should be just too small to hold the
- * trace records generated in this script:
- *	- perf_event_header (40 bytes)
- *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ * We need over 4k bytes for the 4 string trace records generated in this script
+ * plus some meta data.
+ * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
+ * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
  */
-/* @@runtest-opts: -b59 */
+/* @@runtest-opts: -b4096 */
+
+#pragma D option strsize=1024
 
 BEGIN
 {
+	trace("abc");
+	trace("def");
+	trace("ghi");
+	trace("jkl");
 	exit(0);
 }
 
diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
index bbbdb5c5..25efdf72 100644
--- a/test/unittest/options/err.bufsize-too-low.d
+++ b/test/unittest/options/err.bufsize-too-low.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,19 +12,21 @@
  */
 
 /*
- * We use a buffer size of 59 because that should be just too small to hold the
- * trace records generated in this script:
- *	- perf_event_header (40 bytes)
- *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ * We need over 4k bytes for the 4 string trace records generated in this script
+ * plus some meta data.
+ * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
+ * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
  */
-/* @@runtest-opts: -xbufsize=59 */
+/* @@runtest-opts: -xbufsize=4096 */
+
+#pragma D option strsize=1024
 
 BEGIN
 {
+	trace("abc");
+	trace("def");
+	trace("ghi");
+	trace("jkl");
 	exit(0);
 }
 
diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
index 57fa030d..3bf08edc 100644
--- a/test/unittest/options/tst.b.d
+++ b/test/unittest/options/tst.b.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,19 +12,21 @@
  */
 
 /*
- * We use a buffer size of 60 because that should be the exact size necessary
- * to hold the trace records generated in this script:
- *	- perf_event_header (40 bytes)
- *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ * We need over 4k bytes for the 4 string trace records generated in this script
+ * plus some meta data.
+ * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
+ * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
  */
-/* @@runtest-opts: -b60 */
+/* @@runtest-opts: -b4097 */
+
+#pragma D option strsize=1024
 
 BEGIN
 {
+	trace("abc");
+	trace("def");
+	trace("ghi");
+	trace("jkl");
 	exit(0);
 }
 
diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
index 96b0f1b8..23af81aa 100644
--- a/test/unittest/options/tst.bufsize.d
+++ b/test/unittest/options/tst.bufsize.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,19 +12,21 @@
  */
 
 /*
- * We use a buffer size of 60 because that should be the exact size necessary
- * to hold the trace records generated in this script:
- *	- perf_event_header (40 bytes)
- *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ * We need over 4k bytes for the 4 string trace records generated in this script
+ * plus some meta data.
+ * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
+ * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
  */
-/* @@runtest-opts: -xbufsize=60 */
+/* @@runtest-opts: -xbufsize=4097 */
+
+#pragma D option strsize=1024
 
 BEGIN
 {
+	trace("abc");
+	trace("def");
+	trace("ghi");
+	trace("jkl");
 	exit(0);
 }
 
-- 
2.18.4

