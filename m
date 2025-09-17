Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6426E16A
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758139545; cv=fail; b=UFoWk/5RyUCnR3rv9yvNATZSieSpAf9EoxVf61tlXxWQ+O5dTSdKOGRJN0JdL54FLgUZ6DkYkV39cmo+ZGN/SpwxpraO6tXYgazoPp7bbsJ8Ax8qqGClAG4ppdzNh2Po9eCcgrHdjpQrmrnus12tOrErKmI0pidTB01rmvAFxOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758139545; c=relaxed/simple;
	bh=P2gb4BlraPzSGJr8m1ukdSQFOkSLxOSYfOAfx50xlGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HBGpCNnUBwys+P5a3M8UrrJNhSsDdzOzXQa/zTRYHpjhhFETNSKrxsiduVXjk00lvBQWFQvJ8QGQC1waJYcDYd8S50BRNVq1ieLxNgINYKGvMarFpCpoLWud6Ot3Ls7QvBCAAMWRXcRh5GwQ45gL66ox54fvpYLoGrB95b+b7vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=shh866Hd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k/6l68yf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="shh866Hd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k/6l68yf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEITRn007388
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0OuIh7W0KYqXxpawaAE3WG2igPfJtt1TMAJFpWfcVtI=; b=
	shh866HdGqIGokYYJkKd8ExNWs6Rs5ic1GiJ/2FFX/GqXwbOqP/lmHsiD8xNHz+z
	iG0qma8jJ3O0K3+dRSYFHW1jpFgSZTZO9gWk3QvOrGpOyympEDFObfWMwPD6Mtmb
	lFD5QOHVoH9kYtT7T5Nkd4GPttNy9Mr6wKB8qKhnjsdvj2uTLOz24HIj3uB5YPW1
	5QgEIKTGDQrNjnnXCyZJ+06NVBWzqq/vqadidOw/nCw2TXjSrnjMcqBg7lnBcExB
	v05zfcdeiVcN9+YY3jSZQkLC1NoBvOt5Mjjkoo8P7QXCFrOdy/ivUBJ3IRn00Jcu
	los0fK51U3yTwbWFV/iykA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9237c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:05:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HJ0aBp001486
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:05:39 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2efgcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 20:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXA8Zxwe7IHsT8kIt4/ciLULy23YGREypvyRQDIRkKpiK09aOyb+OmmqtYLSHOPCP0tkWabcC060MWmUJsP7EhHoUCuNS5zWGsxjB/B9PU5vVWS/hSHvtfPdAiA34VaNxu8rmcAiZJSFE48X1gYRFteDkmkpRIFnbafFZCxaBeFIDN9DQ7mjcWQNI/Wl5GPC8DR1Eocu9SV4y7ujYYB9WZbquDf1YREfn574Lc/BXCN0GOyhtePVasIZ2JmQ7a4BoU1d9LaPdPfZedqndw4JNouQu0AhIu+sMGkrs8roG4syQhPH5uliGeTiKrl3/I+CL00wygeKg0ZAKDnuPrGs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OuIh7W0KYqXxpawaAE3WG2igPfJtt1TMAJFpWfcVtI=;
 b=R0iC7lnnArckiMrONT9v87Qa9WE7cslipX7tGUjj/yk+RlC7qH+SF76HLBIMAdPGF3lfWT+OXlkI/rWT/Riqd6YK1SuHLwbME+IiWKj7ES1jQ1zG+LtFFE+qKsDjJP+Nz6b2sKWs6xZS1RkZHrAAhjMqEWAcloIjQil2hSQadCyPjzXxgPl5wCp9MgqvX1ZzJQhP/i55vO4tSMdbsBdVOh6OWDa9p0ZVARn0YxgmP2kYIcsY8pvqzD3JKsr3EOl0T/N3Fw1duuiKTTuRa+91HPsdzPqGL+0pbOdtzHFhxni/yodenLVqlXunAppyQjIljbA3Yp/TfQVJB0gOUeAkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OuIh7W0KYqXxpawaAE3WG2igPfJtt1TMAJFpWfcVtI=;
 b=k/6l68yfV4cij140UzRJK74I6lkfrIB8oS2ofLh20fLkvWCCYErQTGw0MDYpBtVAgI98KfB6JZVfSrDk/BPxUktsUZ8ISRsFklx0O7aZ2kxtOE0WoxCowxOJvteJvSgFYX5YN5Ba7juYXOS0KGFcTknDN3VA6YSCXuKw9eDDyNg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5663.namprd10.prod.outlook.com (2603:10b6:a03:3db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 20:05:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 20:05:01 +0000
Message-ID: <040a1b97-d03f-4ed8-3275-27d49b651b44@oracle.com>
Date: Wed, 17 Sep 2025 16:04:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Allow probes not to attach if they were not "needed"
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250904190226.31242-1-eugene.loh@oracle.com>
 <aMrzOJRUSYNzBGIv@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aMrzOJRUSYNzBGIv@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:207:3c::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: caae93dc-ad09-4eb4-5ace-08ddf6257bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czBTUS9heE5YbXovek1scmxZVlcxTGdaKzlBays0dVoycWo5REJQcVdGMFRX?=
 =?utf-8?B?cUViZ1hEUzFyZWt4OEsyTXVBSTFFQjNKVW9McHoyT3cvVFU4Rm5sbnBVakcx?=
 =?utf-8?B?RThxanhQVTlZTXRnVkRwc2NUTlh3YkxOcmZsMXVSY0Vqd2cyVXpNL005SFpU?=
 =?utf-8?B?aEhNQi9aT0hPdlhERlZEeG44ZGNHcXlOWm9zSlFKanh1U0FoK1VYM1RtcTk1?=
 =?utf-8?B?NkZYSDA0MU81enJCRWx4UGVDNi83cDRTYkJGZisyaTl6QzRqN0F6eXI2MjFm?=
 =?utf-8?B?K1NZZ3pXalQ4czBTMGMzUmtXRTlPd3BpY1ExV09YYnBlL0pJck9ITVR0TG9Y?=
 =?utf-8?B?VWt4djRYTGpPblAxSytmbnRrUUpPVTgvdWZmRUNjN01VT3NmUFpRMnR1aEdS?=
 =?utf-8?B?dTYrV29KcExOcTMrcFFBZlJxSWE0VnVFdXhqYkg1U0NqaUZTLzJTTzA4ZXdS?=
 =?utf-8?B?U083S1FYRmMzMEd5TkU1QS9jYkd1eVpZMmJnTEt6MDVuTDlyZ0ZsMFBQY0M0?=
 =?utf-8?B?aCs5aDdObWdCS0xUem00RWNJREw5UnVhZ2hYcTl6VWUyVmIyemxjNTloVURZ?=
 =?utf-8?B?VDVUcmZqcmVhUm9QVmJEQk5VYWpVVXRmTmdGYmtJQ2xONW9PQXFiNkR2TlM0?=
 =?utf-8?B?QXZDOUhYUy94QkJWRHFUQVZMd0ZadGM0ZEtuUFY1eTZQL29zVEg5bXhjVnNt?=
 =?utf-8?B?UVc0K1YwdWIxVjV1cTFqM3prbHJSdUJOK09wZzR3SklSOHJFMW5waGJuVVl1?=
 =?utf-8?B?TTBrNXhTR1Y0Z053dmtQTU1VR2wyZEJRZWVZZ2dKeGpFdFV3cnBVU2xHWnNR?=
 =?utf-8?B?RlZMWkJzY1IrUTI2Nzh2RTNJOEtMTnIrazAxV2ZVSG03Mld2TmkvRUZtU0tS?=
 =?utf-8?B?MVB4VzRhcG5vZG00STVDZDJEVnYyM0pCOTJnTTc5UjcycTc1ZlFKRmVHQWt5?=
 =?utf-8?B?aHpDZ0xEek5KQzZqdFZRcmRRNlZKb2ZWdlk4aU41SzM2NVM4akhLZDZYWXh6?=
 =?utf-8?B?c202cnh5Qm8xZWpKbDY1ZEY3TVF2Y256cE9xem5IL3Vhd05FSkxCNG5iSzR5?=
 =?utf-8?B?Wi9uNWtQRWkzWnpYa2pDUk02UEdBV1hyWXRNQmdqcXNrUXlSMllLaFI0R0dV?=
 =?utf-8?B?MXZCQ2pwU1hmSENhaXd4cWc0OWNtWlZIcXZwU2U2NUNkVGdZZmsxNy9WZmNN?=
 =?utf-8?B?R3VZbHpxWjNpdW1NalJ2NnM1Qk01TGllRmE5U05qRjJ3N0l2aEdNblRWRkZN?=
 =?utf-8?B?ME9IYTgzRko5UjByd1BSR3pGT2l2ZG1SZURZL2ZGV0NkZTFZV1g4dXlaUldB?=
 =?utf-8?B?Q2trc3RJdXZXT2Z6ZmpTZWZ4RGFXM0N2ZG9nK2FuTXNlWGFrbkplbTJYZWpG?=
 =?utf-8?B?ZEQrL2lUQzFpaFJ6bEl0SVJmUnRsWjBBNmN1RXRLQVI3VVg0TndSeWFPWTBC?=
 =?utf-8?B?YkZJY0ZUanQ4YXZJQWtnTEFjb0dxbUIwMkZPZmJOWGVBY2pyOXg2SHNXdDEv?=
 =?utf-8?B?ZFJpcEJMd1RoVjlWZVlGOHRZLytTOEM0UlFHWE8yZ2VSOHVNYVliRE9lRnNa?=
 =?utf-8?B?V2JFVWlzVHJXaTV4Vmc3ZEhpQUYrcFRGajRxcG9WVEltQ3Z0RGZoMnNocjE1?=
 =?utf-8?B?K2FKamhRdXU2MUZVdHBkYUg1ZTF3VGVyN3RUczdVZWZ6MW9SZ2JiQmFkNDl6?=
 =?utf-8?B?MHBMUllpMTZCWGZKTVNkdm1aWmM1TU43dzVKY2VkcU9kczdhS0poMTkyQmRS?=
 =?utf-8?B?akhlbHZXV0ZrdWxDc29GTkJGRFMxOG9mVzVLeWFNTlVId3p6dU1UTE5maXFm?=
 =?utf-8?B?ZDNSRTd2TWxQTTY3UzFyUVZOT1BjY3p2V2kzOTc0QTNiTllhVnVOMENvZDNu?=
 =?utf-8?B?MTJrTVlkNTZzc0xwNXdkdXZ4a01LYjNMdmk4R3ZxYlMxdlEyTyt2UGtvME1Y?=
 =?utf-8?Q?ElL8UsCtnYs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHR4UVM2dUFnWEhMZXZXbjBhUkJ3d3BUcGlHZEpGYWRsYXQzMzdaYmx2RDFY?=
 =?utf-8?B?WEtESnNJelhYdFJMM1Z6U1B3ZkVoV1BST2tqN3l1VWRwQ1lmeTZxUy9jQ3Fk?=
 =?utf-8?B?UGxDZ1oxdkx3RHJ4OVVGeHRBS21FUmE1OU9CQ1B2akY0UTdhZ1FPR01sWWh3?=
 =?utf-8?B?dm1rdUFCNlozVmFXWjNDMkJOWll1Y1BXUDliYkFWbjNSTHY0bGZ3SUhMWmFq?=
 =?utf-8?B?cm1SVmpZNStnVDhtOVQrenE1ajdIUzB1czduOHk2TkgxOVBiRjRlOVZRTmdu?=
 =?utf-8?B?azZKTW1oOU5FRkFUL1NkWHVmZjNTZ0NkbWJ6b1pJWmtWbXBHOGU1L3VSTGlw?=
 =?utf-8?B?dmNuZXAydk1Rc0VVRjNWRGg3ODRxMVMxbXkraDhlWHorMUhzNTgrMit6RC9m?=
 =?utf-8?B?c3dDYTQ0ZUlTclFNOVRNb0RxRUNRNG5STUZOcDljUExNbVV1RmRqVFlLUXk0?=
 =?utf-8?B?S0JnQjlvaGNxOWlYcVB5N3dBb29jRzdzbCtpTTN0alFsMEJNQlVZODVNcVZ0?=
 =?utf-8?B?RktMU0VmR2wyaFlta2lZZjZEOTduRXBhS283MjlROW8xRnRjbDY3Q0x5Sk5O?=
 =?utf-8?B?TEFDZDZrZWtHaTdrYmM1RTU3WXdHTjFjK1ZRTnpmc3ZEcHFOU1ZEbEZHOXhX?=
 =?utf-8?B?UXJlWUREU212MEo2QzN1VC9RejUvZjZ3L0wrS29IZ3ZtUFlLSnlpUmJYZ1p4?=
 =?utf-8?B?bmhEYk1qaTBtSW5YMjZDT1VEejVlWklJUXlBSjA1ellyOFRqaGFBNlozMGJF?=
 =?utf-8?B?NjVwR0Y5WkFOUGU5cnZTZjlGeVlYM1gyYnRHZWQrWHJVSXQ5azNXRWJxY1lT?=
 =?utf-8?B?c0t4LzRrdFdTUVpwdTBlTWd0TU5WbTFOem5hL1lLbkFoWUN1ZmVSRzNDSDg1?=
 =?utf-8?B?Zi9wWW5SMmZmN1VnTUxGZ0xKc2hzdUtiYnA3aXoreDNkdHhvVlZrR1QySUNK?=
 =?utf-8?B?aG1FYVpjK29oMXNubjRQM0xzM2JYMnhTSGFXb25IV3RzZWtlSGhYNUZvd0Ju?=
 =?utf-8?B?L0J0NEl1YVM1QjU2Tk83RzZpR1pFVk1VTTJYMTc4blEzR3ZHMlo2c21ua2dq?=
 =?utf-8?B?b3VnWERMQ3dlTi9BZkpESGROeHAzSmJBTUtlQU5nU1BhS2Zjd2g3U3RkbkFC?=
 =?utf-8?B?aWl3a2xGWCtvL3pvQzFmZTVOa0ZVYzMrNEhBZDZ4UDdZTzBsQjlkSmZrWGNa?=
 =?utf-8?B?eER2Q2JVY3ozckh4Qy9wWC9ZbVNNTGYzTk5JVjBiTUhFUHExS3BPUjF0bXpX?=
 =?utf-8?B?UDVTOU14M1J4ZWxjbXRvdXFwaTZKd0JpcHVtRXRYNnZHMEE0UGFkLzVzeHNN?=
 =?utf-8?B?WDlrdWVQd0VTbEJNcjQ2R3lrQUtIUUt3VGhjdElVRC9pZ1o2ajA0dXo3YXcv?=
 =?utf-8?B?VVJIb3hsa3B1cHFJTVMyTkV0RE9RSW40c0hXSUJ4U1NTcFc0QklDOVZ1MC8z?=
 =?utf-8?B?VmRWNS9HamowR01CMXJVc3JtdFBlR0lJY0xhSTQ1Z3AvUkUxTWhCQW1ReHFx?=
 =?utf-8?B?UXh6NDdzMW5uVTM5M21QRmtWMXp6RVVtUkR0N3U0MUVuSnBWeXBvbEk1WWhT?=
 =?utf-8?B?RlRrMEZleVFYTmhqbmFPUE1Ga0E0MVJINEEyMnN1eEJOK1JUc3JrcmVQYnFM?=
 =?utf-8?B?aE5KSTRrV2N4WEp5cFlMNWovbzNTcHVkNkxtUm00WG1ONkxOQnY5N2E0aDUw?=
 =?utf-8?B?VVc3NXowOFFLZ1pZTGF4NzNSaHFVQzJrd3ZxWlRmeWZCT0NkQkdqTFcvbjB4?=
 =?utf-8?B?c0FwU3lucERSK3B4WnRTbmdoUnFsbzBPNEZ6ckRFY0l4blE0d1F0UHN1dnMx?=
 =?utf-8?B?azF2MDJ4ZFJWUHRmOU1iRXd3YVNyenVNY2JDZ0JobnB1OXVyNHRnYTJWbStD?=
 =?utf-8?B?TDhZWGJFZTh2ckxEbzk1UXFmRDBDR2J2blVYODBqejVUaGE3b1lXUVYwQnFO?=
 =?utf-8?B?NXhmSitEZ2tGUld6YUdNdEtmZGJ0bHRoUEJrWFFqNkgrb2JBUVl0bkFaVVZS?=
 =?utf-8?B?UTdyRDN4WmNGMUZOTjdjL01lQko4a0I5dlNETjRHUjd2dGNCM1B1VHNQS2dB?=
 =?utf-8?B?cFpjUzRRZW5QL01IVzhscDdYd1J3OGF4VzlURmJrUDhJYjlpcmlxNkFhNjZo?=
 =?utf-8?Q?dWA5vSq5V8lhfRb9HqUtLMqFV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CBEinlN9N1p5cZ50qL6pZESXcdRxbo7ijm8bvNPqxkmKbKtaJ7e0KKPi7xJB82vOyXNnL03v6NPFYiSkEyfb0GOE3yEKHInW1Y5aRcOjAbC9qKsH6NyvmMiW0cmeqDNLgYvLA3AVHdYzLfpOASXdUlCUR0nqd5NitCFGkAjXGEBT41Pt+sx+cqc/VBaTzPWbK01Qe4kBwlU1ZxB/5wfyxf5Tbr3JSYCd/fB1OXO6HEcYTTQKr+KqzWTd4GSuM7HbQpQQW26xc+cLPMgPFOLTtDKvwbVcQGu2pfzB3CR3nEucy5dgFRErdSaJBqt1BdvlMk7Jr7hxsYeW0wd6kSQRzPKX/wYpOVnxTi9vkC53LzaQbTNFXDA9QYPkLxbUscjxbWwOt4YuQ0Evx3b6mLTZkmuZKTtMqz5Nsxyz7ySw7P5cddgwXjLPOAfOLw1s9SWH3LTzzt4iXnfYhSHhMMzuoX+0U7c0ikCmZAkv8o/nSzw0oKWcWXTJCfcIICr6kMastGuEGwGQmahD1kI1+JPwBLbyEhLbsB7tQS9jOo4AtfXAjx8lTSZBzi8cXoWYXSRk1qOkGxz4ywNkqZjSFqTbLtPtXpt2xhkk2eq50c8MLfk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caae93dc-ad09-4eb4-5ace-08ddf6257bcb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 20:05:00.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X70tjNqTrbLY9agNzXczI3O7Iuz4MnBqnNkeDAAjflGBl+omKIr7QJaCVaUEcuqUjgHvUmj4Z0OU+2Y4cZyf3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509170195
X-Proofpoint-ORIG-GUID: U7GqUuMJyGbW5eiLTVj86-t7C4JUFFy0
X-Proofpoint-GUID: U7GqUuMJyGbW5eiLTVj86-t7C4JUFFy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/ZdMoYs/q7of
 wKJ9qRaQ/4/bxfLY9HP0Hc4JbtoT1S/tuuMu6OeP/XmZo5GWuP/Xc/avQMFldzns8bBWlHrqL5V
 +poGskYAzo8ZldjOdw6mAInpnafLIGtvj+2kJjfb5SvNY/g/LJFaxTjmzKlDx6jZ/fut5h7+Yh5
 o9oADoe+GfW2OLwTXQ0GSOlHNlK6M1fTg75vtb1twffwmSY1TRPqdOAiQxH9jaZogsGh2fGIEmJ
 EeU3cvi25cKYrQ/KUsn/2RU7MVYBUwAStQEHwoNlzFFKRgDgPalc3deHgOu7X6pBquShAU8h2Hv
 7jpWnv1meNI1h4cAeIz7CfSj22Vy6vZcj+81VUzpKtyb5glZDoU8wfRcqDWnnmzOrwNPeqrl+bp
 xnIGT9aD
X-Authority-Analysis: v=2.4 cv=N/QpF39B c=1 sm=1 tr=0 ts=68cb1494 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=mJyVdKuwy1mpQMmB:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=fpy_dlXJoFd5jfCSyI4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 9/17/25 13:43, Kris Van Hees wrote:

> I think this is actually counter-intuitive.

I certainly agree.  And I wrestled with this a lot.

A "default" is overridden if any alternative is specified.  In the case 
of this patch, if a probe comes from two probe descriptions, one that 
requires the probe and one that does not, then the "required" case 
should prevail.  So it is not a default.  There is something non-default 
about needing a probe to attach.

Another complication is that when we walk probes based on a 
user-specified probe description, which is when we decide whether a 
probe will have to attach, we are simply "inserting" probes;  this is 
well before probes are enabled.  Probes are enabled later, when we no 
longer are dealing with user-specified probe descriptions. (If I 
remember correctly.)  So we have to mark probes well before we enable them.

I agree there is something counterintuitive going on here, but I find 
the second list of enablings to be even harder to fathom.

Further, a second list of enablings strikes me as a funny creature. 
Today, a dt_probe_t is really just a dt_list_t with a bunch of extra 
"probe" stuff hanging onto it.  That is, a dt_probe_t is an item on a 
single, particular linked list.  Clearly, we could change it so that a 
probe could exist on two different lists, but that gets disruptive.

I'm not saying that the patch is the only way of solving the underlying 
problem.  I do think, though, that having a reasonable patch that solves 
the problem and tests well is attractive, and there is no need to 
explore other solutions.  "Good enough" is good enough, and it is not 
worth spending time exploring other solutions.  There is so much to do 
and so little time.  I vote for the patch that is working and reasonable.

> In general, probes are expected
> to be able to be attached to or else an error is to be raised.  There are
> exceptional cases where a failure to attach should not be considered an error.
>
> So, I believe that the implementation should by default expect that failure to
> attach is an error.  Introducing a flag is certainly an option (though I would
> expect it a flag to mark the probe as *optional*), though another approach that
> might be worth exploring here is to introduce a 2nd list of enablings, named
> dt_opt_enablings, and add optional probes to this list.  That way you could
> refactor the construction and loading of programs into functions called for a
> given probe, and just loop through the mandatory enablings first, and then the
> optional ones.  That avoids adding a flag and also differentiates the two types
> of enablings explicitly.
>
> On Thu, Sep 04, 2025 at 03:02:26PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Various kernels prevent the placement of uprobes on particular
>> instructions -- e.g., on x86 on hlt or multi-byte nops, or on aarch64 on
>> autiasp.  This means, for example, that one cannot place a pid probe on
>> every possible instruction.  If a user explicitly places a probe on a
>> forbidden instruction, an error message indicates there is a problem.
>>
>> On the other hand, if the user specifies a wildcard in a pid probe
>> description, we should skip instructions where no uprobe can be placed.
>>
>> The problem is that we do not find out an instruction is problematic
>> until we try to attach, which is long after probe descriptions have been
>> processed.  And when we walk probe descriptions, we do not have
>> information about which kernels and instructions are problematic.
>>
>> The motivating problem pertains to pid probes, but we would like
>> a provider-agnostic solution.
>>
>> Introduce a "NEEDED" probe flag.  Set the flag when a probe is explicitly
>> needed (say, it was specifically named).  We use two such flags:
>>
>> * In dt_probe.h, DT_PROBE_FLAG_NEEDED is used for the "flags"
>>    member of dt_probe_t.
>>
>> * For pid-style probes (including USDT and stapsdt), in
>>    include/dtrace/pid.h, DT_PID_PSP_FLAG_NEEDED is used for
>>    the pps_flags member of pid_probespec_t.
>>
>> Set the "NEEDED" flag for a probe in these situations:
>>
>> * In dt_tp_probe_insert(), set the flag for each probe we insert.
>>    This covers the dtrace, fbt, rawtp, sdt, and syscall providers.
>>
>> * In dt_sdt_populate(), set the flag for each probe we insert.
>>    This covers, e.g., the io, ip, lockstat, proc, sched, and tcp
>>    providers.
>>
>> * For the cpc and profile providers, set the flag for probes created
>>    with the "provide" functions (explicitly requested by the user)
>>    but not with the "populate" functions (chosen by default by dtrace).
>>
>> * For providers that will sit on underlying probes, set the NEEDED
>>    flag for pid_probespec_t.  Specifically,
>>
>>    * In dt_pid_per_sym(), set the NEEDED flag to cover entry,
>>      return, and explicit offsets.  Unset the flag for glob offsets.
>>      In dt_pid_create_usdt_probes_proc() and dt_stapsdt_parse(),
>>      set the flag.
>>
>>    * In dt_prov_uprobe(), pass the pid_probespec_t NEEDED flag
>>      to dt_probe_t, for both the overlying and underlying probe.
>>
>> In dt_bpf.c, if the return code from the attach function indicates
>> failure, return a failure only if the probe was NEEDED.
>>
>> Remove the old check on "hlt" instructions, since it was not sufficiently
>> general for other kernels and other problematic instructions.
>>
>> Existing tests that expose the problem are
>>
>>      test/unittest/pid/tst.coverage.d
>>      test/unittest/pid/tst.emptystack.d
>>      test/unittest/pid/tst.entry_off0.sh
>>          hlt instruction on x86
>>
>>      test/unittest/pid/tst.float.d
>>          multi-byte nop on x86 on newer platforms
>>
>>      test/unittest/pid/tst.entry_off0.sh
>>          autiasp instruction on aarch64 on newer platforms
>>          depending on how the trigger process was built
>>
>> A new test is added to check that a probe set explicitly on a
>> problematic instruction will still lead to an error.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   include/dtrace/pid.h                   |  3 +++
>>   libdtrace/dt_bpf.c                     |  2 +-
>>   libdtrace/dt_pid.c                     | 10 ++++------
>>   libdtrace/dt_probe.h                   |  3 +++
>>   libdtrace/dt_prov_cpc.c                | 10 ++++++++--
>>   libdtrace/dt_prov_profile.c            | 10 ++++++++--
>>   libdtrace/dt_prov_uprobe.c             | 18 ++++++++++++++++++
>>   libdtrace/dt_provider_sdt.c            |  8 ++++++--
>>   libdtrace/dt_provider_tp.c             |  7 ++++++-
>>   test/unittest/pid/err.needed.aarch64.x |  3 +++
>>   test/unittest/pid/err.needed.sh        | 23 +++++++++++++++++++++++
>>   test/unittest/pid/err.needed.x86_64.x  |  6 ++++++
>>   test/unittest/pid/tst.entry_off0.sh    |  4 ++--
>>   13 files changed, 91 insertions(+), 16 deletions(-)
>>   create mode 100755 test/unittest/pid/err.needed.aarch64.x
>>   create mode 100755 test/unittest/pid/err.needed.sh
>>   create mode 100755 test/unittest/pid/err.needed.x86_64.x
>>
>> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
>> index 8ddb1167e..7829e47c0 100644
>> --- a/include/dtrace/pid.h
>> +++ b/include/dtrace/pid.h
>> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>>   	size_t pps_xargvlen;			/* (high estimate of) length of array */
>>   	int8_t *pps_argmap;			/* mapped arg indexes */
>>   	char *pps_sargv;			/* list of arg sources */
>> +	int pps_flags;				/* flags */
>>   
>>   	/*
>>   	 * Fields below this point do not apply to underlying probes.
>> @@ -55,4 +56,6 @@ typedef struct pid_probespec {
>>   	uint64_t pps_nameoff;			/* offset to use for name */
>>   } pid_probespec_t;
>>   
>> +#define DT_PID_PSP_FLAG_NEEDED	1		/* probe is needed */
>> +
>>   #endif /* _DTRACE_PID_H */
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 31781ac9f..dc3d47f56 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -1385,7 +1385,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>>   		if (prp->prov->impl->attach)
>>   			rc = prp->prov->impl->attach(dtp, prp, fd);
>>   
>> -		if (rc < 0) {
>> +		if (rc < 0 && (prp->flags & DT_PROBE_FLAG_NEEDED)) {
>>   			close(fd);
>>   			dt_attach_error(dtp, rc,
>>   					prp->desc->prv, prp->desc->mod,
>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> index 4af9141aa..6e7fba287 100644
>> --- a/libdtrace/dt_pid.c
>> +++ b/libdtrace/dt_pid.c
>> @@ -184,6 +184,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   	psp->pps_fun = (char *) func;
>>   	psp->pps_nameoff = 0;
>>   	psp->pps_off = symp->st_value - pp->dpp_vaddr;
>> +	psp->pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>>   
>>   	/*
>>   	 * The special function "-" means the probe name is an absolute
>> @@ -386,15 +387,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   #define disasm(x, y) 4
>>   #endif
>>   
>> +		psp->pps_flags &= ~DT_PID_PSP_FLAG_NEEDED;
>>   		for (off = 0; off < symp->st_size; off += disasm(off, &disasm_info)) {
>>   			char offstr[32];
>>   
>> -#if defined(__amd64)
>> -			/* Newer kernels do not allow uprobes on "hlt" instructions. */
>> -			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
>> -				continue;
>> -#endif
>> -
>>   			snprintf(offstr, sizeof(offstr), "%lx", off);
>>   			if (!gmatch(offstr, pp->dpp_name))
>>   				continue;
>> @@ -1064,6 +1060,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>>   			psp.pps_pid = dpr->dpr_pid;
>>   			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
>>   			psp.pps_nameoff = 0;
>> +			psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>>   
>>   			if (nargv) {
>>   				psp.pps_nargc = probe->probe.nargc;
>> @@ -1421,6 +1418,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>>   		psp.pps_inum = pmp->pr_inum;
>>   		psp.pps_pid = dpr->dpr_pid;
>>   		psp.pps_nameoff = 0;
>> +		psp.pps_flags |= DT_PID_PSP_FLAG_NEEDED;
>>   
>>   		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
>>   			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
>> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
>> index 2a78cb9ca..ffd994844 100644
>> --- a/libdtrace/dt_probe.h
>> +++ b/libdtrace/dt_probe.h
>> @@ -53,10 +53,13 @@ typedef struct dt_probe {
>>   	uint8_t *mapping;		/* translated argument mapping */
>>   	dtrace_typeinfo_t *argv;	/* output argument types */
>>   	int argc;			/* output argument count */
>> +	int flags;			/* flags for the probe */
>>   	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
>>   	dtrace_difo_t *difo;		/* BPF probe program */
>>   } dt_probe_t;
>>   
>> +#define DT_PROBE_FLAG_NEEDED	1	/* probe is needed */
>> +
>>   extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
>>   extern dt_probe_t *dt_probe_create(dtrace_hdl_t *, dt_ident_t *, int,
>>       dt_node_t *, uint_t, dt_node_t *, uint_t);
>> diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
>> index 57b11b135..9fb165cb6 100644
>> --- a/libdtrace/dt_prov_cpc.c
>> +++ b/libdtrace/dt_prov_cpc.c
>> @@ -347,6 +347,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   {
>>   	dt_provider_t *prv;
>>   	struct perf_event_attr attr;
>> +	dt_probe_t *prp;
>>   
>>   	prv = dt_provider_lookup(dtp, prvname);
>>   	if (!prv)
>> @@ -358,17 +359,22 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   		return 0;
>>   
>>   	/* return if we already have this probe */
>> -	if (dt_probe_lookup(dtp, pdp))
>> +	prp = dt_probe_lookup(dtp, pdp);
>> +	if (prp) {
>> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>>   		return 0;
>> +	}
>>   
>>   	/* check if the probe name can be decoded */
>>   	if (decode_probename(&attr, prv, pdp->prb) == -1)
>>   		return 0;
>>   
>>   	/* try to add this probe */
>> -	if (cpc_probe_insert(dtp, prv, pdp->prb) == NULL)
>> +	prp = cpc_probe_insert(dtp, prv, pdp->prb);
>> +	if (prp == NULL)
>>   		return 0;
>>   
>> +	prp->flags |= DT_PROBE_FLAG_NEEDED;
>>   	return 1;
>>   }
>>   
>> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
>> index e1369ca9b..ec32ce83b 100644
>> --- a/libdtrace/dt_prov_profile.c
>> +++ b/libdtrace/dt_prov_profile.c
>> @@ -160,6 +160,7 @@ static uint64_t get_period(const char *name)
>>   static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   {
>>   	dt_provider_t	*prv;
>> +	dt_probe_t	*prp;
>>   	int		kind;
>>   	uint64_t	period;
>>   
>> @@ -176,8 +177,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   		return 0;
>>   
>>   	/* return if we already have this probe */
>> -	if (dt_probe_lookup(dtp, pdp))
>> +	prp = dt_probe_lookup(dtp, pdp);
>> +	if (prp) {
>> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>>   		return 0;
>> +	}
>>   
>>   	/* get the provider - should have been created in populate() */
>>   	prv = dt_provider_lookup(dtp, prvname);
>> @@ -189,9 +193,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   		return 0;
>>   
>>   	/* try to add this probe */
>> -	if (profile_probe_insert(dtp, prv, pdp->prb, kind, period) == NULL)
>> +	prp = profile_probe_insert(dtp, prv, pdp->prb, kind, period);
>> +	if (prp == NULL)
>>   		return 0;
>>   
>> +	prp->flags |= DT_PROBE_FLAG_NEEDED;
>>   	return 1;
>>   }
>>   
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index 07b26f20f..2396522ce 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -960,6 +960,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>>   	} else
>>   		upp = uprp->prv_data;
>>   
>> +	/*
>> +	 * Pass flag info from psp to uprp
>> +	 */
>> +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
>> +		uprp->flags |= DT_PROBE_FLAG_NEEDED;
>> +
>>   	/*
>>   	 * Only one USDT probe can correspond to each underlying probe.
>>   	 */
>> @@ -1049,6 +1055,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>>   	/* Look up the overlying probe. */
>>   	prp = dt_probe_lookup(dtp, &pd);
>>   	if (prp != NULL) {
>> +		/*
>> +		 * Pass flag info from psp to uprp
>> +		 */
>> +		if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
>> +			prp->flags |= DT_PROBE_FLAG_NEEDED;
>> +
>>   		/*
>>   		 * Probe already exists.  If it's already in the underlying
>>   		 * probe's probe list, there is nothing left to do.
>> @@ -1091,6 +1103,12 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>>   		return -1;
>>   	}
>>   
>> +	/*
>> +	 * Pass flag info from psp to uprp
>> +	 */
>> +	if (psp->pps_flags & DT_PID_PSP_FLAG_NEEDED)
>> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>> +
>>   	/*
>>   	 * Add the overlying probe to the list of probes for the underlying probe.
>>   	 */
>> diff --git a/libdtrace/dt_provider_sdt.c b/libdtrace/dt_provider_sdt.c
>> index 962848485..f9a51fa25 100644
>> --- a/libdtrace/dt_provider_sdt.c
>> +++ b/libdtrace/dt_provider_sdt.c
>> @@ -48,10 +48,14 @@ dt_sdt_populate(dtrace_hdl_t *dtp, const char *prvname, const char *modname,
>>   	 * entries to identify the probe names.
>>   	 */
>>   	for (arg = &probe_args[0]; arg->name != NULL; arg++) {
>> +		dt_probe_t *prp;
>> +
>>   		if (arg->argno == 0 &&
>> -		    dt_probe_insert(dtp, prv, prvname, modname, "", arg->name,
>> -				    NULL))
>> +		    (prp = dt_probe_insert(dtp, prv, prvname, modname,
>> +					   "", arg->name, NULL))) {
>> +			prp->flags |= DT_PROBE_FLAG_NEEDED;
>>   			n++;
>> +		}
>>   	}
>>   
>>   	return n;
>> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
>> index 3d4ec1e03..4531a88a8 100644
>> --- a/libdtrace/dt_provider_tp.c
>> +++ b/libdtrace/dt_provider_tp.c
>> @@ -368,12 +368,17 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>>   		   const char *mod, const char *fun, const char *prb)
>>   {
>>   	tp_probe_t	*tpp;
>> +	dt_probe_t	*prp;
>>   
>>   	tpp = dt_tp_alloc(dtp);
>>   	if (tpp == NULL)
>>   		return NULL;
>>   
>> -	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
>> +	prp = dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
>> +	if (prp)
>> +		prp->flags |= DT_PROBE_FLAG_NEEDED;
>> +
>> +	return prp;
>>   }
>>   
>>   /*
>> diff --git a/test/unittest/pid/err.needed.aarch64.x b/test/unittest/pid/err.needed.aarch64.x
>> new file mode 100755
>> index 000000000..bd5b41a36
>> --- /dev/null
>> +++ b/test/unittest/pid/err.needed.aarch64.x
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +echo "skip on aarch64"
>> +exit 2
>> diff --git a/test/unittest/pid/err.needed.sh b/test/unittest/pid/err.needed.sh
>> new file mode 100755
>> index 000000000..d6b041b60
>> --- /dev/null
>> +++ b/test/unittest/pid/err.needed.sh
>> @@ -0,0 +1,23 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +
>> +# We should not be able to trace on a hlt instruction.
>> +#
>> +# (When the probe is "needed" -- that is, explicitly requested by the user
>> +# -- we should incur an error.  Test tst.entry_off0.sh should be okay,
>> +# since dtrace will silently skip over such problematic instructions.)
>> +
>> +dtrace=$1
>> +trig=`pwd`/test/triggers/ustack-tst-basic
>> +off=`${OBJDUMP} -d $trig | awk '/hlt/ {sub(/:/, ""); print $1}'`
>> +
>> +$dtrace $dt_flags -c $trig -n 'pid$target:a.out:-:'$off'
>> +{
>> +	trace("hlt instruction");
>> +	exit(0);
>> +}'
>> diff --git a/test/unittest/pid/err.needed.x86_64.x b/test/unittest/pid/err.needed.x86_64.x
>> new file mode 100755
>> index 000000000..158336d98
>> --- /dev/null
>> +++ b/test/unittest/pid/err.needed.x86_64.x
>> @@ -0,0 +1,6 @@
>> +#!/bin/sh
>> +if ! ${OBJDUMP} -d test/triggers/ustack-tst-basic | grep hlt; then
>> +    echo "did not find hlt instruction in trigger"
>> +    exit 2
>> +fi
>> +exit 0
>> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
>> index 1a4c3d207..304be4568 100755
>> --- a/test/unittest/pid/tst.entry_off0.sh
>> +++ b/test/unittest/pid/tst.entry_off0.sh
>> @@ -1,14 +1,14 @@
>>   #!/bin/bash
>>   #
>>   # Oracle Linux DTrace.
>> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>> +# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
>>   # Licensed under the Universal Permissive License v 1.0 as shown at
>>   # http://oss.oracle.com/licenses/upl.
>>   #
>>   
>>   # Although the D script takes only "one second," it takes a long time to
>>   # shut down.  Until that has been solved, increase the timeout for the test.
>> -# @@timeout: 120
>> +# @@timeout: 240
>>   
>>   dtrace=$1
>>   
>> -- 
>> 2.47.3
>>
