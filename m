Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC719DF7A
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789301; cv=fail; b=MKHeeVpJ24Z1XlWJVwjrpSuRi6Rc/YGyeQ9fV52oaH6pPbfdaAteFoi/kWdYV22VTfcATkgwRKyBaVaYZTvOa3AlaigViAjpBVajTUcuFQifz1b7yNWLwDMqT3d86rdafgUeUcMDjVtC3/inIT2/bhuYJC/UDAgrKGDAUHKLtps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789301; c=relaxed/simple;
	bh=uqLDVE/1tfzEiXMXYEmF3AA7XcEFtx1ood/WOpc7RJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pFwi+5UhO1izDZxE2cwGJltIEPqtv5jfClKRD4CPMsuPLtw1KVyyHbSrKzeD/9hXiOfTMnVA/KxjEd65abOw07E8VF4/ykewuFfQyMz8UIThl46vr6aPfAr8F39xdkSBsp+gFdcyzkmTIET7N53b2LAlK4y0G35xicIcQx+boew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mdsMVmLd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bb0PT6+Y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mdsMVmLd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bb0PT6+Y"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGtffW015130
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UfDMCtPv4ee5WSdHBO
	og1SUIdIjicGNEzvGdP2+74Sg=; b=mdsMVmLd8cQxkpUn1cxB9X6fxqnXGlo6zP
	ksQ9X1ELHIhfbLaF7l8n9Fy88tRY2a//tc2lAmGxI+Dj+ag4Qd4zNTzaxxLutFWA
	ku3BKj3zDSJMZAZqHclb0kQN5rrQLuObIyiFkSh8WdeM78idiKxbk/uvVyvXdeLv
	XeQimVSMWS2wV2L0nPG4nVGfnOVseYgOp5f3GqgzNrsN2NXXw+4WSEdY6tn4tF7Z
	6nuJYIP6cdi+ISz8yfzVSQYTqf4XssXPP7t87KRZrhPplOs8XJL+HJPHRLPwnz/S
	qU5Gx5/1ajGPeGcfI/AVDwq2u9XXM5BMzz4Uc6qlBafvBSXsmMnQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ek1td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:01:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGE6fL031277
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:01:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh383nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OD/luan3wNcvX5+GJD7Ck1szKfPLdkzrlVT5hKJokwIIeDHQoB+hB8aTyyAQDAq9dygyOH3Za/Lw1b52h5zbE/joXtf0Cy+359M62YLM/dAzQIgWm4toawgPGiFzxQEUd5kdIVYgjPgvURQCp5GGeg6ElOnpamcNaMtBM2iGgE+qScUjWy+ixWV8Xl85jVu3VN4Y7n+9NcOI4nd1qeK3aFBKxulRQe2fBqE7XPoOYpQvRviasVwKN9ZpD4yv9s10htbFwWhjBB+Pwk8n85t3hCncojCMJUvY8uZWGqLmGTgNzqQ4ifAfcGj684IrEbiYbqBQEesxkAj+ra4fpyAXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfDMCtPv4ee5WSdHBOog1SUIdIjicGNEzvGdP2+74Sg=;
 b=gsClDquu4kfELnqPKdeiSyPoBsX6+sn1sxELagxk0M4wxg/qE+XY7/LyYpCxiz8yauEFlZMbXgI+BI+FifierTgu+/BrwjOkgWA2n+HyoxOGAszXOJXI4qtfA8z8DO034/I/UrMKXa+Fxeqj6ZIcYQR+//UBEi1/+BymVwuCf1u432+7xespmEYSmftvUAtnMNFifkV8BmPTQHEw8fV1fd1sZiR6v0XhjZ3cABIPUmOa+bJKjGKeSclCiK+Z+UxQ7Vja3BffBROSuDWc/JBpviiy0cqHlZsU3h4J3ho3ttLJqTpE562Pw7lDWudrJw0v1opFOYsbwXL1eUIH+PpCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfDMCtPv4ee5WSdHBOog1SUIdIjicGNEzvGdP2+74Sg=;
 b=bb0PT6+YwLbwh0JxjjLAdvL8buDsOy5HMzEaX7DdBDEH5VOLTJAPBtiM9UUJvCU6HZNOtQedsAac1D+3FCflNv497O/inNYwl7D1MMMV4qaCD3/Uhq1M/Ah9ooC18uIptzPNPqsCPfXSii0LMQp0pZgRsoMTE+rwEGj499hnvSA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB6460.namprd10.prod.outlook.com (2603:10b6:510:1ef::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Thu, 24 Oct
 2024 17:01:31 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 17:01:31 +0000
Date: Thu, 24 Oct 2024 13:01:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 19/19] test: Add another USDT open/close test
Message-ID: <Zxp9Z2Qzq_4Gbq8b@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-19-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-19-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::22) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf63ace-2b59-4b82-1bb5-08dcf44d8241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o948C/cF0YI21x5RvlkfxkAK7TeD649Nxt78uqBeRL2KhcOZy0Yz5wR60Hvp?=
 =?us-ascii?Q?z8wO/3nKjASzmCZc9xsFm2jsrKNywuoFbcInL7OqSXjIXPfZcig3aVay4zFF?=
 =?us-ascii?Q?fr25Ldju8d4RIA7Jw9spmij8WAUcSjehvWji9Ffyh0uDUI8CMLWTAtzb99j8?=
 =?us-ascii?Q?7aUbumXymdp2eTiVIf42zmUysiyxtyxlp42SANn1/uxDDsEYk0APAhIusQFK?=
 =?us-ascii?Q?zd4pqPqz3pv86iknvTwb0e27w/fQ474CnCWxAro3Fiq2hGhFg4xtK19ujpn9?=
 =?us-ascii?Q?DvhabtOv5C80d7jIB0Ox9Hr2Mz3NNePJ4sXbdFNI+k2KBaxawpJ7VemPL6x9?=
 =?us-ascii?Q?4U+Bjx5VFZP871Qvxn9n+8mT5okMcKTMkIdI8CG7UkY4hzgpAnBOAoqQHpaJ?=
 =?us-ascii?Q?F9oG5zDlEw+53PT1YStwhUEA6sCOBnBML7NcYBKK3xjG041tqDCE5+vLBX2v?=
 =?us-ascii?Q?t8T/Gn+umKOp36QjuGktr4af54ks09+1+ELqwuEfNw02MG8SfYDka9w2GI5x?=
 =?us-ascii?Q?WjcvJNMQvViq8sZ3Vd9v2b8xxIlZ3Pzm8IjXMTlHv8pj98N/pYH17ccau4PJ?=
 =?us-ascii?Q?Ax5xTGtr3J+VlRgClSL99ujEn96k9z18Iq+dcCK/MOeOuhTnJv86clYd4wDn?=
 =?us-ascii?Q?qMpTZLMrke1Ih+0KmDkNLA+Hv0TEJKzULJMBLK8f2wNe8eRFwSpn6Bw3BKKf?=
 =?us-ascii?Q?UMFYGymMJ3MpD2S93269MXy+TSak8voYD5yM3AeZ7KX4JGTCCVINCdW++1K+?=
 =?us-ascii?Q?0jhXAGdzAYU3x+dk/5zFUhSfZg9O1L2A2pSgUlhCHtr1Is0wzcUxWz+JJpC9?=
 =?us-ascii?Q?8VWCmKex0BAIDtlq7xWXX/pUzmNKX6ts11eHW536njN4EmfJonIw1ScUdS1h?=
 =?us-ascii?Q?1qzmldRWgUp9rX4sd828ItSX11Wi3Fqj6/YOUsBpYyIIna4Lw8uzNq8c7kf1?=
 =?us-ascii?Q?FKkTVzo0c0ueAZEcv00TXJb1Pfj41TEt/cr5xdJTnPm5fzPW7a9znYxuvnQq?=
 =?us-ascii?Q?CwzPTgXLQdQbL4PlPkmK/eGBnH4DOlXXPpW84x+f/8B+kaw4xzuQiOf8HAKs?=
 =?us-ascii?Q?t2uGHnvbtb5wsU80pj0KIIqZGtCvRRMroXU7/AzuKKvjOEBSu7qshahYf9FJ?=
 =?us-ascii?Q?QJeqViZip592c9oQMU0iuJj4VAv4Q5LLlFFWS4k18IeNrxazyvJIZMF/W0lc?=
 =?us-ascii?Q?v8G9UVfaRnSibCSSMSBbIkNknaN0ALPG3xa3VuGS1sj9SqSB15LLOzOFl6Y2?=
 =?us-ascii?Q?K122IbVHLaiMoQjP08TPZSP4kLP2wvNjpdXPpkm0eUfx7jIb+lYLQagMfZhn?=
 =?us-ascii?Q?1j0rLHFm15gWgksVacqIX8vF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tChtxgE+Z9LGLaJTA2tKayV5PRgkmbJw6QgG1oaqYQxGVvAeIqYul8i2+Fs7?=
 =?us-ascii?Q?80B86kNjx11+YLva9IVt4h2Q2MYSOhNcdW9YE2SwWVvBGcqNtJpjJDarGTsM?=
 =?us-ascii?Q?n3XtfepxR1sb7pQLrFvLXrwqQbxP74gBzMKZtz8vrU9q0evkAg04Vo3yyEX7?=
 =?us-ascii?Q?ZNn4+ObnWA7fi3lqGnZOQXHIL3dJ4vYFUiDz5pLpuwtU59/gNbRkUN2NyRRm?=
 =?us-ascii?Q?fXZd3NU40GTztx2jXsDEG9AygZ9NihXbQ6f+7DO02LxLaNSFy2fAGuM69EF/?=
 =?us-ascii?Q?DyfZnqpRp5ZH1wrJvaUkmN9hrmGSL23fjqegj+g7jPjR+SZkGeArwtOq8pzR?=
 =?us-ascii?Q?aZ0cCdvG5KBxLCiR1tnyLiX/dNQ1NmHvPxK1xFgfFswuoO2a1OcLtcRaIVAg?=
 =?us-ascii?Q?64IrfPB7/y+AmRVIE0xHRvBGIU0L6Ff12tIv7Sfd2JTr7Qrl17s97hcuS9yv?=
 =?us-ascii?Q?lqmZUGVcVOQLpmbc0vL3chXicb+HZsr1A9O8jnV75IgmHeFPEH4mbLSxrH9D?=
 =?us-ascii?Q?zjBOOL+WViRB1XdClXTcln0fdCoJqorrMD3Sj3mf4qiiOh7igmFJvdQ3Tpui?=
 =?us-ascii?Q?KrnwthiyscKrmNstB8bMwEpXCXicIZA82Q5Tc28Zt5VUCzIG3btdJHQEaxUh?=
 =?us-ascii?Q?KHVlIiMM98RFrmwplQO5m7EbPSQRom1bnoDo0f/F6sx1E+VHRshaZ5W+4Znm?=
 =?us-ascii?Q?kbiO4zqCHNNfSZ7yCZAn7+6Zku1IZqRYjW7BYAtuLZkiA+XrieyaxtqQ3NMm?=
 =?us-ascii?Q?Kkj/frfLmKi16RV7tBUUz38KwadQy/imW1qdsXjNF0mj/IMwewFU67Wa0+Za?=
 =?us-ascii?Q?T+rSZFtnfWu7xKNL256me9CTA2ZjWKZt34R8DrrJuixWuE3v7N7UYmuPboU2?=
 =?us-ascii?Q?EyjJnvmRk4rGM1f4Rcl69ye2tiPfcKWX14y81Sj6qM5pcsRRFuF0zcA17wnp?=
 =?us-ascii?Q?vzn9vHXNQQRVRkQLGP3dbh/Em1+ttMrEbYVJi4F0pMKFvNFVGNvnybvMwvDB?=
 =?us-ascii?Q?w5XfeGedTTCXszXYp//zMePUBYCREatA/gW9Fhm5fsQfXlGZk+HwkQoJB7qn?=
 =?us-ascii?Q?UdON1PiNL5Dx6tmJbZ48gI+Dj4PosEehn1bduu8nOx0L/Uc7tbBE88HaZMAi?=
 =?us-ascii?Q?K8sZzAWY0aUGnkPUN8aRN05ZMKfn3r7/0x2NDgwYJyXKRYVdBoZ0YbHeU0Dw?=
 =?us-ascii?Q?wVpM8EiJUG9IXD2qNN4u3x3KDIFGEGfcc04cMeCxtEPm4sYixkAeZfmvxh2g?=
 =?us-ascii?Q?8JLGOHjkIAWVBq4FZgpIwNpCakXpASGMsKPEQbNMxhfYy+EBtcBeGN2twc2W?=
 =?us-ascii?Q?pxciE46krZJNEN31xIE/ZJHTDew5FhzslD0lDRBcN71aLgGXoC9/2HW0jvEL?=
 =?us-ascii?Q?+6SrwmE3Jp8bmxDLrm5OOf4dkKJYxYRb5es8q1O4gWUF3/uQZB1/rWNbCeJw?=
 =?us-ascii?Q?8LQlSxKDJUHy/XUg+SJOSE1mWCOkGpnwvDeOguJ+pPoDr7gDKcrddCFunFX9?=
 =?us-ascii?Q?fOxymWy5v98Wfs2EPiWMlJecQqIMdWJB7La5upNSazi6k7XXRbmfD6aPwkh2?=
 =?us-ascii?Q?necFrdXhtdVP2+Ev0/bHuPA+rjRIpgm5I6M3kekkzy8+I4W28YM/G6SDVn/V?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0aOP7eMq5mwmuD6zSOLthlLmgFG5wMZPQy2iui5YnM/f7N2VnpUu+EJ44B3bbYqn0vxm3/NipYoPCawgTU6rs9kKAEDnY0q+KKF7a6LWQocSiOrbLFu0wPdGxswu6fDWcPXb8nJEmjpgXGkqKnOFx+uUt6b/Sdmj2nDqdplTE8S3tlO/N7KIJBVFntXeG5khjjZzumc+fgmy+xHt1OVyDYR08fAW8effWjGogXv2joxL9ISZsVq6LkOiWBkSJVNlycdkst95BqfxdFpaZxGeP4/yEDIU8pcOIC68oPuJp/z1AjLJC3+FwfSMObE058PkvE65rDqbGxCX341hsXtflDou/cmzcLyLfjifWl0efJXEgHfT9cczLBwZHTy8OamXvcNmKOusaZvl6I4UwKCxLkPSoOR9Egw/OdrRKIiBwxixwTbpnkXKzxoOHZEIc0db36Igr4YzQ4TBzMTnxez7voOrqArpAJoux/Ccd2pOvsTSPgFj7sQTZqJylREj4uQAj34M5FeJLz0exckZHkg3jeA5Nnf1BVWjprHwcYNV9f0juv9cGTDsWblSliEVhlw/ZOYsLOlRx4NwFuYPCrZ2VLOnMh0XlwONtPa8718FyAQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf63ace-2b59-4b82-1bb5-08dcf44d8241
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:01:31.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEEf4UhE1QibzXhIKX0yU3BW36ZhuQWxRCsKhxa2lKone0Ap4FU/cPQ7q1ULTRxVw7+bDgUF+B5XJxc9qDIJgVvd+3k0cx/9lxIJn128u2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240140
X-Proofpoint-ORIG-GUID: PsFsBa__i72_9PuwDakrraB6Zf3gnUtR
X-Proofpoint-GUID: PsFsBa__i72_9PuwDakrraB6Zf3gnUtR

