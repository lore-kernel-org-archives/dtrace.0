Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0251D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150331; cv=fail; b=HcQKpa+WzzVVfU8cRQ43iJi0ZDlV7S6gbiil3Muhd+fa47bWdvX5HUJmCudAYJpzJX/f44Y8w9TrUukohvA6HjDWO7T05qDzxyPKFzZe/o8KvVdnlzp1eGRIA/7wWD88MC5PZ8gEIIw1RG8xHERuzjAzmFR+IIIpaw3U93ZdLYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150331; c=relaxed/simple;
	bh=9MfXijDytb0B8Gcp5mwbk9FnWFlSMJIK8PCqt9SPgxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H/gAmwbpejMNAfPXFXmW6ieOkbcNhWLba4tgy83ci0trm9L61s9Cf9SMZ+Fi+q+8jWXaNkaNLQAuzyWH9q02/SmWXFaeywOOM0L7SwiB7oIWWvlP1aFR1ZQaP6o0C8vqSkQmJtEHZR07kLBXOR8xShlTiW/xOiUGa8KdkIz/5yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g7XcT7GK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YVQRLfe1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g7XcT7GK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YVQRLfe1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaoo031941;
	Mon, 28 Oct 2024 21:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=; b=
	g7XcT7GKZ85sCZENlIKMkxV2ci0wAt5q7iZXnXBPKEIhSYvve4PafnIlJUXcXQmM
	GO5lAQxCjqUmn5TFFNATYBIpYA3UJeginx5MyAgMnGe+BxZGGxdqPKOmH65hkjz0
	JCjofY4c9rPLYWBta7YcDTjj044owAHOokaLzjSl5ZkCH/ihaY4h9x4lqKeM75iQ
	+iFzWJK8UJNwCvj5JNHz4IIDdo35tcLwwN/z43qh5DNlCpS9M/HrCfBcFcKrpucC
	+xV2tk+KHeQViif1aKesj+zFfFCkVh62zQ/Eri1cKMVtSCREADPvBLUA7X3FoRi8
	5zPxj92xdsTT3xPdKDoCYQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8v0we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKCieR040315;
	Mon, 28 Oct 2024 21:18:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan36nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVe1FfH5NuocOWMhZX28c2A6vIieXXzKShnumxJ8oxD18ydOUOBVcFYFtF3pP+friQTBIr/hA0EvjsLMlslvsvsSaQJTnBGfEZuN1fmJQNCoaG08VXm2lCQN/uTudps+Mvw4yjhvam14Ic9gALJvwMcmQzTrrctYTSxxIIQa0x1LbGLqc5hA4etnKhZWXUdfCuBUm5Pl9gs48BzT9/tXLuTZKsjjc4KF+4zncUA+7FnWdwEo1RHEDiszDthPGEklcz7g2xNHkS4iyFJ3kTIl/Z4HH88IWIpL71FDnWgSI5E4yjzUZDTumxpOLTApl+uNLkdnAoJebKkx4+s5FzAGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=;
 b=TinX+OqtPEuMpJM25MGxXKRmRBSDKKXpnh7f2RG+fdcwwuMX45NQwTpsy+f6mHDe+Hg85fQWim228F4YpIQjWEkkEDvg3AVR3U40cNnFU02kFOpqcz9gAQS6YxUCHLulFNNot4dUx52yLDlCFyd9w0nUQ7htHGEymi0CMBsxIGbxgsfASTE5B01gM7tM0SjLXFq20FG2Fm6xPo4fVUbnSnjyigIsLFEerR8qjh5sdiIiMukjWHuZw5McYU/SW94RNWjq2eK85O9NGbVFEVOlq++pEH8K8akTDGvbLM22eQbMT8b/VPJIMv7LWbKfVOOjTUtmGmTdsOk3iobZQVB4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iBPzEsPk8ubMtvSEKvxFVBtvTlNLwx2Rw+CO1IpIxo=;
 b=YVQRLfe1eaZo7LvJ17gvNa5vAABTtucialy12tAIsbaxxJoeIiuwyYbZgWzuQ3JkRlnWetswXUY9saLn6Z+9iHtrZ0OyF19/psH0RdQpASShuM/WXLoqXRGW9XXqP/VS6qBOocrYC9DvPgWz0R5JunRhRgNXwusIMWTLdXk84xk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:40 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 14/14] man: \fP-ize
