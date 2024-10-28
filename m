Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5CD1D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150319; cv=fail; b=Pb/PrXf6jMSRhiSbKg5AoAFriGaySnZDi1jRD320kbg3sL0FX8JM6edRD8WpfS+7mXXLNoQTUJBFVxQu1wV+cJf/enjc6Sn3nTh8B6qhKcu2FnYahea4fKemt9v6l8yI6MVcRnk2PfCcgs4T8idP/p1Tk/vSyB8IIAwDV4IhuiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150319; c=relaxed/simple;
	bh=Abdd7f1lsy0UadykT0pYx1QAGZW+4mkJdgwWfwv761w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bWj7GA9RYLSbsMECcNwXDIqawaeIdHpSMwXgjAryum+3V+3QldamhyR1z186dRDBwdqXC8sySvKffzWvFyyoL79QrLPlT/1owKy2rE81fAaOUKjdHtfslgwofeh8a175g8gHyFjK1V11ZpBumod/s96E30jlod4ixNcNs+KSRwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nKD2JPmT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hZN+pg5P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nKD2JPmT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hZN+pg5P"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtZp6032519;
	Mon, 28 Oct 2024 21:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=; b=
	nKD2JPmToPL1tnLEUgbfKyd/9bRlpG6Q8MUZ3MUgmml7OBwofWCh+aWoWNjljjrG
	lBJYQYqhL9ucJrSx7ol1gfZOems0gt6OTyrA8EJhBuapaDAEpToNklavoje5t0QL
	UUwA3mvq0z4y6Ffj6OfP7SHo746jQMqx1aZ/EYRkP38C8JXj7UcedUu1OyfFe3DD
	sy7f6qKZXINVqSUU3M4WdMoa/79lhSbpbBmpt/emM2V2n1WqcQIkVr5s4TOEztOM
	ZAHSfI++bW+4wg1cCA1mlat/F4g3P/plxCPP9qt7hlLJ/tbjtYMKMyQ0H87nGCBO
	8wH5pjPRf1Aqkt+eAeXmPg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc1uy62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJxrmW004964;
	Mon, 28 Oct 2024 21:18:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t7g7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElSnYe1ob7teK4yyDhN0ulwg+A9NnMH4o5xBYIWrGKc3lNowozvSunVsBV5rNUWw3oAOstB9qM7dO3Lq6Wi+X3tuLk9+z/HQYnSfg4it5PX3v8h+FisrD5V4eXQWhtMond6zMbg3yB7pjelacB22Ko4AL26S7FbS8eqwAC6sz6frlb7ph45v3mmFoaTz2uEJfg9NApv84IkPluI7oRjvJbf3iS3E4Au8rVf7e2b6Gk1Tmvs5h2VDpL6evaEuHulAuE32Lkfd5kLxzLuqPMVx8MpfSQ1pZea24HcP99xJtAsLKqUPyXA62GmhuZo0cznhItZ70pA4kFUYKqkp+QgJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=;
 b=hhjGJm4YWVkIXeC3R/rdK75LazxQLuIb/KTXDj/07gBoG7MS4gvBYVhRC+2/a+onDluNXWXnB55NDWKxLCYpim8VNErIYhchn0RBilR6GbWQidyOmYFs0TNXlEcXBr9qWa++pebKNI+L6UpkmSUi/o4SD8Vx9dc/IcejKDlrEqZKpZ0aZGHtTW/u6MyQc7rvIXG7y7TG7mAI0hHau6kcZTzylq6xmVl8yftU/2bovajrbe0JcqhKHNWOnY2MPK7AjHX3USMDEpZAe4X0xj/VshnLouzCPu4wP1i8kM4D0d5SvELz+LYXaHqzvr6ytTiyywY+5ICh1jLmXnx/Q3X7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjFCqDDfpbYDtSBH0PqsU/mUNVvYI3/bPp4WVPsxOU4=;
 b=hZN+pg5P2xYgqqA0b+NNddqLKLrdzfCDxPg8E2q7J5tAGwiqrQlcNDglJZMdVPadPF3mR5AAmxSqGNIjBZDxFRO8HKoS9qrXS9LIwvFxoTLdJUkZ18GIzUOpU0vfvvMTeqiQ9KkVArPDuC1e0D5XacG7czleR0lxPJLR1WdSqTg=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:31 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 11/14] dtprobed: fix parser child timeout