On Thu, Aug 29, 2024 at 01:25:58AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There is already a test to check that "dtrace -l" sees USDT
> probes come and go as an executable loads and unloads a shared
> library with USDT probes.  (See dlclose1.sh.)  But it could
> also fail if DTrace does not immediately notice USDT probes
> coming or going.
> 
> Introduce a test that allows a grace period before DTrace
> notices a USDT probe come or go.
> 
> There is a deadlib.so here.  It is not needed for the test.
> It simply mimics other, similar tests.  The real thing to do
> might be to put these shared libraries, common to multiple
> tests, in test/triggers.

Perhaps a shared copy might be useful, but then again, these are generated
on-the-fly by the tests.

But keeping deadlib in this test makes no sense, since it is not used.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/tst.dlclose4.r  |   5 +
>  test/unittest/usdt/tst.dlclose4.sh | 225 +++++++++++++++++++++++++++++
>  2 files changed, 230 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.dlclose4.r
>  create mode 100755 test/unittest/usdt/tst.dlclose4.sh
> 
> diff --git a/test/unittest/usdt/tst.dlclose4.r b/test/unittest/usdt/tst.dlclose4.r
> new file mode 100644
> index 00000000..07927a4a
> --- /dev/null
> +++ b/test/unittest/usdt/tst.dlclose4.r
> @@ -0,0 +1,5 @@
> +as expected: USDT probe appeared
> +as expected: USDT probe disappeared
> +as expected: USDT probe appeared
> +as expected: USDT probe disappeared
> +success
> diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
> new file mode 100755
> index 00000000..015bc52c
> --- /dev/null
> +++ b/test/unittest/usdt/tst.dlclose4.sh
> @@ -0,0 +1,225 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +PATH=/usr/bin:/usr/sbin:$PATH
> +
> +#
> +# In this test, we send alternating USR1 and USR2 signals to an executable
> +# that responds by opening and closing, respectively, a shared library with
> +# USDT probes.  After each signal, we check "dtrace -l" to confirm that the
> +# USDT probes are and are not listed, as expected.
> +#
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +#
> +# Set up the source files.
> +#
> +
> +cat > Makefile <<EOF
> +all: main livelib.so deadlib.so
> +
> +main: main.o prov.o
> +	\$(CC) -o main main.o -ldl
> +
> +main.o: main.c
> +	\$(CC) -c main.c
> +
> +
> +livelib.so: livelib.o prov.o
> +	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
> +
> +livelib.o: livelib.c prov.h
> +	\$(CC) -c livelib.c
> +
> +prov.o: livelib.o prov.d
> +	$dtrace -G -s prov.d livelib.o
> +
> +prov.h: prov.d
> +	$dtrace -h -s prov.d
> +
> +
> +deadlib.so: deadlib.o
> +	\$(CC) -shared -o deadlib.so deadlib.o -lc
> +
> +deadlib.o: deadlib.c
> +	\$(CC) -c deadlib.c
> +
> +clean:
> +	rm -f main.o livelib.o prov.o prov.h deadlib.o
> +
> +clobber: clean
> +	rm -f main livelib.so deadlib.so
> +EOF
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go();
> +};
> +EOF
> +
> +cat > livelib.c <<EOF
> +#include "prov.h"
> +
> +void
> +go(void)
> +{
> +	TEST_PROV_GO();
> +}
> +EOF
> +
> +cat > deadlib.c <<EOF
> +void
> +go(void)
> +{
> +}
> +EOF
> +
> +cat > main.c <<EOF
> +#include <dlfcn.h>
> +#include <unistd.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +void *live;
> +
> +/*
> + * Open and close livelib.so, thereby adding or removing USDT probes.
> + */
> +
> +static void my_open(int sig) {
> +	live = dlopen("./livelib.so", RTLD_LAZY | RTLD_LOCAL);
> +	if (live == NULL) {
> +		printf("dlopen of livelib.so failed: %s\n", dlerror());
> +		exit(1);
> +	}
> +}
> +
> +static void my_close(int sig) {
> +	dlclose(live);
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct sigaction act;
> +
> +	/*
> +	 * Set USR1 (USR2) to open (close) the livelib.so.
> +	 */
> +	act.sa_flags = 0;
> +	act.sa_handler = my_open;
> +	if (sigaction(SIGUSR1, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +	act.sa_handler = my_close;
> +	if (sigaction(SIGUSR2, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +
> +	/*
> +	 * Listen for signals.
> +	 */
> +	while (pause() == -1)
> +		;
> +
> +	return 0;
> +}
> +EOF
> +
> +#
> +# Build.
> +#
> +
> +make > /dev/null
> +if [ $? -ne 0 ]; then
> +	echo "failed to build" >& 2
> +	exit 1
> +fi
> +
> +# Define a function that looks for the USDT probe with "dtrace -l".
> +# For debugging, one could also check:
> +#     ls /run/dtrace/probes/$pid/test_prov$pid/livelib.so/go/go 
> +#     ls /run/dtrace/stash/dof-pid/$pid/*/parsed/test_prov:livelib.so:go:go 
> +
> +function check_USDT_probes() {
> +	$dtrace -lP test_prov$pid |& awk '
> +	    /ID *PROVIDER *MODULE *FUNCTION *NAME/ { next }
> +	    /test_prov'$pid' *livelib\.so *go *go/ { exit(0) }
> +	    /No probe matches description/ { exit(1) }'
> +	return $?
> +}
> +
> +# Define a function that checks loading the library:
> +# send USR1 and wait up to 6 seconds for the USDT probe to appear.
> +
> +function load_lib() {
> +	kill -s USR1 $pid
> +	for iter in `seq 6`; do
> +		sleep 1
> +		if check_USDT_probes; then
> +			iter=0
> +			break
> +		fi
> +	done
> +	if [[ $iter -ne 0 ]]; then
> +		echo did not see USDT probe
> +		kill -s KILL $pid
> +		exit 1
> +	fi
> +	echo as expected: USDT probe appeared
> +}
> +
> +# Define a function that checks unloading the library:
> +# send USR2 and wait up to 6 seconds for the USDT probe to disappear.
> +
> +function unload_lib() {
> +	kill -s USR2 $pid  # send USR2 to unload library and USDT probe
> +	for iter in `seq 6`; do
> +		sleep 1
> +		if ! check_USDT_probes; then
> +			iter=0
> +			break
> +		fi
> +	done
> +	if [[ $iter -ne 0 ]]; then
> +		echo still see USDT probe after timeout
> +		kill -s KILL $pid
> +		exit 1
> +	fi
> +	echo as expected: USDT probe disappeared
> +}
> +
> +# Start the process.
> +
> +./main &
> +pid=$!
> +sleep 2
> +
> +# Check.
> +
> +load_lib
> +unload_lib
> +load_lib
> +unload_lib
> +
> +# Clean up.
> +
> +kill -s KILL $pid
> +wait $pid >& /dev/null
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