Date: Mon, 28 Oct 2024 21:18:03 +0000
Message-ID: <20241028211803.458685-15-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0568.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 0390f622-b8d9-4ae8-d280-08dcf7961643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xe7d4AADLdZM4tVrvom3XZRCLoaSckj3kXgNoPArQz/+kJJFGMQPWkuhIstP?=
 =?us-ascii?Q?SUOVa1xDRhtB6F+sOI44L5hW78D1ZntJrB9MQJMg8Y4AhCIJT5cHsduedf+L?=
 =?us-ascii?Q?VR1jJTMIyBKjGUVtddJEoEyDKpEilyauJjo5EIJsAIMBi00njThfGu+u6y8R?=
 =?us-ascii?Q?D4ULG15gUO0vjgz7TSZ8L5T9t9TBfyEjtr0JAmSXlIrWuVnUOpGy62hC5VF9?=
 =?us-ascii?Q?Ba80Awjf/50A1TOl3PEQg2iv8DNMWna52GzNQYynBb8fOUBTO4JrV/yEGqb2?=
 =?us-ascii?Q?qI3EkLRhPaWHwcAsMoaVwo/ihMd5+bxIHsB2OIPkzEAdL1p8AgsK3kqscinH?=
 =?us-ascii?Q?Nm8L3p//Etjyd6akCef4Xh2o3bHABQM4QxAAfiXB67rhnxvG0GUVomuz7dpI?=
 =?us-ascii?Q?ApiPd8vo3xYalTwDlsjz7IJoW4MzHS5rFe/L8Ri5Mab7nEanWxLrtfSrxfeF?=
 =?us-ascii?Q?pgmlxtcIR7O30GOekyCO5BvfItJr98rSS+SEZMZtNsPanojOL6FnpKYbOnS3?=
 =?us-ascii?Q?b72VluCi5G5vEvPmHdJ4bc9ITaIgGMckHMTmyWetNAa1ymaRHwB1hqkejRFP?=
 =?us-ascii?Q?ZDompRMYlruvwrJl6DFRizlnIjdWf6PJkt0mcQQdQvRs+uZRiAoJYjjJn8sR?=
 =?us-ascii?Q?uottprkCwkVjcSQAATkwUW9AmaQ4G5rJ1KVXMMKTI0TVh5lacRqH/czz+Pl2?=
 =?us-ascii?Q?+6PYCXyWyBgbJ5kbvhSo0tVLm9XP3yJWsS4y6aDZxZXySVAxIoqobJ1cRVsP?=
 =?us-ascii?Q?kUayjhAXwciVXBqaKSxjpPopJ2TtHO9fX/xy6ohD2PAWwP9hOyIqKWlPbkiY?=
 =?us-ascii?Q?FF5PsmrNUn1nDuAxkozZgmyO/VSmxR+UUztP6UR2ZznaL6WK+fxLPqJ9Av7d?=
 =?us-ascii?Q?3YX//sg1MaKvjaBsds15H4tHpIj17FKML5HH/IBjgqADTzWLDuRvWcAzVM7J?=
 =?us-ascii?Q?KyB9eMzNUifQcgPks1/SGEj83KUTsJyyrnkcG4Fir57ArxzfpaqUI+r5BDHH?=
 =?us-ascii?Q?avfXL0LpQw+PCrEbrypeDXjqnlAZrxYhraAHw3P1oMg+FvBmb55PdWbTXNyV?=
 =?us-ascii?Q?W4ns9FFwA43sLrRFDRRAWufD/mVzcFTAxhi0F263Q5XLFhLMbMLL+3/0vVri?=
 =?us-ascii?Q?GS/ooUdPmFVtCsGOUEoNZ98YbBa0qQAGhfL+8CEnxC7o/D4ulKW8T5bdeTjn?=
 =?us-ascii?Q?59AkPKcPdxWz04IDKbsP7Y/5iwq/NJ5UwnB/biHl8oGJ/2Vxr/FsVp9k4hPY?=
 =?us-ascii?Q?1wL0FpieUu668k13lJ62x9016DORu4KwpcHmMzo7K62pyFnODGiqGulSP5A9?=
 =?us-ascii?Q?l9R3s2JfIxWaG5C5PMlTH3cT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?91jT23WmC6Gl/0XNLn3KsJBop9Ee09JEEa4WM4hrxrZHfXETvcQZ+Zkt7mVk?=
 =?us-ascii?Q?51ElZzWDa7x0ahJadPEklWHsZwiYSagKrP9PC/aPPIOTVs6P7BVnLIroce9v?=
 =?us-ascii?Q?uPSS1qEk5I+GHWgnR+CYs1sfTKvyg/YYqW/mO760KrJASz1KBHlKHQCntiXA?=
 =?us-ascii?Q?ojeE/EnsidkB/XT9aO7VmSQsSG5D2JKj/Z23GEyNoMCZpd47tGD/6+bfExf9?=
 =?us-ascii?Q?iQNGQZLVlKkt0bcyUlnlQBfBTyocaKKwO8eO39wAfeulmjiv/yclo5TcTqlr?=
 =?us-ascii?Q?hInRdOtO5uiTTmqbUvfnDeEGFFendUAfaMGsGUsFvu7W+jMwGwqeqA/X3xNI?=
 =?us-ascii?Q?9vHcX06PSL/74vOLgqwUU3PohYCJmIh6fM+xQK8ijk/C0kEw7z4fML/6E3rp?=
 =?us-ascii?Q?XqUirf5VGM0ybeSRndAA/cVALT5pJ1SknLipox645xaUqkFodAqK0BvkH8uH?=
 =?us-ascii?Q?EqTgbgs4z32O0Yjh7kd0596Pq24NwuHXPSTNW28YI9SOW6xZ1JAdgPER+uAj?=
 =?us-ascii?Q?t6tCfnKPOPhdPWBvdtxhf2yHSiLZMa16wc88xd+t4MF5m61nfVxa0fbgIhOw?=
 =?us-ascii?Q?0rPBS4JjTyIKWsTedFz1r7D3ZxXuF99zGcwgRPQEe9MaV4gBx9mV+X/0jDjI?=
 =?us-ascii?Q?fbTpWpL68Uw6YJ8md8g/yYxvWqzvP3Ld+3DUdrQwu6vEObHSqIuqQ7/+wECI?=
 =?us-ascii?Q?yBpKUVhIE4vskIGOmV9X5Pw1c1MRfalhmI9JRqluITcT+IUVNmXCz3snHPz0?=
 =?us-ascii?Q?tZivYgwTpIIvMbLmecluTxLC7Orw6dv0gZ15qO3mKlTvGFO/Sv7xQJWk4Ldn?=
 =?us-ascii?Q?WCnRIGmzytohpisZan9wyEEjeQB+yh0GNexDLhbSid6rfv90xYPcmSjsuUoi?=
 =?us-ascii?Q?cvFZqit4TWtJWUrgK8eTzhqVzo+aPYPpDEOkE0hFzLOyU2VlwUSvW+LzFY3L?=
 =?us-ascii?Q?VA0Q1hs3hrBwK1D+hLiuRBmmZkJksUB3G6OPSes3InbVch8/OmWQuJQDRAL/?=
 =?us-ascii?Q?T8AZiMdVghn5jT6QeRnuHtSVqR6WBrLa6ctRpE7O/ZtPqSAcozTAu7JqJzjO?=
 =?us-ascii?Q?+W7afAnIWf/FHx7fSQNMs90s7EaNhYAS8LaA4be7mbyIpsses3peHNNG3xvD?=
 =?us-ascii?Q?5Ri5HFmnxePjm1isnVy6u0yFAINWXYNkrzHWu742FZQlS7KqMF5xYqYFre11?=
 =?us-ascii?Q?m5+XkoONYadBPa2WGFK1DNM152HmXt0p7MW75jnMxteT6iGRfhN4aOG8S4QT?=
 =?us-ascii?Q?FaupXEnBcEJckZ3NTIq2KypJPAOC6jB7WDBSJqTZCGHgGGuze/WWBjKZXk/H?=
 =?us-ascii?Q?1N2gED/dFGaY7lB9Ukla4oe17BA9RpH8rsG3zwWzmT+JqQGX9+JJIk24nvDg?=
 =?us-ascii?Q?0nZE6IWiAImRkWw3QSHx4TLZ9fruHzYoJI9Z67E3G1eki6B0kDXapKi7AAxV?=
 =?us-ascii?Q?gcA7sCVrNd1s4T37RJ8JqQ+pDM11ybp1if4qjXh/+4GteYlIHHcgcqb0IpgI?=
 =?us-ascii?Q?rlWSvtUtfWru4NqOjzNKPBMNNU0dikKNsWw8mmrR1RvfV1LkBKEbVMFLlu36?=
 =?us-ascii?Q?gBMoxQxE/aby3OusxEc5p8cNgrnXPO4Pv5lOLIpkCBwCmZ2dQjdMuczwej1J?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u3ZITPREwh9VUB49hUEong0rkC/lxNI5YRHMuCcwxI7rLyKYiAL8sGpXA21J682wV46XMA1GvGN2UZtQ+ggZTrPJNF8KxioTRYtg4lWeRPvIiQzkinpsAOHDO/WRGwgqUEKzryOAF0lDOK4FzOpEYXtL3MGEaY32HH7tusZkAm8JcdRY//9d42vOTZ6xgigKug4gbVP4HkBbp0KBLPutHPAQolr9PbNKwR64ar7ImiySuVpwRFUZsUeMuMxoIw1BISeFNCtCcurBzzsEly+ZyjzajcZjS3uChreVR0hCAzHZ1Jki4mPP3KDqSh3D0lzHgBzZQGn9p0c1tEQQUIOmuth5hyBmMajNEvlyOuEYmXKU5/xVPsghP2x51koJO31RUSJFp9Pl+bXr+xyXzA9KfypnTYS/cKiAy+JoM2EPzWTFNXQOmMMtPgjwJxglf/vBuSUPuM1P3MhHnNwX02ib3OOJhXDK2k8EEw1cPC99iL8R+NzuOGsdAoGKj4xuKYg2c8WAzq66vBz9ctkfEs5LMNghPTGuuntfmXzjLQi5b9/vAXP+ZF8xG5Ej08MlUQ1KKNtTBjKCzPAIcxXidorLSG+cmlxcqfAyQI9GFcjBb2Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0390f622-b8d9-4ae8-d280-08dcf7961643
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:37.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2d8sCrOJS14GT3S3r+b8GTJOfF3S8mbVBIlR6Gwh8a0chzEu7jecP2PLazyxtbMLa4wmZ/N367z11X2zbQpag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: FuryBet5kl3ebpef_P8eIi4DjfZutpvr
X-Proofpoint-ORIG-GUID: FuryBet5kl3ebpef_P8eIi4DjfZutpvr