Date: Mon, 28 Oct 2024 21:18:00 +0000
Message-ID: <20241028211803.458685-12-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 571c46ba-6d0d-4e8f-032d-08dcf796129f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTBIEcB4iuEPKogoavDMVZn3OIJEwDMNMgY0gMlfe3CzoX6eh/Z4JIfEbvXe?=
 =?us-ascii?Q?qgni8r5NFRjWBcgljx5lGLyVSvM/NgBLUfd8QXnuA9RwSIcmYReI+ZHJOWF7?=
 =?us-ascii?Q?LZ2tTmTGxq+yQSXoU2Lt0y6xVR158xBy/PXvwsyLeAA51YEtq55KHw8WOePv?=
 =?us-ascii?Q?mPlkORFSrLAqxu/4pAmIyMrOZX5Y1we086XccpcEQXXUgjij8ypMTTvV69Im?=
 =?us-ascii?Q?g9hnA4V3MZ9j9VXoiuHhH6hbi7gXT3tfCAA6dq6SUY1H47dRrwSZWfoMJti8?=
 =?us-ascii?Q?jzzbKgO52bQ9wfnPVQ3VNQgnXHhXzBaYvgI2aL6XLGi0P1L+2sf8yXi5keTe?=
 =?us-ascii?Q?BhzEa9Zbvo65UBxjXLCpLcjI2tV08706eG9e6FmVILwVXERLuM0w3yo06XoR?=
 =?us-ascii?Q?ke1BOSyq6uipicljJE5LuCoSFjBKSp1vHm23T4/bSJsNt0MARXGkKiYtqrp1?=
 =?us-ascii?Q?N0gryMldIOV9vSCj2WFohk3pIa0eGN7xMYPks1+Xht4NRHeQnUhHf0P5haLn?=
 =?us-ascii?Q?rYMDa5exQIjZx4sbYpGRQyCuU/CvB8WLx/htPNwCXYHbCHqrloS3qL+h1UAx?=
 =?us-ascii?Q?PyYMJNEKFPnUwH/MnEZ3N+6QIgieeyGa+q5QeVKflW2+zDtKb2T7W0mWbtwc?=
 =?us-ascii?Q?+s2YcEFVtdFWDMxnZ3yb1DWWjl4McXjHk2M1RIcyf0wpOPlm1AheKUr/NLrL?=
 =?us-ascii?Q?nfX0rbmhQ8rFiDHc9UAuUQgX4ztxD3K/YDbSPYU14JD0GWgLnDX4fyUeybKo?=
 =?us-ascii?Q?isdG8GP0co3WcSPFjxkfGAYWIEHd9Vf/M5mmQ1AT4n7xMfT+rcUlqVaF4rjS?=
 =?us-ascii?Q?m9Vas5yUjvdpxJOPeGnza1iJ/vkM7AiIpDpc0NlWtxB2CgzX+IGIk/AAz1sc?=
 =?us-ascii?Q?e6pf3NuULc5Q6YKXq16LmydZRBETZIkdYO8gc5AXk3qPel4Y4i8aJYulltMe?=
 =?us-ascii?Q?sK/oQGX3Yod0xiShDDNkqY3NRthgNJXYcsc/FuzuqgneabuH3Ot7JD/nH/Me?=
 =?us-ascii?Q?XrXbEFVzQNmfUXF7YVXvcmCKaexOK+HqI9mRsob/HabA99KEa1W1B7OoJSyd?=
 =?us-ascii?Q?sCGuwWBaUz5sn2LyXMVkE9leruhMGEynIFrmyTFwVK4Xj9dZtN6i7mjZolJK?=
 =?us-ascii?Q?ybtpObOtK59OU2dOVrVKvlDGYOgXgZBFi17l+epwnzUaltPYt1o/7xoF4/XV?=
 =?us-ascii?Q?VQQ1zWk9YhOJ5Fm4ZwKHL3RB2DQdnsUUhL8bmTTsZPZSrqlXi0BE9u7rrNUi?=
 =?us-ascii?Q?0bELr1v1bz/IUGtj9fECjNtLN3x+sIQyVv87xkm8H/R5LOPgm1+cjIaLfN3R?=
 =?us-ascii?Q?5Ks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?18U2qnpf67t0Qsr1zYuwKIza6ijGsyjGMwIyACOqHCHl82e0wETRUNhCPAIL?=
 =?us-ascii?Q?QJWTYJz+8Q2VN/LSzJSOmTKvHjSO1C+LpGCXqtk1e/cFq19IWL+kvD0ckvj1?=
 =?us-ascii?Q?1BjS+bkLDFQbno2BO+wYRan/CFiFW4lTwJbiJquHYQyjJE7GxVKCubklpJAk?=
 =?us-ascii?Q?vXBEjFzheUzPAaV43LLDO1s87MjezG6XwQ2EQ1S1wm+cxyZJQGUrhF89Ky6e?=
 =?us-ascii?Q?MoNTB1+2O002AmiFdOvGlzBWcyuVfUzxAXo0oGejfnhGNgkjTTBmpEnrR4cX?=
 =?us-ascii?Q?aB9/So2uWSA4/WqY9/lnT4JVtpmqXOtPE1jSlUPW6vh9pj1IrRwGUelYorQV?=
 =?us-ascii?Q?zchSqUrcNCPjWUGrP4WuMU0a4fVxDQpvYgaKRi/ruf66Z1lkZDDHKhLDZGQr?=
 =?us-ascii?Q?KSpQlIL6N6tkkwX/ZoLF25sua1CuFH6wvIUMNLDjig1Z9PEf3646xG5XXWHW?=
 =?us-ascii?Q?wA3WCZZfqt1FXOZoam8ipz4EEgQoW2Qtgiy0wJQb9eaEv+YzMrBOnS+ujLt7?=
 =?us-ascii?Q?PGK1UOTzx9KPG8g6fKlTzSYzeN/agnv3vAWo5Iy4EQc3kOT4L9zMAjOBnrrN?=
 =?us-ascii?Q?UUibZLXO7cu9ey952TL4icCRV4hm1YHhBIGj31+b0m8WE6ctEw0NoCjG2To2?=
 =?us-ascii?Q?8FKMkgil2VI0zAEx9FFMWO1RESBnrszxrjgZzOXALJnSdHSO6KlGtyy+0opc?=
 =?us-ascii?Q?QOGL5hGQlIoD5STToYIfmoeqcPoBXvQmMasjfX10NlYbAd4lk2RirU8UuUny?=
 =?us-ascii?Q?T/VJY04tVwQO2ri+IlfcjAmxOk1lePJ8FHLNNlkr87KuYOaDGlwLnKG+QXvG?=
 =?us-ascii?Q?hfrdIDwx+IdxRHkEB2LI655BG70WcSZwBAouCvjb+yqlSRLZXm8UyxlCl4E/?=
 =?us-ascii?Q?ArNiXOSlJ5o9D2n1BB7YA713md/d0vEKyrFJCgICQPaGmMYxXDvNp+4M4ulO?=
 =?us-ascii?Q?/OVVtCbSbvjQ5km8P4gC1As8EdYrw22LhVolM2t95p5fokUQQjEZFyRdM+n2?=
 =?us-ascii?Q?VNdWuw6Kwfz7UhAyYs/WyJkP6fA8MG164in+Jimd2NoEdaMyQSHwDK3BHVY8?=
 =?us-ascii?Q?IxgTUazfhvamaj2I1pEVmgxcd5QXNN8uxO7o+ar+y34v83Dxh9USm+o+PtqZ?=
 =?us-ascii?Q?U28bnIwtvyBbjB/wzT903DEBQBtWoXHEHEls1S90Xn11sEquqCUeBHH96dlQ?=
 =?us-ascii?Q?Bt8Y9mFwjjUkMSUTEnhBEBFdgO+K0yI+KweQ9T80GF96cXreNm5gAkR2hHeG?=
 =?us-ascii?Q?t6jZzKgFHrWPAzSacx5qU3QHK7rOqM692+pli2W2EdTOLa90TTWuVj+aKVV/?=
 =?us-ascii?Q?JZAFkZJotZvDvBK1qpjxuFmOhaRtxnWLyJn2KSr2kSBebLrapX+2PIl2O8aX?=
 =?us-ascii?Q?ENEJH8FeYmRqdbcGRSMzRaVzCznoEY9zJOWKgqzhJ+TJNZkKZO9rdJWKIuem?=
 =?us-ascii?Q?g3y6Rttf8GhUiZ3TxUEDpsSYgPAF/Mb4gtkOfgCyr4RZ3alU0U5XxQxL2x0m?=
 =?us-ascii?Q?PjE6kB9i4V2qDpW2rvFv3Pq5XB+jw3psFHROR23r4V3fsnMBwz0wtjj3PSL3?=
 =?us-ascii?Q?ncBXw6o37qt70xbCwzBHGhJu7EmGsPHIcajZ8lGSp1pTR/AEMdbSvrRvC+ZX?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWXZvLl3NLxtwfj15xu3AzTjeCtBoOr5MuhFERKDOWYWwJ9LbH2JSJ9YpnCs6XgfHPROwoxsqIhJfqHksPu6aZd9GC/H4tH533G0K5YEnK0KHG/ZdfKJEAhm55dJ0Fit8XnHZ5yV7VqrHwknp2r0zY6F7foRH9/tdppB+5S5F89lOeXPsXWGNizaomsw1ejxtejDBGgJWQhBNJqDB9vnMOgUPnmTljvb4I/lbggrquINxSekuadln9+ajeurzVxiC9nmOF/IYVREYyIpMdWc/kiwyNq6f260syv71o5+lhJRBWwj10osHHvEk6LTxn2SQqVSSSASYgU4+k0Gv99jo/6esQvPpzQ8Mr074BJjww98zuxB2GvhRuSgpOwYtIpfctejEk/0tKFdr5n4tuKoeqmcj4Gqax8n539oIV8ZeK3wUTapK3OzJ1E6rTgIxJf/FqIlQgZIXD6NuzWmD+mkyrWhlif+gyaJs1eRfa8GyvtaENtFcNcO+6Opp8HRLgKKIYRlfmpUt+/F0nBWEK7m8eV9tbSaLvsCSoBnBaX2qYUIGH5Tf5HikLXDIc+iRJigiIh/wkEvj74ld4JM3KkfgCQn4e7M71dcDlBVNZyOWY8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571c46ba-6d0d-4e8f-032d-08dcf796129f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:31.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pTwmJ4whyJnbxuchITby0SVlvlrnAHlBFDglfqSWslhQTCJdSRUmOZcUKqmI9OKCcjZBI0+UUh8HOV/rdnFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: OtH_z1XfLbGtXtSaYAtsNN05AHGLqxmk
X-Proofpoint-ORIG-GUID: OtH_z1XfLbGtXtSaYAtsNN05AHGLqxmk

This was always meant to be five seconds, but when the option was
rejigged to take seconds rather than milliseconds, the default was
not changed, leading to a ridiculously huge multi-hour default
timeout.  We definitely don't want the parser child hanging for
nearly two hours: go back to seconds again.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index c83f0adb56c4..f4c6be1e045d 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -82,7 +82,7 @@ static pid_t parser_pid;
 static int parser_in_pipe;
 static int parser_out_pipe;
 static int sync_fd = -1;
-static int timeout = 5000; 			/* In seconds.  */
+static int timeout = 5; 			/* In seconds.  */
 static int rq_count = 0;
 static int cleanup_interval = 128;		/* In requests.  */
 
-- 
2.46.0.278.g36e3a12567