This adjusts everything to use \fN...\fP rather than \fN...\fR everywhere:
the few places that were using \fP (usually \fB\fIfilename\fP.ext\fR) were
re-expressed into \fIfilename\fP\fB.ext\fP. \& was added in the instances
of this pattern that weren't using it (about half were).

No effect on terminal or typeset output, other than very slightly improved
layout around the filename stuff above.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 72 ++++++++++++++++++++++++++--------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 355484bd0d34..1f2d48a07531 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -39,9 +39,9 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
 .LP
-The \fIOracle Linux DTrace Guide\fR describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
+The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
 .LP
-The \fBdtrace\fR command provides a generic interface to the essential services provided by the DTrace facility, including:
+The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
 .RS +4
 .IP o
 Options that list the set of probes and providers currently published by DTrace
@@ -57,100 +57,100 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
+The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
 \fB\-b\fP \fIbufsz\fP
-Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
+Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
 .TP
 \fB\-c\fP \fIcmd\fP
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-C\fP
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
+Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
 .TP
 \fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
+Define \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). If you specify the equals sign (\fB=\fP) and additional \fIvalue\fP, the name is assigned the corresponding value. This option passes the \fB\-D\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-e\fP
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
 \fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
-Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
+Specify function name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fP, \fImodule:function\fP, or \fIfunction\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fP are specified in the description, all probes with the corresponding \fIfunction\fP are matched. The \fB\-f\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fP option on the command line at a time.
 .TP
 \fB\-F\fP
-Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
+Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fP. Function return probe reports are unindented and their output is prefixed with \fB<-\fP\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fP. System call return probe reports are unindented and their output is prefixed with \fB<=\fP\&.
 .TP
 \fB\-G\fP
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fP option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the ELF file is saved using the name \fIfilename\fP\fB\&.o\fP. Otherwise the ELF file is saved using the name \fBd.out\fP.
 .TP
 \fB\-H\fP
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+Print the pathnames of included files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-H\fP option to each \fBcpp\fP invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fP.
 .TP
 \fB\-h\fP
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fP option. If the \fB\-o\fP option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the header file is saved using the name \fIfilename\fP\fB\&.h\fP.
 .TP
 \fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
+Specify probe identifier (\fIprobe-id\fP) to trace or list (\fB\-l\fP option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fP \fB\-l\fP. The \fB\-i\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fP option at a time.
 .TP
 \fB\-I\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+Add the specified directory \fIpath\fP to the search path for \fB#include\fP files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-I\fP option to each \fBcpp\fP invocation. The specified \fIpath\fP is inserted into the search path ahead of the default directory list.
 .TP
 \fB\-L\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
+Add the specified directory \fIpath\fP to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fP is added after the default library search path. If it exists, a subdirectory of \fIpath\fP named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fP. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
 \fB\-l\fP
-List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
+List probes instead of enabling them. If the \fB\-l\fP option is specified, \fBdtrace\fP produces a report of the probes matching the descriptions given using the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, \fB\-i\fP, and \fB\-s\fP options. If none of these options are specified, this option lists all probes.
 .TP
 \fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
-Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
+Specify module name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module\fP or \fImodule\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fP are specified in the description, all probes with a corresponding \fImodule\fP are matched. The \fB\-m\fP argument can be suffixed with an optional D probe clause. More than one \fB\-m\fP option can be specified on the command line at a time.
 .TP
 \fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
-Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
+Specify probe name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fP, \fImodule:function:name\fP, \fIfunction:name\fP, or \fIname\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fP are specified in the description, all probes with a corresponding \fIname\fP are matched. The \fB\-n\fP argument can be suffixed with an optional D probe clause. More than one \fB\-n\fP option can be specified on the command line at a time.
 .TP
 \fB\-o\fP \fIoutput\fP
-Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
 .TP
 \fB\-p\fP \fIpid\fP
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
-Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
+Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
 .TP
 \fB\-q\fP
-Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
+Set quiet mode. \fBdtrace\fP suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fP and \fBprintf()\fP is displayed to \fBstdout\fP.
 .TP
 \fB\-s\fP
-Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+Compile the specified D program source file. If the \fB\-e\fP option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fP option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fP, \fB\-l\fP, or \fB\-G\fP are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
 \fB\-S\fP
-Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
+Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fP.
 .TP
 \fB\-U\fP \fIname\fP
-Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
+Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-v\fP
-Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
 .TP
 \fB\-V\fP
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
 .TP
 \fB\-w\fP
-Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
 \fB\-x\fP \fIarg\fP [\fI=val\fP]
-Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
+Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
 .TP
 \fB\-Z\fP
-Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
 .
 .SH EXIT STATUS
 .LP
@@ -159,12 +159,12 @@ The following exit values are returned:
 .B 0
 Successful completion. 
 .IP
-For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
+For D program requests, an exit status of \fB0\fP indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fP returns \fB0\fP even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
 .IP
-For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
+For D program requests, an exit status of \fB1\fP indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 .IP
-Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fP on the command line, and by \fBsetopt\fP statements.
 .
 .SH SEE ALSO
 .BR cpp (1),
@@ -191,4 +191,4 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH USAGE
 .LP
-When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fP flag, \fBdtrace\fP stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fP running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fP tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fP(1) and killing the offending \fBdtrace\fP tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

